package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.reposities.SanPhamRepo;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SanPhamImpl implements SanPhamService {
    @Autowired
    private SanPhamRepo sanPhamRepo;

    @Override
    public List<SanPham> getAllSanPham() {
        return sanPhamRepo.findAll();
    }

    @Override
    public long getSoLuongSanPham() {
        long count  = sanPhamRepo.count();
        return count;
    }

    @Override
    public List<SanPham> getSanPhamBanChay() {
        return sanPhamRepo.findAllOrderBySoLuongDaBanDesc();
    }

    @Override
    public SanPham getSanPhamById(String id) {
        Optional<SanPham> optionalSanPham = sanPhamRepo.findById(id);
        if (optionalSanPham.isPresent()) {
            return optionalSanPham.get();
        } else {
            return null;
        }
    }

    @Override
    public List<SanPham> getSanPhamTheoTrang(int pageNumber, int pageSize) {
        int start_row = (pageNumber - 1) * pageSize;
        List<SanPham> sanPhams = sanPhamRepo.findSanPhamTheoTrang(start_row, pageSize);
        return sanPhams;
    }


    @Override
    public void addSanPham(SanPham sanPham) {
        sanPhamRepo.save(sanPham);
    }

    @Override
    public void updateSanPham(SanPham sanPham) {

    }

    @Override
    public void deleteSanPham(String id) {
        sanPhamRepo.deleteById(id);
    }

    @Override
    public List<SanPham> getSanPhamByType(String type) {
        return sanPhamRepo.getSanPhamByType(type);
    }

    @Override
    public List<SanPham> getSanPhamByTen(String type, String tenSanPham) {
        return sanPhamRepo.findAllByTenSanPham(type, tenSanPham);
    }

    @Override
    public List<SanPham> filterProducts(String type, Integer minPrice, Integer maxPrice, List<String> priceRange, String sortOrder) {

        // Gán giá trị mặc định nếu cần
        if (minPrice == null) minPrice = 0;
        if (maxPrice == null) maxPrice = Integer.MAX_VALUE;

        return sanPhamRepo.findAllByGiaBanBetweenAndPriceRange(type, minPrice, maxPrice,
                priceRange != null && !priceRange.isEmpty() ? priceRange.get(0) : null, sortOrder);
    }

}
