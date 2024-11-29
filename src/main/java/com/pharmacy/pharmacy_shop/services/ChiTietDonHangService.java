package com.pharmacy.pharmacy_shop.services;

import com.pharmacy.pharmacy_shop.entity.ChiTietDonHang;
import org.springframework.stereotype.Service;

@Service
public interface ChiTietDonHangService {
    void addChiTietHoaDon(ChiTietDonHang ctdh);
}
