package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name = "SanPham")
public class SanPham {
    @Id
    private String id;

    private String tenSanPham;

    private Float giaBan;

    private String image;

    private Integer soLuong;

    private Integer soLuongDaBan;

    private Integer soLuongConLai;

    @ManyToOne
    @JoinColumn(name = "Type")
    private LoaiSanPham type;

    // Getters and setters
}

