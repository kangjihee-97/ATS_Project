package com.ats.project.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.ats.project.model.PostingVO;

@Mapper
public interface PostingDAO {
    List<PostingVO> getPostingList();
    PostingVO       getPosting(int postingId);
    int             insertPosting(PostingVO vo);
    int             updatePosting(PostingVO vo);
    int             closePosting(int postingId);
    int             deleteEvalsByPosting(int postingId);
    int             deleteSchedulesByPosting(int postingId);
    int             deleteStageHistoryByPosting(int postingId);
    int             deleteApplicationsByPosting(int postingId);
    int             deletePosting(int postingId);
    int             autoCloseExpired();
}