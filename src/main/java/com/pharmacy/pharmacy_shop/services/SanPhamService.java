package com.pharmacy.pharmacy_shop.services;


import com.pharmacy.pharmacy_shop.entity.SanPham;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface SanPhamService {
    public List<SanPham> getAllSanPham();
    public List<SanPham> getSanPhamBanChay();
    public SanPham getSanPhamById(String id);
    public void addSanPham(SanPham sanPham);
    public void updateSanPham(SanPham sanPham);
    public void deleteSanPham(SanPham sanPham);
    public List<SanPham> findSimilarProducts(String type, String excludeId);
//    public List<SanPham> getSameBrandProducts(String brand, String currentProductId);
}
