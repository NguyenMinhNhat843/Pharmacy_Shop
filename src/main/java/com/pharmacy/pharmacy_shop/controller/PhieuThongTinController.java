package com.pharmacy.pharmacy_shop.controller;


import com.pharmacy.pharmacy_shop.entity.PhieuThongTin;
import com.pharmacy.pharmacy_shop.services.PhieuThongTinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PhieuThongTinController {

    @Autowired
    private PhieuThongTinService phieuThongTinService;

    @GetMapping("/khachhang")
    public String getAllKhachHang(Model model) {
        List<PhieuThongTin> khachHangs = phieuThongTinService.getAll();
        int tongKhachHang = khachHangs.size();
        System.out.println(khachHangs);
        model.addAttribute("khachHangs", khachHangs);
        model.addAttribute("tongKhachHang", tongKhachHang);
        return "Manager_Customer";
    }

    // Tìm kiếm khách hàng the  o id và gmail
    @GetMapping("/khachhang/search")
    public String searchKhachHang(@RequestParam(required = false) String keyword, Model model) {
        List<PhieuThongTin> khachHangs;
        if (keyword == null || keyword.trim().isEmpty()) {
            // Nếu không có từ khóa, lấy tất cả khách hàng
            khachHangs = phieuThongTinService.getAll();
        } else {
            // Nếu có từ khóa, tìm kiếm theo từ khóa
            khachHangs = phieuThongTinService.findPhieuThongTinByGmail(keyword);
        }

        // Kiểm tra nếu danh sách tìm kiếm là rỗng và thêm thông báo nếu không tìm thấy kết quả
        if (khachHangs.isEmpty()) {
            model.addAttribute("message", "Không tìm thấy khách hàng với gmail: " + keyword);
        }


        model.addAttribute("khachHangs", khachHangs);
        model.addAttribute("keyword", keyword); // Truyền lại từ khóa vào view

        return "Manager_Customer";
    }

    @PostMapping("/khachhang/update")
    public String updateKhachHang(@ModelAttribute PhieuThongTin phieuThongTin) {
        phieuThongTinService.update(phieuThongTin);
        return "redirect:/khachhang"; // Sau khi update xong, quay lại trang danh sách khách hàng
    }

    @GetMapping("/khachhang/sort")
    public String sortKhachHangByName(@RequestParam(required = false) String keyword,Model model) {
        List<PhieuThongTin> khachHangs = phieuThongTinService.getAllSortedByFullName(keyword);
        model.addAttribute("khachHangs", khachHangs);
        model.addAttribute("keyword", keyword); // Truyền lại từ khóa tìm kiếm vào view
        return "Manager_Customer"; // Quay lại trang danh sách khách hàng đã được sắp xếp
    }

}
