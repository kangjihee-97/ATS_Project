package com.ats.project.service;

import java.util.List;
import com.ats.project.model.PostingVO;

public interface PostingService {
    List<PostingVO> getPostingList();
    PostingVO       getPosting(int postingId);
    int             insertPosting(PostingVO vo);
    int             updatePosting(PostingVO vo);
    int             closePosting(int postingId);
    void            forceDeletePosting(int postingId); // 강제 삭제
}