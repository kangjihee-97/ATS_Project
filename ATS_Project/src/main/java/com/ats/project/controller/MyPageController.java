package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ats.project.model.UserVO;
import com.ats.project.service.UserService;

@Controller
public class MyPageController {

	@Autowired
	private UserService userService;

	@GetMapping({ "/mypage", "/user/mypage" })
	public String mypage(HttpSession session, Model model) {
		if (session.getAttribute("loginUser") == null)
			return "redirect:/user/login";
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("user", userService.getUserDetail(userId));
		return "user/mypage";
	}

	@PostMapping({ "/mypage", "/user/mypage" })
	public String updateProfile(@RequestParam String name, @RequestParam String email, @RequestParam String phone,
			@RequestParam(required = false) String role, HttpSession session, RedirectAttributes redirectAttrs) {

		UserVO current = (UserVO) session.getAttribute("loginUser");

		if (role == null || role.isEmpty())
			role = (String) session.getAttribute("userRole");
		if (role == null || role.isEmpty())
			role = "TESTER";

		/* 이메일 중복 확인 */
		UserVO emailCheck = new UserVO();
		emailCheck.setUserId(current.getUserId());
		emailCheck.setEmail(email);
		if (userService.emailCheck(emailCheck) > 0) {
			redirectAttrs.addFlashAttribute("errorMsg", "이미 사용 중인 이메일입니다.");
			return "redirect:/user/mypage";
		}

		/* 연락처 중복 확인 */
		UserVO phoneCheck = new UserVO();
		phoneCheck.setUserId(current.getUserId());
		phoneCheck.setPhone(phone);
		if (userService.phoneCheck(phoneCheck) > 0) {
			redirectAttrs.addFlashAttribute("errorMsg", "이미 사용 중인 연락처입니다.");
			return "redirect:/user/mypage";
		}

		/* DB 업데이트 */
		UserVO update = new UserVO();
		update.setUserId(current.getUserId());
		update.setName(name);
		update.setEmail(email);
		update.setPhone(phone);
		update.setRole(role);

		// 임시 확인용 로그
		System.out.println("=== updateProfile 호출 ===");
		System.out.println("userId: " + update.getUserId());
		System.out.println("role: " + update.getRole());
		System.out.println("name: " + update.getName());

		userService.updateProfile(update);
		userService.updateProfile(update);

		/* 세션 전체 갱신 */
		/* 세션 전체 갱신 */
		boolean isMaster = "MASTER".equals(role);
		boolean isHrRep = "HR_REP".equals(role) || isMaster;
		boolean isInterviewer = "INTERVIEWER".equals(role) || isMaster;
		boolean isTester = "TESTER".equals(role);

		current.setName(name);
		current.setEmail(email);
		current.setPhone(phone);
		current.setRole(role);

		session.setAttribute("loginUser", current);
		session.setAttribute("userName", name);
		session.setAttribute("userRole", role);
		session.setAttribute("isMaster", isMaster);
		session.setAttribute("isAdmin", isHrRep);
		session.setAttribute("isHrRep", isHrRep);
		session.setAttribute("isInterviewer", isInterviewer);
		session.setAttribute("isTester", isTester);

		redirectAttrs.addFlashAttribute("successMsg", "프로필이 수정되었습니다.");
		return "redirect:/user/mypage";
	}
}