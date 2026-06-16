package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ats.project.model.PostingVO;
import com.ats.project.service.PostingService;

@Controller
@RequestMapping("/posting")
public class PostingController {

    @Autowired private PostingService postingService;

    @GetMapping("/list")
    public String list(Model model, HttpSession session) {
        if (session.getAttribute("loginUser") == null)
            return "redirect:/user/login";
        model.addAttribute("list", postingService.getPostingList());
        return "posting/list";
    }

    @GetMapping("/write")
    public String writeForm(HttpSession session) {
        if (session.getAttribute("loginUser") == null)
            return "redirect:/user/login";
        return "posting/write";
    }

    @PostMapping("/write")
    public String write(@ModelAttribute PostingVO vo, HttpSession session) {
        vo.setCreatedBy((String) session.getAttribute("userId"));
        postingService.insertPosting(vo);
        return "redirect:/posting/list";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable int id, Model model, HttpSession session) {
        if (session.getAttribute("loginUser") == null)
            return "redirect:/user/login";
        model.addAttribute("posting", postingService.getPosting(id));
        return "posting/detail";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable int id, Model model, HttpSession session) {
        if (session.getAttribute("loginUser") == null)
            return "redirect:/user/login";
        model.addAttribute("posting", postingService.getPosting(id));
        return "posting/write";
    }

    @PostMapping("/edit/{id}")
    public String edit(@PathVariable int id, @ModelAttribute PostingVO vo) {
        vo.setPostingId(id);
        postingService.updatePosting(vo);
        return "redirect:/posting/detail/" + id;
    }

    @PostMapping("/close/{id}")
    public String close(@PathVariable int id) {
        postingService.closePosting(id);
        return "redirect:/posting/list";
    }

    /* 공고 강제 삭제 */
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable int id,
                         RedirectAttributes redirectAttrs) {
        try {
            postingService.forceDeletePosting(id);
            redirectAttrs.addFlashAttribute("successMsg", "공고가 삭제되었습니다.");
        } catch (Exception e) {
            redirectAttrs.addFlashAttribute("errorMsg",
                "삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "redirect:/posting/list";
    }
}