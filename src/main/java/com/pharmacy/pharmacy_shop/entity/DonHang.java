package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "DonHang")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class DonHang {
    @Id
    private String id;

    @ManyToOne
    @JoinColumn(name = "idSanPham")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "idPhieuThongTin")
    private PhieuThongTin phieuThongTin;

    @Column(nullable = false)
    private String phuongThucThanhToan;

    private LocalDateTime ngayTaoHoaDon;

    private BigDecimal tongTien;
}

