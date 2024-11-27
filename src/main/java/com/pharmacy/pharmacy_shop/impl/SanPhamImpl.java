
package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.reposities.SanPhamRepo;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Collectors;
import java.util.Optional;
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
        return sanPhamRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy sản phẩm với ID: " + id));
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
    public List<SanPham> filterProducts(String tenSanPham,String type, Integer minPrice, Integer maxPrice, List<String> priceRange, String sortOrder) {

        List<SanPham> filteredProducts = getSanPhamByType(type); // Lấy sản phẩm theo loại

        // Lọc theo từ khóa tìm kiếm (nếu có)
        if (tenSanPham != null && !tenSanPham.isEmpty()) {
            filteredProducts = filteredProducts.stream()
                    .filter(p -> p.getTenSanPham().toLowerCase().contains(tenSanPham.toLowerCase()))
                    .collect(Collectors.toList());
        }

        // Lọc theo khoảng giá
        filteredProducts = filteredProducts.stream()
                .filter(p -> p.getGiaBan() >= minPrice && p.getGiaBan() <= maxPrice)
                .collect(Collectors.toList());

        // Lọc theo priceRange
        // Lọc theo các khoảng giá đã chọn trong priceRange
        if (priceRange != null && !priceRange.isEmpty()) {
            for (String range : priceRange) {
                if (range == null) {
                    continue;  // Bỏ qua phần tử null nếu có
                }
                switch (range) {
                    case "under100000":
                        filteredProducts = filteredProducts.stream()
                                .filter(p -> p.getGiaBan() < 100)
                                .collect(Collectors.toList());
                        break;
                    case "100000-300000":
                        filteredProducts = filteredProducts.stream()
                                .filter(p -> p.getGiaBan() >= 100 && p.getGiaBan() <= 300)
                                .collect(Collectors.toList());
                        break;
                    case "300000-500000":
                        filteredProducts = filteredProducts.stream()
                                .filter(p -> p.getGiaBan() >= 300 && p.getGiaBan() <= 500)
                                .collect(Collectors.toList());
                        break;
                    case "over500000":
                        filteredProducts = filteredProducts.stream()
                                .filter(p -> p.getGiaBan() > 500)
                                .collect(Collectors.toList());
                        break;
                    default:
                        break;
                }
            }
        }


        // Sắp xếp theo giá nếu sortOrder được cung cấp
        if ("asc".equals(sortOrder)) {
            filteredProducts.sort(Comparator.comparing(SanPham::getGiaBan));
        } else if ("desc".equals(sortOrder)) {
            filteredProducts.sort(Comparator.comparing(SanPham::getGiaBan).reversed());
        }

        return filteredProducts;
    }



    public List<SanPham> findSimilarProducts(String type, String excludeId) {
        return sanPhamRepo.findByTypeIdAndIdNot(type, excludeId);
    }

//    @Override
//    public List<SanPham> getSameBrandProducts(String brand, String currentProductId) {
//        return sanPhamRepo.findByBrandAndIdNot(brand, currentProductId);
//    }
}
