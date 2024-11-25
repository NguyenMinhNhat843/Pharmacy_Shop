package com.pharmacy.pharmacy_shop.entity;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

@Entity
@Table(name = "phieuthongtin")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class PhieuThongTin {
    @Id
    private String id;

    @NotNull(message = "First name is required")
    @Pattern(regexp = "^[A-Za-zÀ-ỹ\\s]+$", message = "First name is invalid")
    @Column(nullable = false, length = 100)
    private String firstName;

    @NotNull(message = "Last name is required")
    @Pattern(regexp = "^[A-Za-zÀ-ỹ\\s]+$", message = "First name is invalid")
    @Column(nullable = false, length = 100)
    private String lastName;

    @Column(length = 255)
    private String diaChi;

    @NotNull(message = "Phone number is required")
    @Pattern(regexp = "^0[0-9]{9}$", message = "Phone number is invalid") // 10 số, bắt đầu bằng số 0
    @Column(nullable = false, length = 10)
    private String soDienThoai;

    @Email
    @NotNull(message = "Email is required")
    @Column(length = 100)
    private String email;

    @Column(name = "namSinh")
    @Pattern(regexp = "^[0-9]{4}$", message = "Year of birth is invalid")
    @Past(message = "Year of birth is invalid")
    @Min(1900)
    @Max(2100)
    private Integer namSinh;

    @ManyToOne
    @JoinColumn(name = "accountId")
    private Account account;
}

