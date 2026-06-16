package com.ats.project.service;

import java.util.List;
import com.ats.project.model.ApplicationVO;
import com.ats.project.model.EvalVO;

public interface EvalService {
    List<EvalVO>        getEvalList();
    List<EvalVO>        getEvalListByInterviewer(String interviewerId);
    EvalVO              getEval(int evalId);
    List<EvalVO>        getEvalsByApplication(int applicationId);
    int                 insertEval(EvalVO vo);
    int                 updateEval(EvalVO vo);
    boolean             checkDuplicate(EvalVO vo);
    List<ApplicationVO> getApplicationList();
}