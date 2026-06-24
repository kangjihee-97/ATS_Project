package com.ats.project.model;

public class StageHistoryVO {
    private int    historyId;
    private int    applicationId;
    private String beforeStage;
    private String afterStage;
    private String changedBy;
    private String note;
    private String changedAt;

    public int    getHistoryId() { return historyId; }
    public void   setHistoryId(int historyId) { this.historyId = historyId; }
    public int    getApplicationId() { return applicationId; }
    public void   setApplicationId(int applicationId) { this.applicationId = applicationId; }
    public String getBeforeStage() { return beforeStage; }
    public void   setBeforeStage(String beforeStage) { this.beforeStage = beforeStage; }
    public String getAfterStage() { return afterStage; }
    public void   setAfterStage(String afterStage) { this.afterStage = afterStage; }
    public String getChangedBy() { return changedBy; }
    public void   setChangedBy(String changedBy) { this.changedBy = changedBy; }
    public String getNote() { return note; }
    public void   setNote(String note) { this.note = note; }
    public String getChangedAt() { return changedAt; }
    public void   setChangedAt(String changedAt) { this.changedAt = changedAt; }
}