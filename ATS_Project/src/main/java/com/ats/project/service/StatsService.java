package com.ats.project.service;

import java.util.List;
import java.util.Map;

public interface StatsService {

	List<Map<String, Object>> getStageStats();

	List<Map<String, Object>> getPostingStats();

	List<Map<String, Object>> getMonthlyStats();

	Map<String, Object> getPassRate();

	List<Map<String, Object>> getInterviewerStats();

	Map<String, Object> getTimeToHire();

	List<Map<String, Object>> getPostingPassFailStats();

	Map<String, Object> getFunnelStats();

	List<Map<String, Object>> getRejectReasonTop5();
}