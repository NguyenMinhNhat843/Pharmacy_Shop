package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

@Entity
@Table(name = "SanPham")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SanPham {
    @Id
    private String id;

    @Column(nullable = false, name = "tenSanPham")
    private String tenSanPham;

    @Column(name = "giaBan")
    private Float giaBan;

    @Column(nullable = false, name = "image")
    private String image;

    @Column(nullable = false,name = "soLuong")
    private Integer soLuong;

    @Column(nullable = false, name = "soLuongDaBan")
    private Integer soLuongDaBan;

    @Column(nullable = false, name = "soLuongConLai")
    private Integer soLuongConLai;

    @ManyToOne
    @JoinColumn(name = "Type")
    private LoaiSanPham type;

    // Getters and setters
}

