package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.ats.project.service.ApplicationService;
import com.ats.project.service.PipelineService;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/pipeline")
public class PipelineController {

	@Autowired
	private ApplicationService applicationService;

	@Autowired
	private PipelineService pipelineService;

	/* 파이프라인 칸반 화면 */
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";
		model.addAttribute("list", applicationService.getPipelineList());
		model.addAttribute("historyList", applicationService.getHistoryList());
		return "pipeline/list";
	}

	@GetMapping("/history")
	public String history(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "ALL") String filter,
			Model model, HttpSession session) {

		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";

		int size = 10;
		int offset = (page - 1) * size;

		String filterParam = "ALL".equals(filter) ? null : filter;

		List<com.ats.project.model.ApplicationVO> list = applicationService.getHistoryListPaged(offset, size,
				filterParam);
		int totalCount = applicationService.getHistoryCount(filterParam);
		int totalPages = (int) Math.ceil((double) totalCount / size);

		model.addAttribute("historyList", list);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentFilter", filter);

		// 전체 합격/불합격 카운트 (필터 무관)
		int passedCount = applicationService.getHistoryCount("PASSED");
		int rejectedCount = applicationService.getHistoryCount("REJECTED");
		model.addAttribute("passedCount", passedCount);
		model.addAttribute("rejectedCount", rejectedCount);

		return "pipeline/history";
	}

	/* 단계 변경 (Ajax) — rejectReason 추가 */
	@PostMapping("/move")
	@ResponseBody
	public Map<String, String> move(@RequestParam int applicationId, @RequestParam String stage,
			@RequestParam(required = false) String rejectReason, HttpSession session) {

		com.ats.project.model.ApplicationVO current = applicationService.getApplication(applicationId);

		com.ats.project.model.StageHistoryVO vo = new com.ats.project.model.StageHistoryVO();
		com.ats.project.model.UserVO loginUser = (com.ats.project.model.UserVO) session.getAttribute("loginUser");

		vo.setApplicationId(applicationId);
		vo.setBeforeStage(current != null ? current.getStage() : null);
		vo.setAfterStage(stage);
		vo.setChangedBy(loginUser != null ? loginUser.getUserId() : "SYSTEM");
		vo.setNote(rejectReason);

		pipelineService.changeApplicationStage(vo);
		return Map.of("result", "success");
	}

	@PostMapping("/moveAndRedirect")
	public String moveAndRedirect(@RequestParam int applicationId, @RequestParam String stage, HttpSession session) {

		com.ats.project.model.ApplicationVO current = applicationService.getApplication(applicationId);

		com.ats.project.model.StageHistoryVO vo = new com.ats.project.model.StageHistoryVO();
		com.ats.project.model.UserVO loginUser = (com.ats.project.model.UserVO) session.getAttribute("loginUser");

		vo.setApplicationId(applicationId);
		vo.setBeforeStage(current != null ? current.getStage() : null);
		vo.setAfterStage(stage);
		vo.setChangedBy(loginUser != null ? loginUser.getUserId() : "SYSTEM");

		pipelineService.changeApplicationStage(vo);

		return "redirect:/application/detail/" + applicationId;
	}

	@PostMapping("/deleteHistory")
	@ResponseBody
	public Map<String, String> deleteHistory(@RequestBody Map<String, List<Integer>> body) {
		List<Integer> ids = body.get("ids");
		if (ids != null) {
			for (int id : ids) {
				applicationService.resetStage(id);
			}
		}
		return Map.of("result", "success");
	}
}