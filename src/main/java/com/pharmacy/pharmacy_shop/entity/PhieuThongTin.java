package com.pharmacy.pharmacy_shop.entity;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

@Entity
@Table(name = "PhieuThongTin")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class PhieuThongTin {
    @Id
    private String id;

    @Column(nullable = false, length = 100)
    private String firstName;

    @Column(nullable = false, length = 100)
    private String lastName;

    private String diaChi;

    @Column(nullable = false, length = 15)
    private String soDienThoai;

    private String email;

    private Integer namSinh;

    @ManyToOne
    @JoinColumn(name = "accountId")
    private Account account;
}

