package com.ats.project.service;

import com.ats.project.dao.ApplicationDAO;
import com.ats.project.model.StageHistoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PipelineServiceImpl implements PipelineService {

	@Autowired
	private ApplicationDAO applicationDAO;

	@Override
	@Transactional
	public boolean changeApplicationStage(StageHistoryVO vo) {
		// 1. 지원서 테이블(application)의 현재 전형 단계 상태 업데이트
		com.ats.project.model.ApplicationVO appVO = new com.ats.project.model.ApplicationVO();
		appVO.setApplicationId(vo.getApplicationId());
		appVO.setStage(vo.getAfterStage());
		appVO.setRejectReason(vo.getNote());
		applicationDAO.updateStage(appVO);

		// 2. 전형 단계 변경 이력 테이블(stage_history)에 로그 적재
		int result = applicationDAO.insertStageHistory(vo);
		return result > 0;
	}
}