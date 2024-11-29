package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.entity.PhieuThongTin;
import com.pharmacy.pharmacy_shop.reposities.PhieuThongTinRepo;
import com.pharmacy.pharmacy_shop.services.PhieuThongTinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;

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

    @Override
    public List<PhieuThongTin> getAll() {
        return phieuThongTinRepo.getAllPhieuThongTin();
    }

    @Override
    public List<PhieuThongTin> findPhieuThongTinByIdAndGmail(String id, String gmail) {
        return phieuThongTinRepo.findPhieuThongTinByIdAndGmail(id, gmail);
    }

    @Override
    public List<PhieuThongTin> findPhieuThongTinByGmail(String gmail) {
        return phieuThongTinRepo.findPhieuThongTinByGmail(gmail);
    }

    // Cập nhật thông tin khách hàng
    public void update(PhieuThongTin phieuThongTin) {
        phieuThongTinRepo.save(phieuThongTin);
    }

    public List<PhieuThongTin> getAllSortedByFullName(String keyword) {
        List<PhieuThongTin> khachHangs;
        // Kiểm tra xem có từ khóa tìm kiếm hay không
        if (keyword == null || keyword.trim().isEmpty()) {
            // Nếu không có từ khóa, lấy tất cả khách hàng
            khachHangs = phieuThongTinRepo.findAll();
        } else {
            // Nếu có từ khóa, tìm kiếm theo email hoặc một trường khác (vd: full name)
            khachHangs = phieuThongTinRepo.findPhieuThongTinByGmail(keyword);
        }

        // Sắp xếp danh sách theo full name (first name + last name)
        khachHangs.sort(Comparator.comparing((PhieuThongTin p) -> p.getFirstName() + " " + p.getLastName()));
        return khachHangs;
    }

}
