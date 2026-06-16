package com.ats.project.model;

public class InterviewEvalVO {
    private int    evalId;
    private int    applicationId;
    private String interviewerId;
    private int    techScore;
    private int    commScore;
    private String comments;
    private String evaluatedAt;

    public int    getEvalId() { return evalId; }
    public void   setEvalId(int evalId) { this.evalId = evalId; }
    public int    getApplicationId() { return applicationId; }
    public void   setApplicationId(int applicationId) { this.applicationId = applicationId; }
    public String getInterviewerId() { return interviewerId; }
    public void   setInterviewerId(String interviewerId) { this.interviewerId = interviewerId; }
    public int    getTechScore() { return techScore; }
    public void   setTechScore(int techScore) { this.techScore = techScore; }
    public int    getCommScore() { return commScore; }
    public void   setCommScore(int commScore) { this.commScore = commScore; }
    public String getComments() { return comments; }
    public void   setComments(String comments) { this.comments = comments; }
    public String getEvaluatedAt() { return evaluatedAt; }
    public void   setEvaluatedAt(String evaluatedAt) { this.evaluatedAt = evaluatedAt; }
}