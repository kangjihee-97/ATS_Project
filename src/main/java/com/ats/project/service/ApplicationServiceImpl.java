package com.ats.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.ats.project.dao.ApplicationDAO;
import com.ats.project.model.ApplicationVO;
import com.ats.project.model.PostingVO;

@Service
public class ApplicationServiceImpl implements ApplicationService {

	@Autowired
	private ApplicationDAO applicationDAO;

	@Override
	public List<ApplicationVO> getApplicationList() {
		return applicationDAO.getApplicationList();
	}

	@Override
	public ApplicationVO getApplication(int applicationId) {
		return applicationDAO.getApplication(applicationId);
	}

	@Override
	public List<ApplicationVO> getPipelineList() {
		return applicationDAO.getPipelineList();
	}

	@Override
	public int insertApplication(ApplicationVO vo) {
		return applicationDAO.insertApplication(vo);
	}

	@Override
	public int updateStage(int applicationId, String stage, String rejectReason) {
		ApplicationVO vo = new ApplicationVO();
		vo.setApplicationId(applicationId);
		vo.setStage(stage);
		vo.setRejectReason(rejectReason);
		return applicationDAO.updateStage(vo);
	}

	@Override
	public List<PostingVO> getOpenPostingList() {
		return applicationDAO.getOpenPostingList();
	}

	@Override
	public List<ApplicationVO> getHistoryList() {
		return applicationDAO.getHistoryList();
	}

	@Override
	public List<ApplicationVO> getHistoryListPaged(int offset, int size, String filter) {
		return applicationDAO.getHistoryListPaged(offset, size, filter);
	}

	@Override
	public int getHistoryCount(String filter) {
		return applicationDAO.getHistoryCount(filter);
	}

	@Override
	public void resetStage(int applicationId) {
		applicationDAO.resetStage(applicationId);
	}

}