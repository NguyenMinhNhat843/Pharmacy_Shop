package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "donhang")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class DonHang {

    @Id
    @Column(length = 50)
    private String id;

    @ManyToOne
    @JoinColumn(name = "idSanPham", nullable = false)
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "idPhieuThongTin", foreignKey = @ForeignKey(name = "FK_PHIEUTHONGTIN"))
    private PhieuThongTin phieuThongTin;

    @NotNull
    @Column(nullable = false)
    @FutureOrPresent(message = "Ngày đặt không được nhỏ hơn ngày hiện tại")
    private LocalDate ngayDat;

    @Column(length = 100)
    private String phuongThucThanhToan;
}
