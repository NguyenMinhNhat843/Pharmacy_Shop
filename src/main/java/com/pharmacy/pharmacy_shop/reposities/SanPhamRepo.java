package com.pharmacy.pharmacy_shop.reposities;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.SanPham;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface SanPhamRepo extends JpaRepository<SanPham, Long> {

    @Query(value = "select t.* from SanPham as t where t.Type = :type", nativeQuery = true)
    List<SanPham> getSanPhamByType(String type);
    
    // Lấy sản phẩm bán chạy
    @Query("SELECT sp FROM SanPham sp ORDER BY sp.soLuongDaBan DESC")
    List<SanPham> findAllOrderBySoLuongDaBanDesc();
}
