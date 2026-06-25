package com.ats.project.service;

import java.util.List;
import com.ats.project.model.ApplicationVO;
import com.ats.project.model.PostingVO;

public interface ApplicationService {
	List<ApplicationVO> getApplicationList();

	ApplicationVO getApplication(int applicationId);

	List<ApplicationVO> getPipelineList();

	int insertApplication(ApplicationVO vo);

	int updateStage(int applicationId, String stage, String rejectReason);

	List<PostingVO> getOpenPostingList();

	List<ApplicationVO> getHistoryList();

	void resetStage(int id);
}