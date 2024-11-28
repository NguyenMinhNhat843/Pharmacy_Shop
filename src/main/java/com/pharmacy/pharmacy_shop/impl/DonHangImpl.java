package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.entity.ChiTietDonHang;
import com.pharmacy.pharmacy_shop.entity.DonHang;
import com.pharmacy.pharmacy_shop.reposities.ChiTietDonHangRepo;
import com.pharmacy.pharmacy_shop.reposities.DonHangRepo;
import com.pharmacy.pharmacy_shop.services.AccountService;
import com.pharmacy.pharmacy_shop.services.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import com.pharmacy.pharmacy_shop.services.KhuyenMaiService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class DonHangImpl implements DonHangService {
    @Autowired
    private DonHangRepo donHangRepo;
    private ChiTietDonHangRepo chiTietDonHangRepo;

    @Override
    public String autoGenID() {
        DonHang latestDonHang = donHangRepo.findDonHangWithIDMax();
        String latestID = latestDonHang != null ? latestDonHang.getId() : "DH000";

        // Tăng ID
        String prefix = "DH";
        int number = Integer.parseInt(latestID.substring(2)) + 1;
        return prefix + String.format("%03d", number);
    }

    @Override
    public void addDonHang(DonHang donHang, List<ChiTietDonHang> ctdh) {
        // 1. Lưu đơn hàng (DonHang)
        donHang.setNgayTaoHoaDon(LocalDateTime.now());  // Cập nhật thời gian tạo đơn hàng
        donHang.setTongTien(calculateTotalAmount(ctdh)); // Tính tổng tiền đơn hàng
        DonHang savedDonHang = donHangRepo.save(donHang);

        // 2. Lưu chi tiết đơn hàng (ChiTietDonHang)
        for (ChiTietDonHang chiTiet : ctdh) {
            chiTiet.setDonHang(savedDonHang); // Gán đối tượng đơn hàng cho chi tiết đơn hàng
            chiTietDonHangRepo.save(chiTiet);  // Lưu chi tiết đơn hàng
        }
    }

    @Override
    public BigDecimal calculateTotalAmount(List<ChiTietDonHang> chiTietDonHangList) {
        BigDecimal totalAmount = BigDecimal.ZERO;

        for (ChiTietDonHang chiTiet : chiTietDonHangList) {
            BigDecimal thanhTien = BigDecimal.valueOf(chiTiet.getThanhTien()); // Tính tổng tiền của từng chi tiết
            totalAmount = totalAmount.add(thanhTien); // Cộng dồn vào tổng tiền
        }

        return totalAmount;
    }

    @Override
    public Long countOrdersByMonthAndYear(int year, int month) {
        return donHangRepo.countOrdersByMonthAndYear(month, year);
    }

    @Override
    public BigDecimal tongTienTatCaDonHang() {
        return donHangRepo.tongTienTatCaDonHang();
    }
}
