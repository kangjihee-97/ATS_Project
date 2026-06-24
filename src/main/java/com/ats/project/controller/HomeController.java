package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.ats.project.service.DashboardService;

@Controller
public class HomeController {

	@Autowired
	private DashboardService dashboardService;

	/* 기본 접속 */
	@GetMapping("/")
	public String home(HttpSession session) {
		if (session.getAttribute("loginUser") != null)
			return "redirect:/dashboard";
		return "redirect:/intro";
	}

	/* 인트로 페이지 */
	@GetMapping("/intro")
	public String intro() {
		return "intro";
	}

	/* 대시보드 — 모든 데이터 로딩 */
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/intro";
		model.addAttribute("totalCount", dashboardService.getTotalCount());
		model.addAttribute("receivedCount", dashboardService.getReceivedCount());
		model.addAttribute("docPassCount", dashboardService.getDocPassCount());
		model.addAttribute("interviewCount", dashboardService.getInterviewCount());
		model.addAttribute("finalCount", dashboardService.getFinalCount());
		model.addAttribute("failCount", dashboardService.getFailCount());
		model.addAttribute("todayInterview", dashboardService.getTodayInterview());
		model.addAttribute("openPostings", dashboardService.getOpenPostings());
		model.addAttribute("postingStats", dashboardService.getPostingStats());
		model.addAttribute("recentList", dashboardService.getRecentList());
		model.addAttribute("monthlyStats", dashboardService.getMonthlyStats());
		return "common/dashboard";
	}
}