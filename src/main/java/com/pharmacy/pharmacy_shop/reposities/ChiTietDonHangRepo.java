package com.pharmacy.pharmacy_shop.reposities;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.ChiTietDonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ChiTietDonHangRepo extends JpaRepository<ChiTietDonHang, String> {
    @Query(value = "SELECT TOP 1 * FROM ChiTietDonHang ORDER BY id DESC;\n", nativeQuery = true)
    ChiTietDonHang getLastestChiTietDonHang();
}
