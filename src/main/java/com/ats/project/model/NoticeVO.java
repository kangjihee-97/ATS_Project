package com.ats.project.model;

public class NoticeVO {
    private int    noticeId;
    private String title;
    private String content;
    private String createdBy;
    private String createdByName;
    private int    isPinned;
    private String createdAt;
    private String updatedAt;

    public int    getNoticeId()        { return noticeId; }
    public void   setNoticeId(int v)         { noticeId = v; }
    public String getTitle()           { return title; }
    public void   setTitle(String v)         { title = v; }
    public String getContent()         { return content; }
    public void   setContent(String v)       { content = v; }
    public String getCreatedBy()       { return createdBy; }
    public void   setCreatedBy(String v)     { createdBy = v; }
    public String getCreatedByName()   { return createdByName; }
    public void   setCreatedByName(String v) { createdByName = v; }
    public int    getIsPinned()        { return isPinned; }
    public void   setIsPinned(int v)         { isPinned = v; }
    public String getCreatedAt()       { return createdAt; }
    public void   setCreatedAt(String v)     { createdAt = v; }
    public String getUpdatedAt()       { return updatedAt; }
    public void   setUpdatedAt(String v)     { updatedAt = v; }
}