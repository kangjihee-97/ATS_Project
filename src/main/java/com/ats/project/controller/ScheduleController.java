package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.ats.project.model.ScheduleVO;
import com.ats.project.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;

	/* 목록 */
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";
		String role = (String) session.getAttribute("userRole");
		String uid = (String) session.getAttribute("userId");
		if ("INTERVIEWER".equals(role))
			model.addAttribute("list", scheduleService.getScheduleByInterviewer(uid));
		else
			model.addAttribute("list", scheduleService.getScheduleList());
		return "schedule/list";
	}

	/* 등록 화면 */
	@GetMapping("/write")
	public String writeForm(Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";

		var appList = scheduleService.getApplicationList();
		var interList = scheduleService.getInterviewerList();

		model.addAttribute("applicationList", appList);
		model.addAttribute("interviewers", interList);

		// 지원자가 없을 때 안내
		if (appList == null || appList.isEmpty())
			model.addAttribute("appMsg", "면접 가능한 지원자가 없습니다. (서류접수~면접 단계 지원자 필요)");

		return "schedule/write";
	}

	/* 등록 처리 */
	@PostMapping("/write")
	public String write(@ModelAttribute ScheduleVO vo, Model model) {

		// ── 유효성 검사 ────────────────────────────
		if (vo.getApplicationId() <= 0) {
			model.addAttribute("msg", "지원자를 선택해주세요.");
			model.addAttribute("applicationList", scheduleService.getApplicationList());
			model.addAttribute("interviewers", scheduleService.getInterviewerList());
			return "schedule/write";
		}

		if (vo.getInterviewerId() == null || vo.getInterviewerId().isBlank()) {
			model.addAttribute("msg", "면접관을 선택해주세요.");
			model.addAttribute("applicationList", scheduleService.getApplicationList());
			model.addAttribute("interviewers", scheduleService.getInterviewerList());
			return "schedule/write";
		}

		if (vo.getScheduledAt() == null || vo.getScheduledAt().isBlank()) {
			model.addAttribute("msg", "면접 일시를 선택해주세요.");
			model.addAttribute("applicationList", scheduleService.getApplicationList());
			model.addAttribute("interviewers", scheduleService.getInterviewerList());
			return "schedule/write";
		}
		// ─────────────────────────────────────────

		// 시간 충돌 확인
		if (scheduleService.checkConflict(vo)) {
			model.addAttribute("msg", "해당 면접관은 같은 시간대에 이미 일정이 있습니다.");
			model.addAttribute("applicationList", scheduleService.getApplicationList());
			model.addAttribute("interviewers", scheduleService.getInterviewerList());
			return "schedule/write";
		}

		scheduleService.insertSchedule(vo);
		return "redirect:/schedule/list";
	}

	/* 완료 처리 */
	@PostMapping("/done/{id}")
	public String done(@PathVariable int id) {
		scheduleService.doneSchedule(id);
		return "redirect:/schedule/list";
	}

	/* 취소 처리 */
	@PostMapping("/cancel/{id}")
	public String cancel(@PathVariable int id) {
		scheduleService.cancelSchedule(id);
		return "redirect:/schedule/list";
	}


	/* 면접 일시 수정 처리 */
	@PostMapping("/update")
	public String update(@ModelAttribute ScheduleVO vo, Model model, HttpSession session) {

		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";

		// 기존 일정 조회 (interviewer_id, location, round 등 유지)
		ScheduleVO origin = scheduleService.getSchedule(vo.getScheduleId());
		if (origin == null)
			return "redirect:/schedule/list";

		vo.setInterviewerId(origin.getInterviewerId());
		vo.setLocation(origin.getLocation());
		vo.setRound(origin.getRound());

		// 시간 충돌 확인 (자기 자신은 제외)
		if (scheduleService.checkConflict(vo)) {
			return "redirect:/schedule/list?conflict=true";
		}

		scheduleService.updateSchedule(vo);
		return "redirect:/schedule/list";
	}
}