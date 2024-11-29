package com.pharmacy.pharmacy_shop.services;


import com.pharmacy.pharmacy_shop.entity.ChiTietDonHang;
import com.pharmacy.pharmacy_shop.entity.DonHang;

import java.math.BigDecimal;
import java.util.List;

public interface DonHangService {
    public String autoGenID();

    public void addDonHang(DonHang donHang, List<ChiTietDonHang> ctdh);

    public  BigDecimal calculateTotalAmount(List<ChiTietDonHang> chiTietDonHangList);

    public Long countOrdersByMonthAndYear(int year, int month);

    public BigDecimal tongTienTatCaDonHang();
}
