package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.entity.ChiTietDonHang;
import com.pharmacy.pharmacy_shop.entity.DonHang;
import com.pharmacy.pharmacy_shop.reposities.ChiTietDonHangRepo;
import com.pharmacy.pharmacy_shop.services.AccountService;
import com.pharmacy.pharmacy_shop.services.ChiTietDonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChiTietDonHangImpl implements ChiTietDonHangService {
    @Autowired
    private ChiTietDonHangRepo chiTietDonHangRepo;

    @Override
    public void addChiTietHoaDon(ChiTietDonHang ctdh) {
        chiTietDonHangRepo.save(ctdh);
    }
}
