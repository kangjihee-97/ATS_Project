package com.ats.project.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
import com.ats.project.model.ApplicationVO;

@Mapper
public interface DashboardDAO {
	int getTotalCount();

	int getReceivedCount();

	int getInterviewCount();

	int getFinalCount();

	int getFailCount();

	int getTodayInterview();

	int getOpenPostings();

	int getDocPassCount();

	List<Map<String, Object>> getPostingStats();

	List<ApplicationVO> getRecentList();

	List<Map<String, Object>> getMonthlyStats();
}