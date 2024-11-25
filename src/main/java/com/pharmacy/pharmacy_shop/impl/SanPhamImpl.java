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
    public List<SanPham> getSanPhamByTen(String tenSanPham) {
        return sanPhamRepo.findAllByTenSanPham(tenSanPham);
    }

    @Override
    public List<SanPham> filterProducts(Integer minPrice, Integer maxPrice, List<String> priceRange) {
        return sanPhamRepo.findAllByGiaBanBetweenAndPriceRange(minPrice, maxPrice, priceRange.get(0));
    }
}
