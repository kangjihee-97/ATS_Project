package com.ats.project.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.ats.project.model.ApplicationVO;
import com.ats.project.model.PostingVO;
import com.ats.project.model.StageHistoryVO;
import java.util.Map;


@Mapper
public interface ApplicationDAO {
	List<ApplicationVO> getApplicationList();

	ApplicationVO getApplication(int applicationId);

	List<ApplicationVO> getPipelineList();

	int insertApplication(ApplicationVO vo);

	int updateStage(ApplicationVO vo);

	List<PostingVO> getOpenPostingList();

	int insertStageHistory(StageHistoryVO vo);

	List<ApplicationVO> getHistoryList();

	int resetStage(int applicationId);

	List<ApplicationVO> getHistoryList(Map<String, Object> params);

	int getHistoryCount(Map<String, Object> params);

	Map<String, Object> getHistorySummary();
}