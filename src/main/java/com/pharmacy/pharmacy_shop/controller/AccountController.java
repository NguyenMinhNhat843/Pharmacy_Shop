package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.services.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AccountController {

    @Autowired
    private  AccountService accountService;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // Tên của file HTML trong thư mục templates
    }

    @PostMapping("/login")
    public String processLogin(
            @RequestParam("email") String username,
            @RequestParam("password") String password,
            Model model) {

        Account account = accountService.findByUsernameAndPassword(username, password);

        if (account != null) {
            model.addAttribute("message", "Login successful");
            // Điều hướng đến trang chính (dashboard hoặc trang khác)
            return "redirect:/home";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login"; // Quay lại trang login
        }
    }
}
