package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.ats.project.model.NoticeVO;
import com.ats.project.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired private NoticeService noticeService;

    private boolean notAdmin(HttpSession session) {
        return !Boolean.TRUE.equals(session.getAttribute("isAdmin"));
    }

    @GetMapping("/list")
    public String list(Model model, HttpSession session) {
        if (session.getAttribute("loginUser") == null)
            return "redirect:/user/login";
        model.addAttribute("list", noticeService.getNoticeList());
        return "notice/list";
    }

    @GetMapping("/write")
    public String writeForm(HttpSession session) {
        if (session.getAttribute("loginUser") == null) return "redirect:/user/login";
        if (notAdmin(session)) return "redirect:/notice/list";
        return "notice/write";
    }

    @PostMapping("/write")
    public String write(@ModelAttribute NoticeVO vo, HttpSession session) {
        if (notAdmin(session)) return "redirect:/notice/list";
        vo.setCreatedBy((String) session.getAttribute("userId"));
        noticeService.insertNotice(vo);
        return "redirect:/notice/list";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable int id, Model model, HttpSession session) {
        if (session.getAttribute("loginUser") == null) return "redirect:/user/login";
        model.addAttribute("notice", noticeService.getNotice(id));
        return "notice/detail";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable int id, HttpSession session) {
        if (notAdmin(session)) return "redirect:/notice/list";
        noticeService.deleteNotice(id);
        return "redirect:/notice/list";
    }
}