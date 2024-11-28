package com.pharmacy.pharmacy_shop.reposities;

import com.pharmacy.pharmacy_shop.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

@Repository
public interface DonHangRepo extends JpaRepository<Account, Integer> {
    @Query(value = "SELECT COUNT(*) FROM DonHang dh WHERE MONTH(dh.ngayTaoHoaDon) = :month AND YEAR(dh.ngayTaoHoaDon) = :year", nativeQuery = true)
    Long countOrdersByMonthAndYear(int month, int year);
    
    //tổng tiền tất cả đơn hàng
    @Query(value = "SELECT SUM(dh.tongTien) FROM DonHang dh", nativeQuery = true)
    BigDecimal tongTienTatCaDonHang();

}
