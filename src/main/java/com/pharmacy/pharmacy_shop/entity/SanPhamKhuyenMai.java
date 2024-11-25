package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "Sanpham_Khuyenmai")
public class SanPhamKhuyenMai {
    @Id
    @ManyToOne
    @JoinColumn(name = "idSanPham")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "idKhuyenMai")
    private KhuyenMai khuyenMai;
}

