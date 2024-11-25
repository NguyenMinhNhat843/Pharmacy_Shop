package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;

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

    @GetMapping("/type")
    public String getProductsByType(@RequestParam("type") String typeId, Model model) {
        List<SanPham> products = sanPhamService.getSanPhamByType(typeId);
        model.addAttribute("products", products);
        return "ListProduct";
    }

    @GetMapping("/type/search")
    public String searchProduct(@RequestParam("keyword") String search, Model model) {
        List<SanPham> products = sanPhamService.getSanPhamByTen(search);
        model.addAttribute("products", products);
        return "ListProduct";
    }

    @GetMapping("/type/filter")
    public String filterProducts(@RequestParam(value = "giaMin", defaultValue = "0") int giaMin,
                                 @RequestParam(value = "giaMax", defaultValue = "10000000") int giaMax,
                                 @RequestParam(value = "priceRange", required = false) String priceRange,
                                 Model model) {
        List<SanPham> filteredProducts = sanPhamService.filterProducts(giaMin, giaMax,  Collections.singletonList(priceRange));
        model.addAttribute("products", filteredProducts);
        return "ListProduct";



    }
}
