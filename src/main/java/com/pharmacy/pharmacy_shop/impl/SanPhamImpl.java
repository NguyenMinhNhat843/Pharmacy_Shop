
package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.reposities.SanPhamRepo;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import java.util.Comparator;
import java.util.List;

import org.springframework.data.domain.Pageable;
import java.util.*;
import java.util.stream.Collectors;

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
    public long getTongSoLuongDaBan() {
        return sanPhamRepo.getSoLuongDaBan();
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
    public Page<SanPham> getSanPhamByTypePage(String type, Pageable pageable) {
        return sanPhamRepo.getSanPhamByTypePage(type, pageable);
    }


    @Override
    public List<SanPham> getSanPhamByTen(String type, String tenSanPham) {
        return sanPhamRepo.findAllByTenSanPham(type, tenSanPham);
    }



    @Override
    public List<SanPham> filterProducts(String tenSanPham,String type, Integer minPrice, Integer maxPrice, List<String> priceRange, String sortOrder) {


        Map<String, String> slugToTypeIdMap  = new HashMap<>();
        slugToTypeIdMap.put("thuc-pham-chuc-nang", "TP001");
        slugToTypeIdMap.put("thuoc-khong-ke-don", "TP002");
        slugToTypeIdMap.put("dung-cu-y-te", "TP003");
        slugToTypeIdMap.put("san-pham-cham-soc-suc-khoe", "TP004");
        slugToTypeIdMap.put("tieu-duong", "TP005");
        slugToTypeIdMap.put("tim-mach", "TP006");
        slugToTypeIdMap.put("xuong-khop", "TP007");
        slugToTypeIdMap.put("thuoc-ke-don", "TP008");
        slugToTypeIdMap.put("thuoc-cho-be", "TP009");
        slugToTypeIdMap.put("me-va-be", "TP010");
        //Lấy sản phẩm theo loại
        List<SanPham> filteredProducts = (type != null && !type.isEmpty())
                ? sanPhamRepo.findAllByTenSanPham(type, tenSanPham)
                : sanPhamRepo.findAllSanPhamByName(tenSanPham);

        // Lọc theo từ khóa tìm kiếm (nếu có)
        if (tenSanPham != null && !tenSanPham.isEmpty()) {
            filteredProducts = filteredProducts.stream()
                    .filter(p -> p.getTenSanPham().toLowerCase().contains(tenSanPham.toLowerCase()))
                    .collect(Collectors.toList());
        }

        // Lọc theo loại sản phẩm (nếu có)
        if (type != null && !type.isEmpty()) {
            String typeId = slugToTypeIdMap.get(type);
            if (typeId != null) {
                filteredProducts = filteredProducts.stream()
                        .filter(p -> p.getType() != null && p.getType().equals(typeId))
                        .collect(Collectors.toList());
            }
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
                                .filter(p -> p.getGiaBan() < 100000)
                                .collect(Collectors.toList());
                        break;
                    case "100000-300000":
                        filteredProducts = filteredProducts.stream()
                                .filter(p -> p.getGiaBan() >= 100000 && p.getGiaBan() <= 300000)
                                .collect(Collectors.toList());
                        break;
                    case "300000-500000":
                        filteredProducts = filteredProducts.stream()
                                .filter(p -> p.getGiaBan() >= 300000 && p.getGiaBan() <= 500000)
                                .collect(Collectors.toList());
                        break;
                    case "over500000":
                        filteredProducts = filteredProducts.stream()
                                .filter(p -> p.getGiaBan() > 500000)
                                .collect(Collectors.toList());
                        break;
                    default:
                        break;
                }
            }
        }

//
        // Sắp xếp theo giá nếu sortOrder được cung cấp
        if ("asc".equalsIgnoreCase(sortOrder)) {
            filteredProducts.sort(Comparator.comparing(SanPham::getGiaBan));
        } else if ("desc".equalsIgnoreCase(sortOrder)) {
            filteredProducts.sort(Comparator.comparing(SanPham::getGiaBan).reversed());
        }

        // Phân trang




        return filteredProducts;
    }

    @Override
    public List<SanPham> searchProducts(String tenSanPham) {
        return sanPhamRepo.findAllSanPhamByName(tenSanPham);
    }



    public List<SanPham> findSimilarProducts(String type, String excludeId) {
        return sanPhamRepo.findByTypeIdAndIdNot(type, excludeId);
    }

    @Override
    public Integer getTongSoLuongSanPham() {
        return sanPhamRepo.countSanPham();
    }

    @Override
    public Map<String, Integer> getTopSanPhamBanChay() {
        List<SanPham> sanPhams = sanPhamRepo.findAllOrderBySoLuongDaBanDesc();
        return sanPhams.stream()
                .limit(3)
                .collect(Collectors.toMap(SanPham::getTenSanPham, SanPham::getSoLuongDaBan));
    }
}
