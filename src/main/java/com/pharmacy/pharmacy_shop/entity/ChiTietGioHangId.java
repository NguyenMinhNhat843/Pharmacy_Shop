package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.Embeddable;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@EqualsAndHashCode
@Embeddable
public class ChiTietGioHangId implements Serializable {
    private String idGioHang;
    private String idSanPham;
}

