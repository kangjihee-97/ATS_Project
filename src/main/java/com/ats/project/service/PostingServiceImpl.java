package com.ats.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import java.util.List;
import com.ats.project.dao.PostingDAO;
import com.ats.project.model.PostingVO;

@Service
public class PostingServiceImpl implements PostingService {

    @Autowired private PostingDAO postingDAO;

    @Override public List<PostingVO> getPostingList()       { return postingDAO.getPostingList(); }
    @Override public PostingVO       getPosting(int id)     { return postingDAO.getPosting(id); }
    @Override public int             insertPosting(PostingVO v) { return postingDAO.insertPosting(v); }
    @Override public int             updatePosting(PostingVO v) { return postingDAO.updatePosting(v); }
    @Override public int             closePosting(int id)   { return postingDAO.closePosting(id); }

    /* 강제 삭제: 관련 데이터 순서대로 삭제 */
    @Override
    public void forceDeletePosting(int postingId) {
        postingDAO.deleteEvalsByPosting(postingId);
        postingDAO.deleteSchedulesByPosting(postingId);
        postingDAO.deleteStageHistoryByPosting(postingId);
        postingDAO.deleteApplicationsByPosting(postingId);
        postingDAO.deletePosting(postingId);
    }

    @Scheduled(cron = "0 0 0 * * *")
    public void autoClose() { postingDAO.autoCloseExpired(); }
}