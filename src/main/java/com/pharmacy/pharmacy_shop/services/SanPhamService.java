
package com.pharmacy.pharmacy_shop.services;


import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.SanPham;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.PageRequest;
import java.awt.print.Pageable;


import java.util.List;

@Service
public interface SanPhamService {
    public List<SanPham> getAllSanPham();
    public long getSoLuongSanPham();
    public List<SanPham> getSanPhamBanChay();
    public SanPham getSanPhamById(String id);
    public List<SanPham> getSanPhamTheoTrang(int pageNumber, int pageSize);
    public void addSanPham(SanPham sanPham);
    public void updateSanPham(SanPham sanPham);
    public void deleteSanPham(String id);
    public List<SanPham> getSanPhamByType(String type);
    public List<SanPham> getSanPhamByTen(String tenSanPham,String type);

    public List<SanPham> filterProducts(String tenSanPham,String type,Integer minPrice, Integer maxPrice, List<String> priceRange, String sortOrder);


    public List<SanPham> searchProducts(String tenSanPham);

}
