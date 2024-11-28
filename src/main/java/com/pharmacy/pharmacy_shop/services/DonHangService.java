package com.pharmacy.pharmacy_shop.services;


import java.math.BigDecimal;

public interface DonHangService {
    public Long countOrdersByMonthAndYear(int year, int month);

    public BigDecimal tongTienTatCaDonHang();
}
