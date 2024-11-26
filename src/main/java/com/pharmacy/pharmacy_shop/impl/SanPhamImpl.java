package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.reposities.SanPhamRepo;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SanPhamImpl implements SanPhamService {
    @Autowired
    private SanPhamRepo sanPhamRepo;

    @Override
    public List<SanPham> getAllSanPham() {
        return sanPhamRepo.findAll();
    }

    @Override
    public List<SanPham> getSanPhamBanChay() {
        return sanPhamRepo.findAllOrderBySoLuongDaBanDesc();
    }

    @Override
    public SanPham getSanPhamById(int id) {
        return null;
    }

    @Override
    public void addSanPham(SanPham sanPham) {

    }

    @Override
    public void updateSanPham(SanPham sanPham) {

    }

    @Override
    public void deleteSanPham(SanPham sanPham) {

    }

    @Override
    public List<SanPham> getSanPhamByType(String type) {
        return sanPhamRepo.getSanPhamByType(type);
    }

    @Override
    public List<SanPham> getSanPhamByTen( String type,String tenSanPham) {
        return sanPhamRepo.findAllByTenSanPham(type,tenSanPham);
    }

    @Override
    public List<SanPham> filterProducts(String type,Integer minPrice, Integer maxPrice, List<String> priceRange) {

        // Gán giá trị mặc định nếu cần
        if (minPrice == null) minPrice = 0;
        if (maxPrice == null) maxPrice = Integer.MAX_VALUE;

        return sanPhamRepo.findAllByGiaBanBetweenAndPriceRange(type,minPrice, maxPrice,
                priceRange != null && !priceRange.isEmpty() ? priceRange.get(0) : null);
    }
}
