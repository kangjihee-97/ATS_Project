package com.ats.project.service;
import java.util.List;
import com.ats.project.model.NoticeVO;

public interface NoticeService {
    List<NoticeVO> getNoticeList();
    NoticeVO       getNotice(int noticeId);
    int            insertNotice(NoticeVO vo);
    int            updateNotice(NoticeVO vo);
    int            deleteNotice(int noticeId);
}