package com.ats.project.controller;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ats.project.model.UserVO;
import com.ats.project.service.UserService;
import com.ats.project.service.MailService;
import java.util.Map;
import java.util.HashMap;

@Controller
@RequestMapping("/user")
public class LoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private MailService mailService;

	@GetMapping("/login")
	public String loginForm() {
		return "user/login";
	}

	@PostMapping("/login")
	public String loginProc(@ModelAttribute UserVO vo, HttpSession session, Model model, HttpServletRequest request) {

		UserVO user = userService.login(vo);

		if (user == null) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
			model.addAttribute("mode", "login");
			return "user/login";
		}

		if (!passwordEncoder.matches(vo.getPassword(), user.getPassword())) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
			model.addAttribute("mode", "login");
			return "user/login";
		}

		if (user.getEmail() == null || user.getEmail().isBlank()) {
			return setSessionAndRedirect(session, user);
		}

		// ✅ 쿠키 확인 → 있으면 인증 스킵
		String cookieName = "VERNALIS_VERIFIED_" + user.getUserId();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (cookieName.equals(c.getName()) && "true".equals(c.getValue())) {
					return setSessionAndRedirect(session, user);
				}
			}
		}

		try {
			String code = mailService.generateCode();
			long expireTime = System.currentTimeMillis() + (3 * 60 * 1000);

			session.setAttribute("verifyCode", code);
			session.setAttribute("verifyExpire", expireTime);
			session.setAttribute("verifyUser", user);

			mailService.sendVerificationCode(user.getEmail(), code);

			model.addAttribute("email", maskEmail(user.getEmail()));
			return "user/verify";

		} catch (Exception e) {
			model.addAttribute("msg", "인증 메일 발송에 실패했습니다. 잠시 후 다시 시도해 주세요.");
			model.addAttribute("mode", "login");
			return "user/login";
		}
	}

	@PostMapping("/verify")
	public String verifyProc(@RequestParam String code, HttpSession session, Model model) {

		String savedCode = (String) session.getAttribute("verifyCode");
		Long expireTime = (Long) session.getAttribute("verifyExpire");
		UserVO user = (UserVO) session.getAttribute("verifyUser");

		if (savedCode == null || user == null) {
			model.addAttribute("msg", "세션이 만료됐습니다. 다시 로그인해 주세요.");
			model.addAttribute("mode", "login");
			return "user/login";
		}

		if (System.currentTimeMillis() > expireTime) {
			session.removeAttribute("verifyCode");
			session.removeAttribute("verifyExpire");
			session.removeAttribute("verifyUser");
			model.addAttribute("msg", "인증번호가 만료됐습니다. 다시 로그인해 주세요.");
			model.addAttribute("mode", "login");
			return "user/login";
		}

		if (!savedCode.equals(code.replaceAll("\\s", ""))) {
			model.addAttribute("email", maskEmail(user.getEmail()));
			model.addAttribute("msg", "인증번호가 올바르지 않습니다.");
			return "user/verify";
		}

		session.removeAttribute("verifyCode");
		session.removeAttribute("verifyExpire");
		session.removeAttribute("verifyUser");

		setSessionAndLogin(session, user);
		return "user/verify_done";
	}

	@PostMapping("/saveTrustCookie")
	@ResponseBody
	public String saveTrustCookie(HttpSession session, HttpServletResponse response) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null)
			return "fail";

		Cookie verifiedCookie = new Cookie("VERNALIS_VERIFIED_" + userId, "true");
		verifiedCookie.setMaxAge(60 * 60 * 24 * 90);
		verifiedCookie.setPath("/");
		response.addCookie(verifiedCookie);
		return "ok";
	}

	@PostMapping("/resendCode")
	public String resendCode(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("verifyUser");

		if (user == null) {
			model.addAttribute("msg", "세션이 만료됐습니다. 다시 로그인해 주세요.");
			model.addAttribute("mode", "login");
			return "user/login";
		}

		try {
			String code = mailService.generateCode();
			long expireTime = System.currentTimeMillis() + (3 * 60 * 1000);
			session.setAttribute("verifyCode", code);
			session.setAttribute("verifyExpire", expireTime);
			mailService.sendVerificationCode(user.getEmail(), code);

			model.addAttribute("email", maskEmail(user.getEmail()));
			model.addAttribute("msg", "인증번호를 재발송했습니다.");
			return "user/verify";

		} catch (Exception e) {
			model.addAttribute("msg", "메일 발송에 실패했습니다.");
			model.addAttribute("mode", "login");
			return "user/login";
		}
	}

	private String maskEmail(String email) {
		int atIdx = email.indexOf("@");
		if (atIdx <= 2)
			return email;
		return email.substring(0, 2) + "*****" + email.substring(atIdx);
	}

	private void setSessionAndLogin(HttpSession session, UserVO user) {
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
	}

	private String setSessionAndRedirect(HttpSession session, UserVO user) {
		setSessionAndLogin(session, user);
		return "redirect:/dashboard";
	}

	@GetMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam String email) {
		if (email == null || email.trim().isEmpty())
			return 0;
		return userService.countByEmail(email.trim());
	}

	@GetMapping("/phoneCheck")
	@ResponseBody
	public int phoneCheck(@RequestParam String phone) {
		if (phone == null || phone.trim().isEmpty())
			return 0;
		return userService.countByPhone(phone.trim());
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

	@PostMapping("/verifyPassword")
	@ResponseBody
	public boolean verifyPassword(@RequestParam String password, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null)
			return false;
		UserVO user = userService.getUserDetail(userId);
		if (user == null)
			return false;
		return passwordEncoder.matches(password, user.getPassword());
	}

	@PostMapping("/changePassword")
	@ResponseBody
	public boolean changePassword(@RequestParam String newPassword, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null)
			return false;
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setPassword(newPassword);
		return userService.updatePassword(vo) > 0;
	}

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
		userService.updatePassword(vo);
		result.put("success", true);
		return result;
	}
}