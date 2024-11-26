package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/pharmacy")
public class SanPhamController {
    @Autowired
    private SanPhamService sanPhamService;

    @GetMapping("/quanly/sanpham")
    public String loadSanPham(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<SanPham> sanphams;
        SanPham sanpham = new SanPham();

        if (keyword != null && !keyword.isEmpty()) {
            // Tìm kiếm sản phẩm theo tên
            sanpham = sanPhamService.getSanPhamById(keyword);
            sanphams = new ArrayList<SanPham>();
            sanphams.add(sanpham);
        } else {
            // Hiển thị tất cả sản phẩm
            sanphams = sanPhamService.getAllSanPham();
        }

        model.addAttribute("sanphams", sanphams);
        return "Manager"; // Trang quản lý sản phẩm
    }

    @GetMapping("/quanly/sanpham/list")
    public String loadSanPhamPage(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        int pageSize = 10; // Mỗi trang hiển thị 10 sản phẩm
        Page<SanPham> sanPhamPage = sanPhamService.getSanPhamPage(page, pageSize);

        model.addAttribute("sanphams", sanPhamPage.getContent()); // Danh sách sản phẩm của trang hiện tại
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", sanPhamPage.getTotalPages());
        model.addAttribute("totalItems", sanPhamPage.getTotalElements());

        return "Manager"; // Tên view của bạn
    }

    @GetMapping("")
    public String loadSanPham(Model model) {
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
    public String filterProducts(@RequestParam(value = "giaMin", required = false) Integer  giaMin,
                                 @RequestParam(value = "giaMax", required = false) Integer  giaMax,
                                 @RequestParam(value = "priceRange", required = false) String priceRange,
                                 Model model) {


        // Sử dụng giá trị mặc định nếu giaMin hoặc giaMax là null
        // Giá trị mặc định dùng cho xử lý logic
        int filterGiaMin = (giaMin != null) ? giaMin : 0;
        int filterGiaMax = (giaMax != null) ? giaMax : 10000000;
        // Sử dụng giá trị mặc định nếu minPrice hoặc maxPrice là null

        List<SanPham> filteredProducts = sanPhamService.filterProducts(filterGiaMin , filterGiaMax  ,  Collections.singletonList(priceRange));
        // Giữ lại giá trị của các filter đã chọn
        model.addAttribute("products", filteredProducts);
        model.addAttribute("priceRange", priceRange);
        model.addAttribute("giaMin", giaMin);
        model.addAttribute("giaMax", giaMax);
      //  model.addAttribute("priceRange", priceRange);
        return "ListProduct";
    }
}
