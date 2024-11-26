package com.pharmacy.pharmacy_shop.reposities;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepo extends JpaRepository<SanPham, String> {
    // Lấy sản phẩm bán chạy
    @Query("SELECT sp FROM SanPham sp ORDER BY sp.soLuongDaBan DESC")
    List<SanPham> findAllOrderBySoLuongDaBanDesc();

    @Query("SELECT sp FROM SanPham sp WHERE sp.type.id = :typeId AND sp.id <> :id")
    List<SanPham> findByTypeIdAndIdNot(@Param("typeId") String typeId, @Param("id") String id);

    // Lấy danh sách sản phẩm cùng thương hiệu dựa vào brand (ngoại trừ sản phẩm hiện tại)
//    List<SanPham> findByBrandAndIdNot(String brand, String id);
}
