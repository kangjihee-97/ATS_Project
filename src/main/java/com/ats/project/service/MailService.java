package com.ats.project.service;

public interface MailService {
    void sendPassMail(String toEmail, String applicantName, String postingTitle);
    void sendFailMail(String toEmail, String applicantName, String postingTitle);
    void sendInterviewMail(String toEmail, String applicantName,
                           String postingTitle, String scheduledAt, String location);
}