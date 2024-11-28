package com.pharmacy.pharmacy_shop.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pharmacy.pharmacy_shop.impl.DonHangImpl;
import com.pharmacy.pharmacy_shop.impl.SanPhamImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/thongKe")
public class ThongKeController {

    @Autowired
    private SanPhamImpl sanPhamImpl;

    @Autowired
    private DonHangImpl donHangImpl;

    @GetMapping
    public String showViewThongKe(Model model) throws JsonProcessingException {
        //đếm số sản phẩm
        int tongSoLuongSanPham = sanPhamImpl.getTongSoLuongSanPham();
        model.addAttribute("tongSoLuongSanPham", tongSoLuongSanPham);

        Map<String, Integer> topSanPham = sanPhamImpl.getTopSanPhamBanChay();
        model.addAttribute("topSanPham", topSanPham);

        BigDecimal tongTienTatCaDonHang = donHangImpl.tongTienTatCaDonHang();
        model.addAttribute("tongTienTatCaDonHang", tongTienTatCaDonHang);

        return "ThongKe";
    }

    @GetMapping("/countOrder")
    public ResponseEntity<Long> getOrderCount(@RequestParam int month, @RequestParam int year) {
        Long count = donHangImpl.countOrdersByMonthAndYear(year, month);
        return ResponseEntity.ok(count);
    }


}
