package com.ats.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailServiceImpl implements MailService {

    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    /* 합격 안내 메일 */
    @Override
    public void sendPassMail(String toEmail,
                             String applicantName,
                             String postingTitle) {
        String subject = "[ATS] " + postingTitle + " 서류 합격 안내";
        String content =
            "<div style='font-family:sans-serif;max-width:600px;margin:0 auto'>" +
            "<div style='background:#5c2a0e;padding:20px;text-align:center'>" +
            "<h2 style='color:#fff;margin:0'>ATS 채용 시스템</h2></div>" +
            "<div style='padding:30px;background:#fff'>" +
            "<p style='font-size:16px'>안녕하세요, <strong>" + applicantName + "</strong>님</p>" +
            "<p style='font-size:15px;color:#3d1c02'>" +
            "  <strong>" + postingTitle + "</strong> 서류 전형에 <strong style='color:#16a34a'>합격</strong>하셨습니다." +
            "</p>" +
            "<p>면접 일정은 별도 안내드릴 예정입니다.</p>" +
            "</div>" +
            "<div style='background:#f5ede3;padding:16px;text-align:center;font-size:12px;color:#8b6040'>" +
            "본 메일은 발신 전용입니다.</div></div>";
        send(toEmail, subject, content);
    }

    /* 불합격 안내 메일 */
    @Override
    public void sendFailMail(String toEmail,
                             String applicantName,
                             String postingTitle) {
        String subject = "[ATS] " + postingTitle + " 전형 결과 안내";
        String content =
            "<div style='font-family:sans-serif;max-width:600px;margin:0 auto'>" +
            "<div style='background:#5c2a0e;padding:20px;text-align:center'>" +
            "<h2 style='color:#fff;margin:0'>ATS 채용 시스템</h2></div>" +
            "<div style='padding:30px;background:#fff'>" +
            "<p style='font-size:16px'>안녕하세요, <strong>" + applicantName + "</strong>님</p>" +
            "<p style='font-size:15px;color:#3d1c02'>" +
            "  <strong>" + postingTitle + "</strong> 전형 결과 아쉽게도 " +
            "  <strong style='color:#dc2626'>불합격</strong>하셨습니다." +
            "</p>" +
            "<p>지원해 주신 것에 깊이 감사드리며, 앞으로의 좋은 결과를 응원합니다.</p>" +
            "</div>" +
            "<div style='background:#f5ede3;padding:16px;text-align:center;font-size:12px;color:#8b6040'>" +
            "본 메일은 발신 전용입니다.</div></div>";
        send(toEmail, subject, content);
    }

    /* 면접 일정 안내 메일 */
    @Override
    public void sendInterviewMail(String toEmail,
                                  String applicantName,
                                  String postingTitle,
                                  String scheduledAt,
                                  String location) {
        String subject = "[ATS] " + postingTitle + " 면접 일정 안내";
        String content =
            "<div style='font-family:sans-serif;max-width:600px;margin:0 auto'>" +
            "<div style='background:#5c2a0e;padding:20px;text-align:center'>" +
            "<h2 style='color:#fff;margin:0'>ATS 채용 시스템</h2></div>" +
            "<div style='padding:30px;background:#fff'>" +
            "<p style='font-size:16px'>안녕하세요, <strong>" + applicantName + "</strong>님</p>" +
            "<p style='font-size:15px;color:#3d1c02'>" +
            "  <strong>" + postingTitle + "</strong> 면접 일정을 안내드립니다.</p>" +
            "<table style='width:100%;border-collapse:collapse;margin:20px 0'>" +
            "<tr><td style='padding:10px;border:1px solid #f0e0cc;background:#fdf8f3;font-weight:500'>일시</td>" +
            "<td style='padding:10px;border:1px solid #f0e0cc'>" + scheduledAt + "</td></tr>" +
            "<tr><td style='padding:10px;border:1px solid #f0e0cc;background:#fdf8f3;font-weight:500'>장소</td>" +
            "<td style='padding:10px;border:1px solid #f0e0cc'>" + location + "</td></tr>" +
            "</table></div>" +
            "<div style='background:#f5ede3;padding:16px;text-align:center;font-size:12px;color:#8b6040'>" +
            "본 메일은 발신 전용입니다.</div></div>";
        send(toEmail, subject, content);
    }

    /* 공통 발송 */
    private void send(String to, String subject, String content) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper =
                new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom(fromEmail);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content, true);
            mailSender.send(message);
        } catch (Exception e) {
            System.err.println("메일 발송 실패: " + e.getMessage());
        }
    }
}