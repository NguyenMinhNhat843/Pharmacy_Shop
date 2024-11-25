package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/home")
public class SanPhamController {
    @Autowired
    private SanPhamService sanPhamService;

    @GetMapping("")
    public String loadSanPham(Model model) {
        System.out.println("SanPhamController");
        List<SanPham> sanphams = sanPhamService.getAllSanPham().subList(0, 4);
        System.out.println(sanphams);
        model.addAttribute("sanphams", sanphams);
        return "test";
    }
}
