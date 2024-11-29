package com.pharmacy.pharmacy_shop.reposities;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.DonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Repository
public interface DonHangRepo extends JpaRepository<DonHang, String> {
    @Query(value = "SELECT COUNT(*) FROM DonHang dh WHERE MONTH(dh.ngayTaoHoaDon) = :month AND YEAR(dh.ngayTaoHoaDon) = :year", nativeQuery = true)
    Long countOrdersByMonthAndYear(int month, int year);
    
    //tổng tiền tất cả đơn hàng
    @Query(value = "SELECT SUM(dh.tongTien) FROM DonHang dh", nativeQuery = true)
    BigDecimal tongTienTatCaDonHang();

    List<DonHang> findByIdContainingOrPhuongThucThanhToanContaining(String id, String paymentMethod);
    // Phương thức tìm đơn hàng theo ID (trả về Optional)
    Optional<DonHang> findById(String id);
}
