package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.entity.PhieuThongTin;
import com.pharmacy.pharmacy_shop.reposities.PhieuThongTinRepo;
import com.pharmacy.pharmacy_shop.services.AccountService;
import com.pharmacy.pharmacy_shop.services.PhieuThongTinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PhieuThongTinImpl implements PhieuThongTinService {
    @Autowired
    private PhieuThongTinRepo phieuThongTinRepo;

    @Override
    public String autoGenId() {
        PhieuThongTin latestPhieuThongTin = phieuThongTinRepo.findTopByOrderByIdDesc();
        String latestID = latestPhieuThongTin != null ? latestPhieuThongTin.getId() : "PT000";

        // Tăng ID
        String prefix = "PT";
        int number = Integer.parseInt(latestID.substring(2)) + 1;
        return prefix + String.format("%03d", number); // Format thành PT001, PT002...
    }
}
