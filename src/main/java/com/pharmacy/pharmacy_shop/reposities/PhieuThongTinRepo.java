package com.pharmacy.pharmacy_shop.reposities;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.PhieuThongTin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PhieuThongTinRepo extends JpaRepository<Account, Integer> {
    @Query(value = "SELECT TOP 1 * FROM PhieuThongTin ORDER BY id DESC", nativeQuery = true)
    PhieuThongTin findTopByOrderByIdDesc();
}
