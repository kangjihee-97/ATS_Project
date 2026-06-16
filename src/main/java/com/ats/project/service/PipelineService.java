package com.ats.project.service;

import com.ats.project.model.StageHistoryVO;

public interface PipelineService {
    // 전형 단계 변경 및 이력 적재 처리
    boolean changeApplicationStage(StageHistoryVO vo);
}