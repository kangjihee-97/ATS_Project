package com.ats.project.service;

import com.ats.project.dao.StatsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StatsServiceImpl implements StatsService {

	@Autowired
	private StatsDAO statsDAO;

	@Override
	public List<Map<String, Object>> getStageStats() {
		return statsDAO.getStageStats();
	}

	@Override
	public List<Map<String, Object>> getPostingStats() {
		return statsDAO.getPostingStats();
	}

	@Override
	public List<Map<String, Object>> getMonthlyStats() {
		return statsDAO.getMonthlyStats();
	}

	@Override
	public Map<String, Object> getPassRate() {
		return statsDAO.getPassRate();
	}

	@Override
	public List<Map<String, Object>> getInterviewerStats() {
		return statsDAO.getInterviewerStats();
	}

	@Override
	public Map<String, Object> getTimeToHire() {
		return statsDAO.getTimeToHire();
	}

	@Override
	public List<Map<String, Object>> getPostingPassFailStats() {
		return statsDAO.getPostingPassFailStats();
	}

	@Override
	public Map<String, Object> getFunnelStats() {
		return statsDAO.getFunnelStats();
	}

	@Override
	public List<Map<String, Object>> getRejectReasonTop5() {
		return statsDAO.getRejectReasonTop5();
	}
}