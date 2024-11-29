package com.pharmacy.pharmacy_shop.services;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.PhieuThongTin;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PhieuThongTinService {
    String autoGenId();

    List<PhieuThongTin> getAll();

    List<PhieuThongTin> findPhieuThongTinByIdAndGmail(String id, String gmail);

    List<PhieuThongTin> findPhieuThongTinByGmail(String gmail);

    // update phiếu thông tin

    public void update(PhieuThongTin phieuThongTin);

    public List<PhieuThongTin> getAllSortedByFullName(String keyword);



}
