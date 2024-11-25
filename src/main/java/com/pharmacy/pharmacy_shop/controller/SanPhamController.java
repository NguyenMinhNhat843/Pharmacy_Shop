package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/home")
public class SanPhamController {
    @Autowired
    private SanPhamService sanPhamService;

    @GetMapping("")
    public String loadSanPham(Model model) {
        System.out.println("SanPhamController");
        List<SanPham> sanphams = sanPhamService.getSanPhamBanChay().subList(0, 4);
        System.out.println(sanphams);
        model.addAttribute("sanphams", sanphams);
        return "index";
    }

    @GetMapping("/Detail_Product")
    public String getProductDetail(@RequestParam("id") String id, Model model) {
        // Lấy sản phẩm từ Service
        SanPham sanPham = sanPhamService.getSanPhamById(id);

        // Kiểm tra log server
        System.out.println("Product ID: " + id);
        System.out.println("Product: " + sanPham);

        // Thêm sản phẩm vào model
        model.addAttribute("sanPham", sanPham);

        // Điều hướng đến `Detail_Product.html`
        return "Detail_Product";
    }

}
