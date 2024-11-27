
package com.pharmacy.pharmacy_shop.reposities;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.SanPham;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
<<<<<<< HEAD

public interface SanPhamRepo extends JpaRepository<SanPham, String> {
    @Query(value = "select t.* from SanPham as t where t.Type = :type", nativeQuery = true)
    List<SanPham> getSanPhamByType(String type);

=======
public interface SanPhamRepo extends JpaRepository<SanPham, String> {
>>>>>>> a426ca16b58c81cbd026c1eb282aba3cf6d552fc
    // Lấy sản phẩm bán chạy
    @Query("SELECT sp FROM SanPham sp ORDER BY sp.soLuongDaBan DESC")
    List<SanPham> findAllOrderBySoLuongDaBanDesc();

<<<<<<< HEAD
    // Lấy sản phẩm theo ten
    @Query(value = "SELECT * FROM SanPham sp WHERE sp.tenSanPham LIKE %:tenSanPham% AND type = :type", nativeQuery = true)
    List<SanPham> findAllByTenSanPham(String type,String tenSanPham);


    // Phân trang sản phẩm
    @Query(value = "select * from SanPham order by id offset :start_row rows fetch next :page_size rows only", nativeQuery = true)
    public List<SanPham> findSanPhamTheoTrang(int start_row, int page_size);

    // Lấy sản phẩm theo khoảng giá được chọn
    @Query(value = "SELECT * FROM SanPham sp WHERE "
            + "(sp.tenSanPham LIKE %:tenSanPham%) AND "
            + "(:giaMin IS NULL OR sp.giaBan >= :giaMin) AND "
            + "(:giaMax IS NULL OR sp.giaBan <= :giaMax) AND "
            + "(:priceRange IS NULL OR "
            + "(sp.giaBan < 100 AND :priceRange = 'under100000') OR "
            + "(sp.giaBan BETWEEN 100 AND 300 AND :priceRange = '100000-300000') OR "
            + "(sp.giaBan BETWEEN 300 AND 500 AND :priceRange = '300000-500000') OR "
            + "(sp.giaBan > 500 AND :priceRange = 'over500000')) AND "
            + "sp.Type = :type "
            + "ORDER BY "
            + "CASE WHEN :sortOrder = 'asc' THEN sp.giaBan END ASC, "
            + "CASE WHEN :sortOrder = 'desc' THEN sp.giaBan END DESC",
            nativeQuery = true)
    List<SanPham> findAllByGiaBanBetweenAndPriceRange(
            String tenSanPham,
            String type,
            int giaMin,
            int giaMax,
            String priceRange,
            String sortOrder
    );
=======
    @Query("SELECT sp FROM SanPham sp WHERE sp.type.id = :typeId AND sp.id <> :id")
    List<SanPham> findByTypeIdAndIdNot(@Param("typeId") String typeId, @Param("id") String id);

    // Lấy danh sách sản phẩm cùng thương hiệu dựa vào brand (ngoại trừ sản phẩm hiện tại)
//    List<SanPham> findByBrandAndIdNot(String brand, String id);
>>>>>>> a426ca16b58c81cbd026c1eb282aba3cf6d552fc
}
