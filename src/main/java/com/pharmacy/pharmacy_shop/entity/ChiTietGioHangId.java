package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.Embeddable;
import lombok.*;

import java.io.Serializable;

@EqualsAndHashCode
@Embeddable
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ChiTietGioHangId implements Serializable {
    private String idGioHang;
    private String idSanPham;
}

