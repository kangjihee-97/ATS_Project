package com.ats.project.controller;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.ats.project.model.ApplicationVO;
import com.ats.project.service.ApplicationService;
import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.HashMap;

@Controller
@RequestMapping("/application")
public class ApplicationController {

	@Autowired
	private ApplicationService applicationService;

	@Value("${file.upload.path}")
	private String uploadPath;

	/* ── 지원자 목록 ── */
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";
		model.addAttribute("list", applicationService.getApplicationList());
		return "application/list";
	}

	/* ── 지원서 등록 화면 ── */
	@GetMapping("/write")
	public String writeForm(Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";
		model.addAttribute("postingList", applicationService.getOpenPostingList());
		return "application/write";
	}

	/* ── 지원서 등록 처리 (파일 포함) ── */
	@PostMapping("/write")
	public String write(@ModelAttribute ApplicationVO vo,
			@RequestParam(value = "resumeFile", required = false) MultipartFile resumeFile, HttpSession session)
			throws IOException {

		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";

		/* 파일 업로드 처리 */
		if (resumeFile != null && !resumeFile.isEmpty()) {
			String originalName = resumeFile.getOriginalFilename();
			String ext = originalName.substring(originalName.lastIndexOf("."));
			String savedName = UUID.randomUUID().toString() + ext;

			// 저장 폴더 생성
			Path dir = Paths.get(uploadPath + "resume/");
			if (!Files.exists(dir))
				Files.createDirectories(dir);

			// 파일 저장
			resumeFile.transferTo(dir.resolve(savedName).toFile());

			vo.setResumePath("resume/" + savedName);
			vo.setResumeOriginalName(originalName);
		}

		applicationService.insertApplication(vo);
		return "redirect:/application/list";
	}

	/* ── 지원자 상세 ── */
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";
		model.addAttribute("app", applicationService.getApplication(id));
		return "application/detail";
	}

	/* ── 이력서 다운로드 ── */
	@GetMapping("/resume/{id}")
	public void downloadResume(@PathVariable int id, HttpServletResponse response, HttpSession session)
			throws IOException {
		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("/user/login");
			return;
		}

		ApplicationVO app = applicationService.getApplication(id);
		if (app == null || app.getResumePath() == null) {
			response.sendError(404, "파일을 찾을 수 없습니다.");
			return;
		}

		File file = new File(uploadPath + app.getResumePath());
		if (!file.exists()) {
			response.sendError(404, "파일이 서버에 없습니다.");
			return;
		}

		String filename = URLEncoder.encode(app.getResumeOriginalName(), StandardCharsets.UTF_8).replace("+", "%20");

		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + filename);
		response.setContentLengthLong(file.length());

		try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
			byte[] buf = new byte[4096];
			int len;
			while ((len = fis.read(buf)) != -1)
				os.write(buf, 0, len);
		}
	}

	/* ── 이력서 텍스트 추출 (DOCX) ── */
	@GetMapping("/resume/text/{id}")
	@ResponseBody
	public Map<String, String> getResumeText(@PathVariable int id, HttpSession session) {
		Map<String, String> result = new HashMap<>();
		if (session.getAttribute("loginUser") == null) {
			result.put("error", "로그인이 필요합니다.");
			return result;
		}
		ApplicationVO app = applicationService.getApplication(id);
		if (app == null || app.getResumePath() == null) {
			result.put("error", "이력서가 없습니다.");
			return result;
		}
		File file = new File(uploadPath + app.getResumePath());
		if (!file.exists()) {
			result.put("error", "파일을 찾을 수 없습니다.");
			return result;
		}
		try {
			String ext = app.getResumeOriginalName().substring(app.getResumeOriginalName().lastIndexOf("."))
					.toLowerCase();
			String text = "";
			if (ext.equals(".docx")) {
				try (org.apache.poi.xwpf.usermodel.XWPFDocument doc = new org.apache.poi.xwpf.usermodel.XWPFDocument(
						new FileInputStream(file))) {
					StringBuilder sb = new StringBuilder();
					for (org.apache.poi.xwpf.usermodel.XWPFParagraph p : doc.getParagraphs()) {
						String t = p.getText();
						if (t != null && !t.isBlank())
							sb.append(t).append("\n");
					}
					text = sb.toString().trim();
				}

			} else if (ext.equals(".pdf")) {
				result.put("text", "[PDF 파일은 미리보기를 지원하지 않습니다. 다운로드 후 확인하세요.]");
				return result;
			} else {
				result.put("text", "[" + ext.toUpperCase().replace(".", "") + " 파일은 미리보기를 지원하지 않습니다.]");
				return result;
			}
			result.put("text", text.isEmpty() ? "이력서 내용을 추출할 수 없습니다." : text);
			result.put("filename", app.getResumeOriginalName());
		} catch (Exception e) {
			result.put("error", "이력서 읽기 오류: " + e.getMessage());
		}
		return result;
	}

	/* ── 엑셀 다운로드 ── */
	@GetMapping("/excel")
	public void downloadExcel(@RequestParam(defaultValue = "applicationId") String sort,
			@RequestParam(defaultValue = "desc") String dir, HttpServletResponse response, HttpSession session)
			throws IOException {

		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("/user/login");
			return;
		}

		List<ApplicationVO> list = applicationService.getApplicationList();
		sortList(list, sort, dir);

		XSSFWorkbook wb = new XSSFWorkbook();
		XSSFSheet sh = wb.createSheet("지원자 목록");

		XSSFCellStyle titleStyle = wb.createCellStyle();
		XSSFFont tf = wb.createFont();
		tf.setBold(true);
		tf.setFontHeightInPoints((short) 14);
		tf.setColor(new XSSFColor(new byte[] { (byte) 61, (byte) 28, (byte) 2 }, null));
		titleStyle.setFont(tf);

		XSSFCellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFillForegroundColor(new XSSFColor(new byte[] { (byte) 92, (byte) 42, (byte) 14 }, null));
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		XSSFFont hf = wb.createFont();
		hf.setBold(true);
		hf.setColor(IndexedColors.WHITE.getIndex());
		hf.setFontHeightInPoints((short) 11);
		headerStyle.setFont(hf);
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		setBorder(headerStyle);

		XSSFCellStyle data = makeDataStyle(wb, false);
		XSSFCellStyle dataAlt = makeDataStyle(wb, true);
		XSSFCellStyle left = makeDataStyle(wb, false);
		left.setAlignment(HorizontalAlignment.LEFT);
		XSSFCellStyle leftAlt = makeDataStyle(wb, true);
		leftAlt.setAlignment(HorizontalAlignment.LEFT);

		String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		Row titleRow = sh.createRow(0);
		titleRow.setHeightInPoints(28);
		Cell tc = titleRow.createCell(0);
		tc.setCellValue("ATS 지원자 목록  (" + today + " | 정렬: " + sortLabel(sort, dir) + ")");
		tc.setCellStyle(titleStyle);
		sh.addMergedRegion(new CellRangeAddress(0, 0, 0, 8));
		sh.createRow(1);

		String[] headers = { "번호", "지원자명", "지원 공고", "이메일", "연락처", "경력", "단계", "지원일", "이력서" };
		Row hr = sh.createRow(2);
		hr.setHeightInPoints(22);
		for (int i = 0; i < headers.length; i++) {
			Cell c = hr.createCell(i);
			c.setCellValue(headers[i]);
			c.setCellStyle(headerStyle);
		}

		int rowNum = 3;
		for (ApplicationVO app : list) {
			Row row = sh.createRow(rowNum);
			row.setHeightInPoints(20);
			boolean alt = (rowNum % 2 == 0);
			XSSFCellStyle ctr = alt ? dataAlt : data, lft = alt ? leftAlt : left;
			createCell(row, 0, String.valueOf(app.getApplicationId()), ctr);
			createCell(row, 1, app.getApplicantName(), lft);
			createCell(row, 2, app.getPostingTitle(), lft);
			createCell(row, 3, app.getEmail(), lft);
			createCell(row, 4, nvl(app.getPhone()), ctr);
			createCell(row, 5, app.getCareerYear() == 0 ? "신입" : app.getCareerYear() + "년", ctr);
			createCell(row, 6, stageLabel(app.getStage()), ctr);
			createCell(row, 7, app.getAppliedAt() == null ? "-" : app.getAppliedAt().substring(0, 10), ctr);
			createCell(row, 8, app.getResumeOriginalName() == null ? "없음" : app.getResumeOriginalName(), lft);
			rowNum++;
		}

		XSSFCellStyle totalStyle = wb.createCellStyle();
		totalStyle.cloneStyleFrom(headerStyle);
		totalStyle.setFillForegroundColor(new XSSFColor(new byte[] { (byte) 139, (byte) 69, (byte) 19 }, null));
		Row totalRow = sh.createRow(rowNum);
		totalRow.setHeightInPoints(20);
		Cell tot = totalRow.createCell(0);
		tot.setCellValue("총 " + list.size() + "명");
		tot.setCellStyle(totalStyle);
		sh.addMergedRegion(new CellRangeAddress(rowNum, rowNum, 0, 8));

		int[] widths = { 1800, 3500, 6000, 6000, 3800, 2000, 3000, 4800, 6000 };
		for (int i = 0; i < widths.length; i++)
			sh.setColumnWidth(i, widths[i]);

		String filename = URLEncoder
				.encode("ATS_지원자목록_" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) + ".xlsx",
						StandardCharsets.UTF_8)
				.replace("+", " %20");
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + filename);
		wb.write(response.getOutputStream());
		wb.close();
	}

	/* ── 헬퍼 메서드 ── */
	private void sortList(List<ApplicationVO> list, String sort, String dir) {
		Comparator<ApplicationVO> cmp = switch (sort) {
		case "applicantName" ->
			Comparator.comparing(ApplicationVO::getApplicantName, Comparator.nullsLast(String::compareTo));
		case "postingTitle" ->
			Comparator.comparing(ApplicationVO::getPostingTitle, Comparator.nullsLast(String::compareTo));
		case "email" -> Comparator.comparing(ApplicationVO::getEmail, Comparator.nullsLast(String::compareTo));
		case "careerYear" -> Comparator.comparingInt(ApplicationVO::getCareerYear);
		case "stage" -> Comparator.comparing(ApplicationVO::getStage, Comparator.nullsLast(String::compareTo));
		case "appliedAt" -> Comparator.comparing(ApplicationVO::getAppliedAt, Comparator.nullsLast(String::compareTo));
		default -> Comparator.comparingInt(ApplicationVO::getApplicationId);
		};
		list.sort("asc".equals(dir) ? cmp : cmp.reversed());
	}

	private XSSFCellStyle makeDataStyle(XSSFWorkbook wb, boolean alt) {
		XSSFCellStyle s = wb.createCellStyle();
		s.setAlignment(HorizontalAlignment.CENTER);
		s.setVerticalAlignment(VerticalAlignment.CENTER);
		s.setFillForegroundColor(alt ? new XSSFColor(new byte[] { (byte) 253, (byte) 248, (byte) 243 }, null)
				: new XSSFColor(new byte[] { (byte) 255, (byte) 255, (byte) 255 }, null));
		s.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		setBorder(s);
		return s;
	}

	private void setBorder(XSSFCellStyle s) {
		s.setBorderBottom(BorderStyle.THIN);
		s.setBorderTop(BorderStyle.THIN);
		s.setBorderLeft(BorderStyle.THIN);
		s.setBorderRight(BorderStyle.THIN);
	}

	private void createCell(Row row, int col, String val, CellStyle style) {
		Cell cell = row.createCell(col);
		cell.setCellValue(val == null ? "-" : val);
		cell.setCellStyle(style);
	}

	private String nvl(String s) {
		return (s == null || s.isBlank()) ? "-" : s;
	}

	private String stageLabel(String s) {
		if (s == null)
			return "-";
		return switch (s) {
		case "RECEIVED" -> "서류접수";
		case "DOC_PASS" -> "서류합격";
		case "INTERVIEW1" -> "1차 면접";
		case "INTERVIEW2" -> "2차 면접";
		case "FINAL" -> "최종합격";
		case "FAIL" -> "불합격";
		default -> s;
		};
	}

	private String sortLabel(String sort, String dir) {
		String col = switch (sort) {
		case "applicantName" -> "지원자명";
		case "postingTitle" -> "공고명";
		case "email" -> "이메일";
		case "careerYear" -> "경력";
		case "stage" -> "단계";
		case "appliedAt" -> "지원일";
		default -> "번호";
		};
		return col + " " + ("asc".equals(dir) ? "오름차순" : "내림차순");
	}
}