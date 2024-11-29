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
    @Column(nullable = false, length = 100,name = "id")
    private String id;

    @Column(nullable = false, length = 100,name = "firstName")
    private String firstName;

    @Column(nullable = false, length = 100,name = "lastName")
    private String lastName;

    @Column(nullable = false, length = 100,name = "diaChi")
    private String diaChi;

    @Column(nullable = false, length = 15,name = "soDienThoai")
    private String soDienThoai;

    @Column(nullable = false, length = 100, name = "email")
    private String email;

    @Column(nullable = false, name = "namSinh")
    private Integer namSinh;

    @ManyToOne
    @JoinColumn(name = "accountId")
    private Account account;
}

