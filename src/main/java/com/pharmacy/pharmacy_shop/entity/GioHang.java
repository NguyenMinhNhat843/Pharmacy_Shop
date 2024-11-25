package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "GioHang")
public class GioHang {
    @Id
    private String id;

    @ManyToOne
    @JoinColumn(name = "idPhieuThongTin")
    private PhieuThongTin phieuThongTin;

    private LocalDateTime ngayTao;
}

