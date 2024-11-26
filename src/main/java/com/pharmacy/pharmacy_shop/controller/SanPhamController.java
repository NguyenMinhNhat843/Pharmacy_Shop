package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.LoaiSanPham;
import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/pharmacy")
public class SanPhamController {
    @Autowired
    private SanPhamService sanPhamService;

    @GetMapping("/quanly/sanpham/search")
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
        return "Manager";
    }

    @GetMapping("quanly/sanpham/list")
    public String viewQuanLySanPham(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        int pageSize = 10;
        List<SanPham> sanphams = sanPhamService.getSanPhamTheoTrang(page, pageSize);

        long totalPage = sanPhamService.getSoLuongSanPham() / pageSize + 1;

        model.addAttribute("sanphams", sanphams);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPage);
        return "Manager";
    }

    @PostMapping("/quanly/sanpham/add")
    public String addSanPham(
        @RequestParam("name") String name,
        @RequestParam("price") float price,
        @RequestParam("quantity") int quantity,
        @RequestParam("image") MultipartFile image,
        @RequestParam("category") String category
    ) {
        SanPham sp = new SanPham();
        sp.setId("111");
        sp.setTenSanPham(name);
        sp.setGiaBan(price);
        sp.setSoLuong(quantity);
        sp.setSoLuongDaBan(0);
        sp.setSoLuongConLai(quantity);
        sp.setImage("https://cdn.nhathuoclongchau.com.vn/unsafe/375x0/f…et_accuchek_active_6512_5b83_large_fed146d2f6.JPG");

        LoaiSanPham tp = new LoaiSanPham();
        tp.setId(category);
        sp.setType(tp);

        System.out.println(sp);
        sanPhamService.addSanPham(sp);

        return "redirect:/pharmacy/quanly/sanpham/list";
    }

    @PostMapping("/quanly/sanpham/delete")
    @ResponseBody
    public ResponseEntity<?> deleteSelectedProducts(@RequestBody List<String> selectedIds) {
        System.out.println("=================================================");
        System.out.println(selectedIds);
        try {
            for (String id : selectedIds) {
                sanPhamService.deleteSanPham(id);
            }
            return ResponseEntity.ok("Xóa thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Có lỗi xảy ra!");
        }
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
