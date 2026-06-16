package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.net.URI;
import java.net.http.*;
import java.util.*;

@RestController
@RequestMapping("/ai")
public class AiController {

	@Value("${gemini.api.key:}")
	private String apiKey;

	/* ── 기본값 제거 (콜론 파싱 충돌 방지) ── */
	@Value("${gemini.api.url:}")
	private String apiUrl;

	/* ── 공통: Gemini API 호출 ── */
	private String callGemini(String prompt) throws Exception {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> part = Map.of("text", prompt);
		Map<String, Object> content = Map.of("parts", List.of(part));
		Map<String, Object> body = Map.of("contents", List.of(content));

		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(apiUrl + "?key=" + apiKey))
				.header("Content-Type", "application/json")
				.POST(HttpRequest.BodyPublishers.ofString(mapper.writeValueAsString(body))).build();

		HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

		/* 응답 파싱 */
		Map<?, ?> resMap = mapper.readValue(response.body(), Map.class);
		List<?> candidates = (List<?>) resMap.get("candidates");

		if (candidates == null || candidates.isEmpty())
			throw new RuntimeException("응답 없음: " + response.body());

		Map<?, ?> first = (Map<?, ?>) candidates.get(0);
		Map<?, ?> cnt = (Map<?, ?>) first.get("content");
		List<?> parts = (List<?>) cnt.get("parts");
		Map<?, ?> p0 = (Map<?, ?>) parts.get(0);

		return (String) p0.get("text");
	}

	/* ── API 키·URL 유효성 확인 ── */
	private String checkKey() {
		if (apiKey == null || apiKey.isBlank())
			return "Gemini API 키가 설정되지 않았습니다.";
		if (apiUrl == null || apiUrl.isBlank())
			return "Gemini API URL이 설정되지 않았습니다. application.properties를 확인하세요.";
		return null;
	}

	/*
	 * ────────────────────────────────────── 1. 대시보드 채용 현황 분석
	 * ──────────────────────────────────────
	 */
	@PostMapping("/dashboard-report")
	public Map<String, String> dashboardReport(@RequestBody Map<String, Object> data, HttpSession session) {

		Map<String, String> result = new HashMap<>();

		if (session.getAttribute("loginUser") == null) {
			result.put("error", "로그인이 필요합니다.");
			return result;
		}
		String keyErr = checkKey();
		if (keyErr != null) {
			result.put("error", keyErr);
			return result;
		}

		try {
			String prompt = String.format("""
					당신은 HR 채용 분석 전문가입니다.
					아래 채용 현황 데이터를 분석하고 한국어로 인사이트를 제공해주세요.

					[현재 채용 현황]
					- 전체 지원자: %s명
					- 서류 검토 중: %s명
					- 면접 진행 중: %s명
					- 최종 합격자: %s명
					- 불합격자: %s명
					- 진행 중인 공고: %s건

					아래 형식으로 작성해주세요 (총 250자 이내):
					📊 현황 요약: (1-2문장)
					💡 주목할 점: (2가지, 각 1문장)
					✅ 추천 행동: (1-2가지)
					""", data.getOrDefault("total", 0), data.getOrDefault("received", 0),
					data.getOrDefault("interview", 0), data.getOrDefault("finalCount", 0), data.getOrDefault("fail", 0),
					data.getOrDefault("openPostings", 0));
			result.put("report", callGemini(prompt));

		} catch (Exception e) {
			result.put("error", "AI 분석 중 오류: " + e.getMessage());
		}
		return result;
	}

	/*
	 * ────────────────────────────────────── 2. 지원자 자기소개서 분석
	 * ──────────────────────────────────────
	 */
	@PostMapping("/applicant-report")
	public Map<String, String> applicantReport(@RequestBody Map<String, Object> data, HttpSession session) {

		Map<String, String> result = new HashMap<>();

		if (session.getAttribute("loginUser") == null) {
			result.put("error", "로그인이 필요합니다.");
			return result;
		}
		String keyErr = checkKey();
		if (keyErr != null) {
			result.put("error", keyErr);
			return result;
		}

		try {
			String prompt = String.format("""
					당신은 HR 채용 전문가입니다.
					아래 지원자 정보를 분석하고 한국어로 답변해주세요.

					[지원자 정보]
					- 이름: %s
					- 지원 공고: %s
					- 경력: %s
					- 현재 단계: %s
					- 자기소개서: %s

					아래 형식으로 작성해주세요 (총 300자 이내):
					📋 요약: (이 지원자를 한 문장으로)
					💪 강점: (2가지)
					❓ 면접 추천 질문: (1~2가지)
					""", data.getOrDefault("name", "미입력"), data.getOrDefault("posting", "미입력"),
					data.getOrDefault("career", "미입력"), data.getOrDefault("stage", "미입력"),
					data.getOrDefault("coverLetter", "자기소개서 없음"));
			result.put("report", callGemini(prompt));

		} catch (Exception e) {
			result.put("error", "AI 분석 중 오류: " + e.getMessage());
		}
		return result;
	}
}