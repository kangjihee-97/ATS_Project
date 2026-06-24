package com.ats.project.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.ats.project.model.NoticeVO;

@Mapper
public interface NoticeDAO {
    List<NoticeVO> getNoticeList();
    NoticeVO       getNotice(int noticeId);
    int            insertNotice(NoticeVO vo);
    int            updateNotice(NoticeVO vo);
    int            deleteNotice(int noticeId);
}