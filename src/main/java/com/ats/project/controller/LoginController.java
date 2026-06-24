package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ats.project.model.UserVO;
import com.ats.project.service.UserService;
import java.util.Map;
import java.util.HashMap;

@Controller
@RequestMapping("/user")
public class LoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder; // ← BCrypt 추가

	@GetMapping("/login")
	public String loginForm() {
		return "user/login";
	}

	@GetMapping("/emailCheck") // 실제 URL: /user/emailCheck ✓
	@ResponseBody
	public int emailCheck(@RequestParam String email) {
		if (email == null || email.trim().isEmpty())
			return 0;
		return userService.countByEmail(email.trim());
	}

	@GetMapping("/phoneCheck") // 실제 URL: /user/phoneCheck ✓
	@ResponseBody
	public int phoneCheck(@RequestParam String phone) {
		if (phone == null || phone.trim().isEmpty())
			return 0;
		return userService.countByPhone(phone.trim());
	}

	@PostMapping("/login")
	public String loginProc(@ModelAttribute UserVO vo, HttpSession session, Model model) {

		// 아이디로 유저 조회
		UserVO user = userService.login(vo);

		// 아이디 없으면 실패
		if (user == null) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
			model.addAttribute("mode", "login");
			return "user/login";
		}

		// BCrypt 비밀번호 검증 ← 추가
		if (!passwordEncoder.matches(vo.getPassword(), user.getPassword())) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
			model.addAttribute("mode", "login");
			return "user/login";
		}

		// 로그인 성공
		String role = user.getRole();
		boolean isMaster = "MASTER".equals(role);
		boolean isHrRep = "HR_REP".equals(role) || isMaster;
		boolean isInterviewer = "INTERVIEWER".equals(role) || isMaster;
		boolean isTester = "TESTER".equals(role);

		session.setAttribute("loginUser", user);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("userName", user.getName());
		session.setAttribute("userRole", role);
		session.setAttribute("isMaster", isMaster);
		session.setAttribute("isAdmin", isHrRep);
		session.setAttribute("isHrRep", isHrRep);
		session.setAttribute("isInterviewer", isInterviewer);
		session.setAttribute("isTester", isTester);

		return "redirect:/dashboard";
	}

	@GetMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam String userId) {
		return userService.idCheck(userId);
	}

	@GetMapping("/checkPhone")
	@ResponseBody
	public boolean checkPhoneDup(@RequestParam String phone) {
		return userService.checkPhoneDup(phone);
	}

	@GetMapping("/checkEmail")
	@ResponseBody
	public boolean checkEmailDup(@RequestParam String email) {
		return userService.checkEmailDup(email);
	}

	@PostMapping("/register")
	public String registerProc(@ModelAttribute UserVO vo, RedirectAttributes rttr) {
		if (userService.idCheck(vo.getUserId()) > 0) {
			rttr.addFlashAttribute("msg", "이미 사용 중인 아이디입니다.");
			rttr.addFlashAttribute("mode", "register");
			return "redirect:/user/login";
		}
		if (userService.checkPhoneDup(vo.getPhone())) {
			rttr.addFlashAttribute("msg", "이미 등록된 연락처입니다.");
			rttr.addFlashAttribute("mode", "register");
			return "redirect:/user/login";
		}
		// 비밀번호 암호화는 UserServiceImpl.register() 에서 처리
		userService.register(vo);
		rttr.addFlashAttribute("msg", "회원가입이 완료됐습니다. 로그인해 주세요.");
		rttr.addFlashAttribute("mode", "login");
		return "redirect:/user/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/login";
	}


	/* 비밀번호 현재값 검증 (마이페이지 비밀번호 변경 시) */
	@PostMapping("/verifyPassword")
	@ResponseBody
	public boolean verifyPassword(@RequestParam String password, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null)
			return false;

		UserVO user = userService.getUserDetail(userId);
		if (user == null)
			return false;

		// BCrypt matches() 로 검증 ← 추가
		return passwordEncoder.matches(password, user.getPassword());
	}

	/* 비밀번호 재설정 */
	@PostMapping("/changePassword")
	@ResponseBody
	public boolean changePassword(@RequestParam String newPassword, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null)
			return false;

		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setPassword(newPassword);
		// 암호화는 UserServiceImpl.updatePassword() 에서 처리
		int result = userService.updatePassword(vo);
		return result > 0;
	}

	/* 개인정보 수정 */
	@PostMapping("/updateMyInfo")
	@ResponseBody
	public boolean updateMyInfo(@RequestParam String email, @RequestParam String phone, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null)
			return false;

		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setEmail(email);
		vo.setPhone(phone);
		return userService.updateMyInfo(vo) > 0;
	}

	/* 비밀번호 찾기 - 본인 확인 */
	@PostMapping("/verifyIdentity")
	@ResponseBody
	public Map<String, Object> verifyIdentity(@RequestParam String userId, @RequestParam String email) {

		Map<String, Object> result = new HashMap<>();
		UserVO user = userService.findUserByIdAndEmail(userId, email);
		if (user != null) {
			result.put("success", true);
			result.put("name", user.getName());
		} else {
			result.put("success", false);
			result.put("message", "일치하는 계정 정보가 없습니다.");
		}
		return result;
	}

	/* 비밀번호 찾기 - 재설정 */
	@PostMapping("/resetPasswordByEmail")
	@ResponseBody
	public Map<String, Object> resetPasswordByEmail(@RequestParam String userId, @RequestParam String email,
			@RequestParam String newPassword) {

		Map<String, Object> result = new HashMap<>();
		UserVO user = userService.findUserByIdAndEmail(userId, email);
		if (user == null) {
			result.put("success", false);
			result.put("message", "본인 확인에 실패했습니다.");
			return result;
		}
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setPassword(newPassword);
		// 암호화는 UserServiceImpl.updatePassword() 에서 처리
		userService.updatePassword(vo);
		result.put("success", true);
		return result;
	}
}