package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.services.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class ThanhToanController {
    @Autowired
    private GioHangService gioHangService;

    @PostMapping("/thanhtoan")
    public String thanhtoan() {
        return "ThanhToan";
    }
}
