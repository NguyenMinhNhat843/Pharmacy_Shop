package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.LoaiSanPham;
import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.*;

@Controller
@RequestMapping("")
public class SanPhamController {
    @Autowired
    private SanPhamService sanPhamService;

    // ========================= home page view
    @GetMapping("/home")
    public String loadSanPham(Model model, HttpSession session) {
        // Lấy thông tin account từ session
        Account account = (Account) session.getAttribute("loggedInUser");

        // Lấy danh sách sản phẩm
        List<SanPham> sanphams = sanPhamService.getSanPhamBanChay();
        System.out.println(sanphams);

        // Truyền dữ liệu vào model
        model.addAttribute("banner_3p", sanphams.subList(0, 3));
        model.addAttribute("sanphambanchay", sanphams.subList(3, 7));
        model.addAttribute("bannerSPBC", sanphams.subList(7, 10));
        model.addAttribute("sanphamtotnhat", sanphams.subList(10, 14));
        model.addAttribute("sanphambannhieunhat", sanphams.subList(14, 18));
        model.addAttribute("account", account); // Truyền account vào model
        return "index";

    }

    // ======================== ListProduct theo type
    @GetMapping("/type/{typeOrSlug}")
    public String getProductsByType(@PathVariable("typeOrSlug") String typeOrSlug,
                                    Model model, HttpSession session) {
        // Lấy Account từ Session
        Account account = (Account) session.getAttribute("loggedInUser");

        // Tạo map ánh xạ slug sang mã sản phẩm
        Map<String, String> typeMap = new HashMap<>();
        typeMap.put("thuc-pham-chuc-nang", "TP001");
        typeMap.put("thuoc-khong-ke-don", "TP002");
        typeMap.put("dung-cu-y-te", "TP003");
        typeMap.put("san-pham-cham-soc-suc-khoe", "TP004");
        typeMap.put("tieu-duong", "TP005");
        typeMap.put("tim-mach", "TP006");
        typeMap.put("xuong-khop", "TP007");
        typeMap.put("thuoc-ke-don", "TP008");
        typeMap.put("thuoc-cho-be", "TP009");
        typeMap.put("me-va-be", "TP010");

        String typeId = typeMap.getOrDefault(typeOrSlug, typeOrSlug);

        // Tìm kiếm sản phẩm theo typeId
        List<SanPham> products = sanPhamService.getSanPhamByType(typeId);

        model.addAttribute("account", account);
        model.addAttribute("products", products);
        model.addAttribute("selectedType", typeOrSlug); // Truyền slug hoặc mã vào model

        return "ListProduct"; // trả về view ListProduct
    }

    // ======================================= View: Quan Ly SAn Pham
    @GetMapping("/quanly/sanpham/list")
    public String viewQuanLySanPham(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        int pageSize = 10;
        List<SanPham> sanphams = sanPhamService.getSanPhamTheoTrang(page, pageSize);
        long soLuongSanPham = sanPhamService.getSoLuongSanPham();

        long totalPage = soLuongSanPham / pageSize + 1;

        model.addAttribute("soLuongDaBan", sanPhamService.getTongSoLuongDaBan());
        model.addAttribute("soLuongSanPham", soLuongSanPham);
        model.addAttribute("sanphams", sanphams);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPage);
        return "Manager";
    }

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

        return "redirect:/quanly/sanpham/list";
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




    @GetMapping("/pharmacy/search")
    public String filterProducts(@RequestParam(value = "type", required = false) String typeOrSlug,
                                 @RequestParam(value = "keyword", required = false) String search,
                                 @RequestParam(value = "giaMin", required = false) Integer  giaMin,
                                 @RequestParam(value = "giaMax", required = false) Integer  giaMax,
                                 @RequestParam(value = "priceRange", required = false) String priceRange,
                                 @RequestParam(value = "sortOrder", required = false) String sortOrder,
                                 @RequestParam(value = "page", defaultValue = "0") int page,
                                 @RequestParam(value = "size", defaultValue = "10") int size,
                                 Model model) {

        int filterGiaMin = (giaMin != null) ? giaMin : 0;
        int filterGiaMax = (giaMax != null) ? giaMax : 10000000;

        // Ánh xạ từ slug về mã typeId
        Map<String, String> typeMap = new HashMap<>();
        typeMap.put("thuc-pham-chuc-nang", "TP001");
        typeMap.put("thuoc-khong-ke-don", "TP002");
        typeMap.put("dung-cu-y-te", "TP003");
        typeMap.put("san-pham-cham-soc-suc-khoe", "TP004");
        typeMap.put("tieu-duong", "TP005");
        typeMap.put("tim-mach", "TP006");
        typeMap.put("xuong-khop", "TP007");
        typeMap.put("thuoc-ke-don", "TP008");
        typeMap.put("thuoc-cho-be", "TP009");
        typeMap.put("me-va-be", "TP010");



        String typeId = typeMap.getOrDefault(typeOrSlug, null);


        List<SanPham> filteredProducts = sanPhamService.filterProducts(search,typeId,filterGiaMin, filterGiaMax, Collections.singletonList(priceRange), sortOrder);
        // Giữ lại giá trị của các filter đã chọn
        model.addAttribute("products", filteredProducts);
        model.addAttribute("priceRange", priceRange);
        model.addAttribute("giaMin", giaMin);
        model.addAttribute("giaMax", giaMax);
        model.addAttribute("selectedType", typeOrSlug);
        model.addAttribute("search", search);
        System.out.println("Selected Type ID: " + typeId);
        model.addAttribute("sortOrder", sortOrder);


        return "ListProduct";
    }
}
