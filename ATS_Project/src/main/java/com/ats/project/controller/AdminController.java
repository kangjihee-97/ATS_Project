package com.ats.project.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ats.project.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired private UserService userService;

    private boolean notMaster(HttpSession session) {
        return !Boolean.TRUE.equals(session.getAttribute("isMaster"));
    }

    @GetMapping("/users")
    public String users(Model model, HttpSession session) {
        if (session.getAttribute("loginUser") == null)
            return "redirect:/user/login";
        if (notMaster(session))
            return "redirect:/dashboard";
        model.addAttribute("list", userService.getUserList());
        return "admin/users";
    }

    @PostMapping("/users/role")
    public String updateRole(@RequestParam String userId,
                             @RequestParam String role,
                             HttpSession session) {
        if (notMaster(session)) return "redirect:/dashboard";
        userService.updateUserRole(userId, role);
        return "redirect:/admin/users";
    }

    @PostMapping("/users/status")
    public String updateStatus(@RequestParam String userId,
                               @RequestParam String status,
                               HttpSession session) {
        if (notMaster(session)) return "redirect:/dashboard";
        userService.updateUserStatus(userId, status);
        return "redirect:/admin/users";
    }

    /* 강제 삭제 — FK 순서대로 처리 */
    @PostMapping("/users/delete")
    public String deleteUser(@RequestParam String userId,
                             HttpSession session,
                             RedirectAttributes redirectAttrs) {
        if (notMaster(session)) return "redirect:/dashboard";

        String myId = (String) session.getAttribute("userId");
        if (userId.equals(myId)) {
            redirectAttrs.addFlashAttribute("errorMsg",
                "자기 자신의 계정은 삭제할 수 없습니다.");
            return "redirect:/admin/users";
        }

        try {
            userService.forceDeleteUser(userId);
            redirectAttrs.addFlashAttribute("successMsg", "계정이 삭제되었습니다.");
        } catch (Exception e) {
            redirectAttrs.addFlashAttribute("errorMsg",
                "삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "redirect:/admin/users";
    }
}