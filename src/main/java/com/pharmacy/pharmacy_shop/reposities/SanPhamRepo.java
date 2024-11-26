package com.pharmacy.pharmacy_shop.reposities;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.SanPham;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface SanPhamRepo extends JpaRepository<SanPham, String> {

    @Query(value = "select t.* from SanPham as t where t.Type = :type", nativeQuery = true)
    List<SanPham> getSanPhamByType(String type);

    // Lấy sản phẩm bán chạy
    @Query("SELECT sp FROM SanPham sp ORDER BY sp.soLuongDaBan DESC")
    List<SanPham> findAllOrderBySoLuongDaBanDesc();

    // Lấy sản phẩm theo ten
    @Query("SELECT sp FROM SanPham sp WHERE sp.tenSanPham LIKE %:tenSanPham%")
    List<SanPham> findAllByTenSanPham(String tenSanPham);

    // Lấy sản phẩm theo số lượng
    // Dành cho mục đích phân trang

    // Lấy sản phẩm theo khoảng giá được chọn
    @Query("SELECT sp FROM SanPham sp WHERE "
            + "(:giaMin IS NULL OR sp.giaBan >= :giaMin) AND "
            + "(:giaMax IS NULL OR sp.giaBan <= :giaMax) AND "
            + "(:priceRange IS NULL OR "
            + "(sp.giaBan < 100 AND :priceRange = 'under100000') OR "
            + "(sp.giaBan BETWEEN 100 AND 300 AND :priceRange = '100000-300000') OR "
            + "(sp.giaBan BETWEEN 300 AND 500 AND :priceRange = '300000-500000') OR "
            + "(sp.giaBan > 500 AND :priceRange = 'over500000'))")
    List<SanPham> findAllByGiaBanBetweenAndPriceRange(
            int giaMin,
            int giaMax,
             String priceRange);

    List<SanPham> id(String id);
}
