package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "ChiTietGioHang")
public class ChiTietGioHang {
    @EmbeddedId
    private ChiTietGioHangId id;

    private Integer soLuong;

    private BigDecimal giaBan;

    @ManyToOne
    @MapsId("idGioHang")
    @JoinColumn(name = "idGioHang")
    private GioHang gioHang;

    @ManyToOne
    @MapsId("idSanPham")
    @JoinColumn(name = "idSanPham")
    private SanPham sanPham;
}

