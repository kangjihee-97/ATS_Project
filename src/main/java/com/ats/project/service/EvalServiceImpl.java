package com.ats.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.ats.project.dao.EvalDAO;
import com.ats.project.model.ApplicationVO;
import com.ats.project.model.EvalVO;

@Service
public class EvalServiceImpl implements EvalService {

    @Autowired
    private EvalDAO evalDAO;

    @Override
    public List<EvalVO> getEvalList() {
        return evalDAO.getEvalList();
    }

    @Override
    public List<EvalVO> getEvalListByInterviewer(String interviewerId) {
        return evalDAO.getEvalListByInterviewer(interviewerId);
    }

    @Override
    public EvalVO getEval(int evalId) {
        return evalDAO.getEval(evalId);
    }

    @Override
    public List<EvalVO> getEvalsByApplication(int applicationId) {
        return evalDAO.getEvalsByApplication(applicationId);
    }

    @Override
    public int insertEval(EvalVO vo) {
        return evalDAO.insertEval(vo);
    }

    @Override
    public int updateEval(EvalVO vo) {
        return evalDAO.updateEval(vo);
    }

    @Override
    public boolean checkDuplicate(EvalVO vo) {
        return evalDAO.checkDuplicate(vo) > 0;
    }

    @Override
    public List<ApplicationVO> getApplicationList() {
        return evalDAO.getApplicationList();
    }
}