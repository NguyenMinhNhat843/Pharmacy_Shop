package com.pharmacy.pharmacy_shop.reposities;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.PhieuThongTin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PhieuThongTinRepo extends JpaRepository<PhieuThongTin, String> {
    @Query(value = "SELECT TOP 1 * FROM PhieuThongTin ORDER BY id DESC", nativeQuery = true)
    PhieuThongTin findTopByOrderByIdDesc();


    @Query(value = "SELECT * FROM PhieuThongTin", nativeQuery = true)
    List<PhieuThongTin> getAllPhieuThongTin();

    // Tìm kíem phiếu thông tin theo ID và gmail
    @Query(value = "SELECT * FROM PhieuThongTin WHERE id = :id OR email like :gmail", nativeQuery = true)
    List<PhieuThongTin> findPhieuThongTinByIdAndGmail(String id, String gmail);

    // Tìm kiếm phiếu thông tin theo gmail
    @Query(value = "SELECT * FROM PhieuThongTin WHERE email LIKE %:keyword% OR soDienThoai LIKE %:keyword%", nativeQuery = true)
    List<PhieuThongTin> findPhieuThongTinByGmail(String keyword);


}
