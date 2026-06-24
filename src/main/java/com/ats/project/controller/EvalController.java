package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.ats.project.model.EvalVO;
import com.ats.project.model.StageHistoryVO;
import com.ats.project.model.UserVO;
import com.ats.project.service.ApplicationService;
import com.ats.project.service.EvalService;
import com.ats.project.service.PipelineService;
import com.ats.project.model.StageHistoryVO;
import com.ats.project.model.UserVO;
import com.ats.project.service.ApplicationService;
import com.ats.project.service.PipelineService;

@Controller
@RequestMapping("/eval")
public class EvalController {

	@Autowired
	private EvalService evalService;
	@Autowired
	private ApplicationService applicationService;
	@Autowired
	private PipelineService pipelineService;

	/* 평가서 목록 */
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";
		String role = (String) session.getAttribute("userRole");
		String uid = (String) session.getAttribute("userId");
		if ("INTERVIEWER".equals(role))
			model.addAttribute("list", evalService.getEvalListByInterviewer(uid));
		else
			model.addAttribute("list", evalService.getEvalList());
		return "eval/list";
	}

	/* 평가서 작성 화면 */
	@GetMapping("/write")
	public String writeForm(Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";
		model.addAttribute("applicationList", evalService.getApplicationList());
		return "eval/write";
	}

	/* 평가서 작성 처리 */
	@PostMapping("/write")
	public String write(@ModelAttribute EvalVO vo, HttpSession session, Model model) {
		String uid = (String) session.getAttribute("userId");
		vo.setInterviewerId(uid);
		vo.setEvalId(0);

		if (evalService.checkDuplicate(vo)) {
			model.addAttribute("msg", "이미 해당 지원자에 대한 평가서를 작성하셨습니다.");
			model.addAttribute("applicationList", evalService.getApplicationList());
			return "eval/write";
		}

		evalService.insertEval(vo);

		/* 평가 결과에 따라 지원자 단계 자동 변경 */
		applyRecommendToStage(vo, session);

		return "redirect:/eval/list";
	}

	/* 평가서 상세 */
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";
		EvalVO eval = evalService.getEval(id);
		model.addAttribute("eval", eval);
		model.addAttribute("evalList", evalService.getEvalsByApplication(eval.getApplicationId()));
		return "eval/detail";
	}

	/* 평가서 수정 화면 */
	@GetMapping("/edit/{id}")
	public String editForm(@PathVariable int id, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";
		model.addAttribute("eval", evalService.getEval(id));
		model.addAttribute("applicationList", evalService.getApplicationList());
		return "eval/write";
	}

	/* 평가서 수정 처리 */
	@PostMapping("/edit/{id}")
	public String edit(@PathVariable int id, @ModelAttribute EvalVO vo, HttpSession session) {
		vo.setEvalId(id);
		evalService.updateEval(vo);

		/* 평가 결과에 따라 지원자 단계 자동 변경 */
		applyRecommendToStage(vo, session);

		return "redirect:/eval/detail/" + id;
	}

	/* ── 공통: 평가 권고(recommend)에 따라 application stage 변경 ── */
	private void applyRecommendToStage(EvalVO vo, HttpSession session) {
		if (vo.getApplicationId() <= 0 || vo.getRecommend() == null)
			return;

		String newStage;
		if ("PASS".equals(vo.getRecommend())) {
			newStage = "PASSED";
		} else if ("FAIL".equals(vo.getRecommend())) {
			newStage = "REJECTED";
		} else {
			return;
		}

		com.ats.project.model.ApplicationVO current = applicationService.getApplication(vo.getApplicationId());

		UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		StageHistoryVO history = new StageHistoryVO();
		history.setApplicationId(vo.getApplicationId());
		history.setBeforeStage(current != null ? current.getStage() : null);
		history.setAfterStage(newStage);
		history.setChangedBy(loginUser != null ? loginUser.getUserId() : "SYSTEM");

		// 불합격 권고 시 종합 의견을 불합격 사유로 사용
		if ("REJECTED".equals(newStage)) {
			String comment = vo.getComment();
			if (comment == null || comment.trim().isEmpty()) {
				comment = "면접 평가 결과 불합격";
			}
			history.setNote(comment);
		} else {
			history.setNote(null);
		}

		pipelineService.changeApplicationStage(history);
	}
}