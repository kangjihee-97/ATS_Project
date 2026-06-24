package com.ats.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;
import com.ats.project.dao.DashboardDAO;
import com.ats.project.model.ApplicationVO;

@Service
public class DashboardServiceImpl implements DashboardService {

	@Autowired
	private DashboardDAO dashboardDAO;

	@Override
	public int getTotalCount() {
		return dashboardDAO.getTotalCount();
	}

	@Override
	public int getReceivedCount() {
		return dashboardDAO.getReceivedCount();
	}

	@Override
	public int getInterviewCount() {
		return dashboardDAO.getInterviewCount();
	}

	@Override
	public int getFinalCount() {
		return dashboardDAO.getFinalCount();
	}

	@Override
	public int getFailCount() {
		return dashboardDAO.getFailCount();
	}

	@Override
	public int getTodayInterview() {
		return dashboardDAO.getTodayInterview();
	}

	@Override
	public int getOpenPostings() {
		return dashboardDAO.getOpenPostings();
	}

	@Override
	public List<Map<String, Object>> getPostingStats() {
		return dashboardDAO.getPostingStats();
	}

	@Override
	public List<ApplicationVO> getRecentList() {
		return dashboardDAO.getRecentList();
	}

	@Override
	public List<Map<String, Object>> getMonthlyStats() {
		return dashboardDAO.getMonthlyStats();
	}

	@Override
	public int getDocPassCount() {
		return dashboardDAO.getDocPassCount();
	}
}