package com.ats.project.model;

public class ScheduleVO {
    private int    scheduleId;
    private int    applicationId;
    private String applicantName;
    private String postingTitle;
    private String interviewerId;
    private String interviewerName;
    private String scheduledAt;
    private String location;
    private int    round;
    private String status;
    private String createdAt;

    public int    getScheduleId()      { return scheduleId; }
    public void   setScheduleId(int v) { scheduleId = v; }
    public int    getApplicationId()   { return applicationId; }
    public void   setApplicationId(int v) { applicationId = v; }
    public String getApplicantName()   { return applicantName; }
    public void   setApplicantName(String v) { applicantName = v; }
    public String getPostingTitle()    { return postingTitle; }
    public void   setPostingTitle(String v)  { postingTitle = v; }
    public String getInterviewerId()   { return interviewerId; }
    public void   setInterviewerId(String v) { interviewerId = v; }
    public String getInterviewerName() { return interviewerName; }
    public void   setInterviewerName(String v) { interviewerName = v; }
    public String getScheduledAt()     { return scheduledAt; }
    public void   setScheduledAt(String v)   { scheduledAt = v; }
    public String getLocation()        { return location; }
    public void   setLocation(String v)      { location = v; }
    public int    getRound()           { return round; }
    public void   setRound(int v)      { round = v; }
    public String getStatus()          { return status; }
    public void   setStatus(String v)  { status = v; }
    public String getCreatedAt()       { return createdAt; }
    public void   setCreatedAt(String v)     { createdAt = v; }
}