
package com.pharmacy.pharmacy_shop.services;


import com.pharmacy.pharmacy_shop.entity.SanPham;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;


import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public interface SanPhamService {
    public List<SanPham> getAllSanPham();

    public long getSoLuongSanPham();

    public long getTongSoLuongDaBan();

    public List<SanPham> getSanPhamBanChay();
    public SanPham getSanPhamById(String id);
    public List<SanPham> getSanPhamTheoTrang(int pageNumber, int pageSize);
    public void addSanPham(SanPham sanPham);
    public void updateSanPham(SanPham sanPham);
    public void deleteSanPham(String id);
    public List<SanPham> getSanPhamByType(String type);

    public Page<SanPham> getSanPhamByTypePage(String type, Pageable pageable);

    public List<SanPham> getSanPhamByTen(String tenSanPham, String type);

    public List<SanPham> filterProducts(String tenSanPham,String type,Integer minPrice, Integer maxPrice, List<String> priceRange, String sortOrder);

    public List<SanPham> searchProducts(String tenSanPham);

    public List<SanPham> findSimilarProducts(String type, String excludeId);

    public Integer getTongSoLuongSanPham();

    public Map<String, Integer> getTopSanPhamBanChay();
}
