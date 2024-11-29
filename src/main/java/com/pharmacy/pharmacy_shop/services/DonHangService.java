package com.pharmacy.pharmacy_shop.services;


import com.pharmacy.pharmacy_shop.entity.DonHang;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Service
public interface DonHangService {
    public Long countOrdersByMonthAndYear(int year, int month);

    public BigDecimal tongTienTatCaDonHang();

    public List<DonHang> getAllDonHang();

    public List<DonHang> getDonHangById(String id);

    public DonHang addDonHang(DonHang donHang);

    public void deleteDonHang(String id);

    public List<DonHang> filterDonHang(String search, String paymentMethod);

    public Map<String, Object> getOrderSummary();

    public List<DonHang> filterByDate(List<DonHang> donHangs, String dateFilter);

    public List<DonHang> filterByPaymentStatus(List<DonHang> donHangs, String paymentStatus);
}
