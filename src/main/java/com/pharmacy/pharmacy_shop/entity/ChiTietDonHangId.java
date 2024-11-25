package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.Embeddable;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@EqualsAndHashCode
@Embeddable
public class ChiTietDonHangId implements Serializable {
    private String idDonHang;
    private String idSanPham;
}

