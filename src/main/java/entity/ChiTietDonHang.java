package entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

@Entity
@Table(name = "ChiTietDonHang")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChiTietDonHang {

    @Id
    @ManyToOne
    @JoinColumn(name = "idDonHang", nullable = false)
    private DonHang donHang;

    @Id
    @ManyToOne
    @JoinColumn(name = "idSanPham", nullable = false)
    private SanPham sanPham;

    @NotNull
    @Min(1)
    @Column(nullable = false)
    private Integer soLuong;

    @NotNull
    @Column(nullable = false)
    private Float thanhTien;
}

