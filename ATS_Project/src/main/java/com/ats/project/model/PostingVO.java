package com.ats.project.model;

public class PostingVO {
    private int    postingId;
    private String title;
    private String department;
    private int    headcount;
    private String requirements;
    private String preferred;
    private String deadline;
    private String status;
    private String createdBy;
    private String createdByName;
    private String createdAt;
    private int    applicantCount;

    public int    getPostingId()       { return postingId; }
    public void   setPostingId(int v)  { postingId = v; }
    public String getTitle()           { return title; }
    public void   setTitle(String v)   { title = v; }
    public String getDepartment()      { return department; }
    public void   setDepartment(String v) { department = v; }
    public int    getHeadcount()       { return headcount; }
    public void   setHeadcount(int v)  { headcount = v; }
    public String getRequirements()    { return requirements; }
    public void   setRequirements(String v) { requirements = v; }
    public String getPreferred()       { return preferred; }
    public void   setPreferred(String v)   { preferred = v; }
    public String getDeadline()        { return deadline; }
    public void   setDeadline(String v)    { deadline = v; }
    public String getStatus()          { return status; }
    public void   setStatus(String v)  { status = v; }
    public String getCreatedBy()       { return createdBy; }
    public void   setCreatedBy(String v)   { createdBy = v; }
    public String getCreatedByName()   { return createdByName; }
    public void   setCreatedByName(String v) { createdByName = v; }
    public String getCreatedAt()       { return createdAt; }
    public void   setCreatedAt(String v)   { createdAt = v; }
    public int    getApplicantCount()  { return applicantCount; }
    public void   setApplicantCount(int v) { applicantCount = v; }
}