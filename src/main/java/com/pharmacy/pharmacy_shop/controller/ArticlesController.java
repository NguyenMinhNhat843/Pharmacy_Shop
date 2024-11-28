package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.SanPham;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ArticlesController {
    @GetMapping("/article")
    public String getArticlePage(HttpSession session, Model model) {
        // Lấy danh sách sản phẩm vừa xem từ session
        List<SanPham> recentlyViewedProducts = (List<SanPham>) session.getAttribute("recentlyViewedProducts");

        // Nếu chưa có sản phẩm nào trong session, tạo danh sách rỗng
        if (recentlyViewedProducts == null) {
            recentlyViewedProducts = new ArrayList<>();
        }

        // Thêm danh sách sản phẩm vào model
        model.addAttribute("recentlyViewedProducts", recentlyViewedProducts);

        return "Articles"; // Tên file Thymeleaf
    }

}
