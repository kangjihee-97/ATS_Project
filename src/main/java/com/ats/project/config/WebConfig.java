package com.ats.project.config;

import com.ats.project.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**") // 모든 경로 적용
				.excludePathPatterns("/intro", "/user/login", // 로그인 페이지
						"/user/register", // 회원가입
						"/user/idCheck", // 아이디 중복확인
						"/user/emailCheck", // 이메일 중복확인
						"/user/phoneCheck", // 연락처 중복확인
						"/user/verifyIdentity", // 비밀번호 찾기 본인확인
						"/user/resetPasswordByEmail", // 비밀번호 재설정
						"/img/**", // 이미지 정적 리소스
						"/css/**", // CSS
						"/js/**", // JS
						"/resources/**" // 기타 정적 리소스
				);
	}
}