package com.ats.project.model;

public class EvalVO {
    private int    evalId;
    private int    applicationId;
    private String applicantName;
    private String postingTitle;
    private String interviewerId;
    private String interviewerName;
    private int    techScore;
    private int    commScore;
    private int    solveScore;
    private double avgScore;
    private String comment;
    private String recommend;
    private String evalDate;

    public int    getEvalId()          { return evalId; }
    public void   setEvalId(int v)     { evalId = v; }
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
    public int    getTechScore()       { return techScore; }
    public void   setTechScore(int v)  { techScore = v; }
    public int    getCommScore()       { return commScore; }
    public void   setCommScore(int v)  { commScore = v; }
    public int    getSolveScore()      { return solveScore; }
    public void   setSolveScore(int v) { solveScore = v; }
    public double getAvgScore()        { return avgScore; }
    public void   setAvgScore(double v){ avgScore = v; }
    public String getComment()         { return comment; }
    public void   setComment(String v) { comment = v; }
    public String getRecommend()       { return recommend; }
    public void   setRecommend(String v) { recommend = v; }
    public String getEvalDate()        { return evalDate; }
    public void   setEvalDate(String v){ evalDate = v; }
}