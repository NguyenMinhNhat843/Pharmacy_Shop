package entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

@Entity
@Table(name = "sanpham")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SanPham {

    @Id
    @Column(length = 50)
    private String id;

    @NotBlank
    @Column(nullable = false, length = 255)
    private String tenSanPham;

    @NotNull
    @Column(nullable = false)
    @Min(0)
    private Double giaBan;

    @Column(length = 255)
    private String image;

    @NotBlank
    @Column(nullable = false, length = 50)
    private String type; // 'thực phẩm chức năng', ...

    @Min(0)
    private Integer soLuongDaBan = 0;

    @Min(0)
    private Integer soLuongConLai = 0;

    @ManyToOne
    @JoinColumn(name = "idKhuyenMai")
    private KhuyenMai khuyenMai;
}

