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

    // Phân trang sản phẩm
    @Override
    public Page<SanPham> getSanPhamPage(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber - 1, pageSize); // Lưu ý là trang bắt đầu từ 0
        return sanPhamRepo.findAll(pageable); // Dùng repository để lấy phân trang
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

        // Gán giá trị mặc định nếu cần
        if (minPrice == null) minPrice = 0;
        if (maxPrice == null) maxPrice = Integer.MAX_VALUE;

        return sanPhamRepo.findAllByGiaBanBetweenAndPriceRange(minPrice, maxPrice,
                priceRange != null && !priceRange.isEmpty() ? priceRange.get(0) : null);
    }
}
