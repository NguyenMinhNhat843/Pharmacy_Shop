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
        model.addAttribute("selectedType", typeId);
        return "ListProduct";
    }

    @GetMapping("/type/search")
    public String searchProduct(@RequestParam("type") String typeId,@RequestParam("keyword") String search,
                                Model model) {
        List<SanPham> products = sanPhamService.getSanPhamByTen(typeId,search);
        model.addAttribute("products", products);
        model.addAttribute("search", search);
        model.addAttribute("selectedType", typeId);
        return "ListProduct";
    }

    @GetMapping("/type/filter")
    public String filterProducts(@RequestParam("type") String typeId,
                                 @RequestParam(value = "giaMin", required = false) Integer  giaMin,
                                 @RequestParam(value = "giaMax", required = false) Integer  giaMax,
                                 @RequestParam(value = "priceRange", required = false) String priceRange,
                                 @RequestParam(value = "sortOrder", required = false) String sortOrder,
                                 Model model) {

        int filterGiaMin = (giaMin != null) ? giaMin : 0;
        int filterGiaMax = (giaMax != null) ? giaMax : 10000000;
        // Sử dụng giá trị mặc định nếu minPrice hoặc maxPrice là null

        List<SanPham> filteredProducts = sanPhamService.filterProducts(typeId,filterGiaMin, filterGiaMax, Collections.singletonList(priceRange), sortOrder);
        // Giữ lại giá trị của các filter đã chọn
        model.addAttribute("products", filteredProducts);
        model.addAttribute("priceRange", priceRange);
        model.addAttribute("giaMin", giaMin);
        model.addAttribute("giaMax", giaMax);
        model.addAttribute("selectedType", typeId);
        model.addAttribute("sortOrder", sortOrder);
        return "ListProduct";
    }
}
