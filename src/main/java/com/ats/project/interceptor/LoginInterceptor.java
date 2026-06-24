package com.ats.project.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		Object loginUser = session.getAttribute("loginUser");

		// 미로그인 → 로그인 페이지로
		if (loginUser == null) {
			response.sendRedirect("/user/login");
			return false;
		}

		// TESTER 권한 → 마이페이지 외 차단
		Boolean isTester = Boolean.TRUE.equals(session.getAttribute("isTester"));
		if (isTester) {
			String uri = request.getRequestURI();
			if (!uri.equals("/user/mypage") && !uri.equals("/mypage") && !uri.startsWith("/user/logout")
					&& !uri.startsWith("/user/updateMyInfo") && !uri.startsWith("/user/changePassword")
					&& !uri.startsWith("/user/verifyPassword") && !uri.startsWith("/img/") && !uri.startsWith("/css/")
					&& !uri.startsWith("/js/") && !uri.startsWith("/resources/")) {
				response.sendRedirect("/user/mypage?noAuth=true");
				return false;
			}
		}

		return true;
	}
}