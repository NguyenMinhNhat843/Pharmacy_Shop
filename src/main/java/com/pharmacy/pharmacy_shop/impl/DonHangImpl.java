package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.reposities.DonHangRepo;
import com.pharmacy.pharmacy_shop.services.AccountService;
import com.pharmacy.pharmacy_shop.services.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
public class DonHangImpl implements DonHangService {
    @Autowired
    private DonHangRepo donHangRepo;
    @Override
    public Long countOrdersByMonthAndYear(int year, int month) {
        return donHangRepo.countOrdersByMonthAndYear(month, year);
    }

    @Override
    public BigDecimal tongTienTatCaDonHang() {
        return donHangRepo.tongTienTatCaDonHang();
    }
}
