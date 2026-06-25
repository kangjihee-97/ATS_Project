package com.ats.project.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.ats.project.model.ApplicationVO;
import com.ats.project.model.PostingVO;
import com.ats.project.model.StageHistoryVO;

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

	int getHistoryCount(String filter);

	List<ApplicationVO> getHistoryListPaged(int offset, int size, String filter);
}