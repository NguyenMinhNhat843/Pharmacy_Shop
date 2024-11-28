package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.services.AccountService;
import jakarta.servlet.http.HttpSession;
import com.pharmacy.pharmacy_shop.services.EmailService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.regex.Pattern;


@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;

    // ============== View
    @Autowired
    private EmailService emailService;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // Tên của file HTML trong thư mục templates
    }

    // =============== login
    @PostMapping("/login")
    public String processLogin(
            @RequestParam("email") String username,
            @RequestParam("password") String password,
            Model model,
            HttpSession session) {

        Account account = accountService.findByUsernameAndPassword(username, password);

        if (account != null && account.getType().equals("admin")) {
            session.setAttribute("loggedInUser", account);
            // Điều hướng đến trang chính (dashboard hoặc trang khác)
            return "redirect:/pharmacyquanly/sanpham/list";
        } else if (account != null && account.getType().equals("custom")) {
            session.setAttribute("loggedInUser", account);
            return "redirect:/home";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login"; // Quay lại trang login
        }
    }

    // Hiển thị trang quên mật khẩu
    @GetMapping("/forgot-password")
    public String showForgotPasswordPage() {
        return "forgot_password";  // Trang quên mật khẩu (forgot_password.html)
    }

    // Xử lý gửi email khi quên mật khẩu
    @PostMapping("/forgot-password")
    public String processForgotPassword(@RequestParam("email") String email, Model model) {

        // Kiểm tra email trong cơ sở dữ liệu
        Account account = accountService.findByUsername(email);  // Kiểm tra qua username hoặc email

        if (account != null) {
            // Tạo một link reset mật khẩu
            String resetLink = "http://localhost:8080/reset-password?username=" + account.getUsername();

            // Gửi email với link reset mật khẩu
            String subject = "Password Reset Request";
            String body = "<p>Click the link below to reset your password:</p>"
                    + "<a href='" + resetLink + "'>Reset Password</a>";
            boolean emailSent = emailService.sendEmail(email, subject, body);

            if (emailSent) {
                model.addAttribute("message", "A password reset link has been sent to your email.");
                return "forgot_password_2"; // Chuyển sang trang "Check your email"
            } else {
                model.addAttribute("error", "There was an error sending the reset email. Please try again later.");
            }
        } else {
            model.addAttribute("error", "Email not found.");
        }

        return "forgot_password";  // Quay lại trang quên mật khẩu với thông báo lỗi
    }

    // Trang reset mật khẩu
    @GetMapping("/reset-password")
    public String showResetPasswordPage(@RequestParam("username") String username, Model model) {
        model.addAttribute("username", username);
        return "reset_password";  // Trang reset mật khẩu
    }

    // Xử lý reset mật khẩu
    @PostMapping("/reset-password")
    public String processResetPassword(@RequestParam("username") String username,
                                       @RequestParam("newPassword") String newPassword,
                                       @RequestParam("repeatPassword") String repeatPassword,
                                       Model model) {

        // Kiểm tra mật khẩu có khớp không
        if (!newPassword.equals(repeatPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            return "reset_password";  // Quay lại trang nếu mật khẩu không khớp
        }

        // Kiểm tra độ dài mật khẩu (ví dụ, phải ít nhất 10 ký tự)
        if (newPassword.length() < 10) {
            model.addAttribute("error", "Password must be at least 10 characters long.");
            return "reset_password";  // Quay lại trang nếu mật khẩu quá ngắn
        }
        System.out.println(username);
        // Tìm tài khoản theo username
        Account account = accountService.findByUsername(username);

        if (account != null) {
            // Cập nhật mật khẩu mới
            account.setPassword(newPassword);  // Cập nhật mật khẩu
            accountService.save(account);  // Lưu tài khoản vào cơ sở dữ liệu

            model.addAttribute("message", "Password has been reset successfully.");
            return "ForgotPassword_4";  // Điều hướng đến trang đăng nhập
        } else {
            model.addAttribute("error", "Account not found.");
            return "reset_password";  // Quay lại trang nếu không tìm thấy tài khoản
        }
    }


    @GetMapping("/resend-reset-link")
    public String resendResetLink(@RequestParam("email") String email, Model model) {
        Account account = accountService.findByUsername(email);

        if (account != null) {
            // Tạo lại link reset mật khẩu
            String resetLink = "http://localhost:8080/reset-password?username=" + account.getUsername();

            // Thiết lập tiêu đề và nội dung email
            String subject = "Password Reset Request";
            String body = "<p>Click the link below to reset your password:</p>"
                    + "<a href='" + resetLink + "'>Reset Password</a>";

            // Gửi email
            boolean emailSent = emailService.sendEmail(email, subject, body);

            if (emailSent) {
                model.addAttribute("message", "A new reset link has been sent to your email.");
            } else {
                model.addAttribute("error", "Error sending email. Please try again.");
            }
        } else {
            model.addAttribute("error", "Email not found.");
        }

        return "check_email";  // Trả về trang để hiển thị kết quả (check_email.html)
    }

    // Hiển thị trang đăng ký
    @GetMapping("/register")
    public String showRegistrationPage() {
        return "register";  // Tên trang HTML
    }

    // Xử lý form đăng ký
    @PostMapping("/register")
    public String processRegistration(@RequestParam("name") String name,
                                      @RequestParam("email") String email,
                                      @RequestParam("password") String password,
                                      @RequestParam("repeatPassword") String repeatPassword,
                                      Model model) {

        // Kiểm tra xem mật khẩu có khớp không
        if (!password.equals(repeatPassword)) {
            model.addAttribute("error", "Passwords do not match.");
            return "register";
        }

        // Kiểm tra độ dài và tính hợp lệ của mật khẩu
        if (password.length() < 6 || !password.matches(".*[a-z].*") || !password.matches(".*[A-Z].*")) {
            model.addAttribute("error", "Password must be at least 6 characters long and contain both uppercase and lowercase letters.");
            return "register";
        }

        // Kiểm tra định dạng email
        String emailRegex = "^[a-zA-Z0-9._%+-]+@(gmail\\.com|yahoo\\.com|email\\.com)$";
        if (!Pattern.matches(emailRegex, email)) {
            model.addAttribute("error", "Email must be a valid Gmail, Yahoo, or Email address.");
            return "register";
        }

        // Kiểm tra xem email đã tồn tại chưa
        if (accountService.findByUsername(email) != null) {
            model.addAttribute("error", "Email is already registered.");
            return "register";
        }

        // Tạo tài khoản mới
        Account account = new Account();
        account.setUsername(email);
        account.setPassword(password);
        account.setType("custom"); // Mật khẩu nên được mã hóa trước khi lưu vào DB
        accountService.save(account);

        // Chuyển hướng đến trang đăng nhập sau khi đăng ký thành công
        model.addAttribute("message", "Registration successful! Please login.");
        return "redirect:/login";
    }
}
