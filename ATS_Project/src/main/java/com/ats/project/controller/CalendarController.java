package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.ats.project.model.ScheduleVO;
import com.ats.project.service.ScheduleService;
import java.util.*;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    @Autowired
    private ScheduleService scheduleService;

    @GetMapping({"", "/"})
    public String calendar(HttpSession session) {
        if (session.getAttribute("loginUser") == null)
            return "redirect:/user/login";
        return "calendar/index";
    }

    /* FullCalendar용 JSON 데이터 */
    @GetMapping("/data")
    @ResponseBody
    public List<Map<String, Object>> getEvents(HttpSession session) {
        String role = (String) session.getAttribute("userRole");
        String uid  = (String) session.getAttribute("userId");

        List<ScheduleVO> list = "INTERVIEWER".equals(role)
            ? scheduleService.getScheduleByInterviewer(uid)
            : scheduleService.getScheduleList();

        List<Map<String, Object>> events = new ArrayList<>();
        for (ScheduleVO s : list) {
            Map<String, Object> ev = new LinkedHashMap<>();
            ev.put("id",    s.getScheduleId());
            ev.put("title", (s.getApplicantName() != null
                             ? s.getApplicantName() : "지원자")
                             + " · " + s.getRound() + "차");
            ev.put("start", s.getScheduledAt());

            String color = switch (s.getStatus() == null ? "" : s.getStatus()) {
                case "DONE"      -> "#16a34a";
                case "CANCELLED" -> "#9ca3af";
                default          -> "#2563eb";
            };
            ev.put("backgroundColor", color);
            ev.put("borderColor", color);
            ev.put("textColor", "#ffffff");

            Map<String, Object> p = new LinkedHashMap<>();
            p.put("interviewer", s.getInterviewerName() != null ? s.getInterviewerName() : "-");
            p.put("location",    s.getLocation()        != null ? s.getLocation()        : "-");
            p.put("status",      s.getStatus()          != null ? s.getStatus()          : "-");
            p.put("scheduleId",  s.getScheduleId());
            ev.put("extendedProps", p);
            events.add(ev);
        }
        return events;
    }
}