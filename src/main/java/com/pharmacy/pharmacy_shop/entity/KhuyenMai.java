package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "khuyenMai")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class KhuyenMai {
    @Id
    private String id;

    private String name;

    @Column(columnDefinition = "TEXT")
    private String moTa;

    private LocalDateTime ngayBatDau;

    private LocalDateTime ngayKetThuc;

    private Float phanTramGiamGia;

    private Float giaTriGiamToiThieu;
}


