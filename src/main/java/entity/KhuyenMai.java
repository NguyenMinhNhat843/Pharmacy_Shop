package entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "khuyen_mai")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class KhuyenMai {

    @Id
    @Column(length = 50)
    private String id;

    @NotBlank
    @Column(nullable = false, length = 100)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String moTa;

    @NotNull
    @Column(nullable = false)
    private LocalDate ngayBatDau;

    @NotNull
    @Column(nullable = false)
    private LocalDate ngayKetThuc;

    @NotBlank
    @Column(nullable = false, length = 20)
    private String trangThai; // 'đang có', 'hết hạn', 'sắp có'

    @NotNull
    @Column(nullable = false)
    private Float dieuKienApDung;
}

