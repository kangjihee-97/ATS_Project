package com.ats.project.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.ats.project.model.ApplicationVO;
import com.ats.project.model.EvalVO;

@Mapper
public interface EvalDAO {
    List<EvalVO>        getEvalList();
    List<EvalVO>        getEvalListByInterviewer(String interviewerId);
    EvalVO              getEval(int evalId);
    List<EvalVO>        getEvalsByApplication(int applicationId);
    int                 insertEval(EvalVO vo);
    int                 updateEval(EvalVO vo);
    int                 checkDuplicate(EvalVO vo);
    List<ApplicationVO> getApplicationList();
}