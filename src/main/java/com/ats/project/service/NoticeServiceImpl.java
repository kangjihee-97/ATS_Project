package com.ats.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.ats.project.dao.NoticeDAO;
import com.ats.project.model.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired private NoticeDAO noticeDAO;

    @Override public List<NoticeVO> getNoticeList()          { return noticeDAO.getNoticeList(); }
    @Override public NoticeVO       getNotice(int id)        { return noticeDAO.getNotice(id); }
    @Override public int            insertNotice(NoticeVO vo){ return noticeDAO.insertNotice(vo); }
    @Override public int            updateNotice(NoticeVO vo){ return noticeDAO.updateNotice(vo); }
    @Override public int            deleteNotice(int id)     { return noticeDAO.deleteNotice(id); }
}