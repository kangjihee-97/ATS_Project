package com.ats.project.controller;

import com.ats.project.service.StatsService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.net.URI;
import java.net.http.*;
import java.util.*;

@Controller
public class StatsController {

    @Autowired
    private StatsService statsService;

    @Value("${gemini.api.key:}")
    private String apiKey;

    @Value("${gemini.api.url:}")
    private String apiUrl;

    @GetMapping("/stats")
    public String stats(Model model) {
        model.addAttribute("stageStats",          statsService.getStageStats());
        model.addAttribute("postingStats",         statsService.getPostingStats());
        model.addAttribute("passRate",             statsService.getPassRate());
        model.addAttribute("timeToHire",           statsService.getTimeToHire());
        model.addAttribute("postingPassFailStats", statsService.getPostingPassFailStats());
        model.addAttribute("funnelStats",          statsService.getFunnelStats());
        model.addAttribute("rejectReasonTop5",     statsService.getRejectReasonTop5());
        return "stats/stats";
    }

    @PostMapping("/stats/aiInsight")
    @ResponseBody
    public Map<String, String> aiInsight(@RequestBody Map<String, String> body, HttpSession session) {
        Map<String, String> result = new HashMap<>();

        if (session.getAttribute("loginUser") == null) {
            result.put("error", "로그인이 필요합니다.");
            return result;
        }
        if (apiKey == null || apiKey.isBlank()) {
            result.put("error", "Gemini API 키가 설정되지 않았습니다.");
            return result;
        }
        if (apiUrl == null || apiUrl.isBlank()) {
            result.put("error", "Gemini API URL이 설정되지 않았습니다.");
            return result;
        }

        try {
            String prompt = body.get("prompt");
            ObjectMapper mapper = new ObjectMapper();

            Map<String, Object> part    = Map.of("text", prompt);
            Map<String, Object> content = Map.of("parts", List.of(part));
            Map<String, Object> reqBody = Map.of("contents", List.of(content));

            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(apiUrl + "?key=" + apiKey))
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(mapper.writeValueAsString(reqBody)))
                .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            Map<?, ?> resMap     = mapper.readValue(response.body(), Map.class);
            List<?> candidates   = (List<?>) resMap.get("candidates");

            if (candidates == null || candidates.isEmpty()) {
                result.put("error", "AI 응답이 없습니다.");
                return result;
            }

            Map<?, ?> first = (Map<?, ?>) candidates.get(0);
            Map<?, ?> cnt   = (Map<?, ?>) first.get("content");
            List<?> parts   = (List<?>) cnt.get("parts");
            Map<?, ?> p0    = (Map<?, ?>) parts.get(0);

            result.put("report", (String) p0.get("text"));

        } catch (Exception e) {
            result.put("error", "AI 분석 중 오류: " + e.getMessage());
        }
        return result;
    }
}