package com.ats.project.model;

public class ApplicationVO {
	private int applicationId;
	private int postingId;
	private String postingTitle;
	private String applicantName;
	private String email;
	private String phone;
	private int careerYear;
	private String coverLetter;
	private String stage;
	private String appliedAt;
	private String resumePath; // ← 추가
	private String resumeOriginalName; // ← 추가
	private String rejectReason;
	private String decidedAt;
	private String failStage;
	private int applyCount;

	public String getFailStage() {
		return failStage;
	}

	public void setFailStage(String failStage) {
		this.failStage = failStage;
	}

	public int getApplyCount() {
		return applyCount;
	}

	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}

	public int getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(int v) {
		applicationId = v;
	}

	public int getPostingId() {
		return postingId;
	}

	public void setPostingId(int v) {
		postingId = v;
	}

	public String getPostingTitle() {
		return postingTitle;
	}

	public void setPostingTitle(String v) {
		postingTitle = v;
	}

	public String getApplicantName() {
		return applicantName;
	}

	public void setApplicantName(String v) {
		applicantName = v;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String v) {
		email = v;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String v) {
		phone = v;
	}

	public int getCareerYear() {
		return careerYear;
	}

	public void setCareerYear(int v) {
		careerYear = v;
	}

	public String getCoverLetter() {
		return coverLetter;
	}

	public void setCoverLetter(String v) {
		coverLetter = v;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String v) {
		stage = v;
	}

	public String getAppliedAt() {
		return appliedAt;
	}

	public void setAppliedAt(String v) {
		appliedAt = v;
	}

	public String getResumePath() {
		return resumePath;
	}

	public void setResumePath(String v) {
		resumePath = v;
	}

	public String getResumeOriginalName() {
		return resumeOriginalName;
	}

	public void setResumeOriginalName(String v) {
		resumeOriginalName = v;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	public String getDecidedAt() {
		return decidedAt;
	}

	public void setDecidedAt(String decidedAt) {
		this.decidedAt = decidedAt;
	}
}