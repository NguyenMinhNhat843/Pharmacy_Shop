package com.pharmacy.pharmacy_shop.impl;

import com.pharmacy.pharmacy_shop.entity.DonHang;
import com.pharmacy.pharmacy_shop.entity.ChiTietDonHang;
import com.pharmacy.pharmacy_shop.entity.DonHang;
import com.pharmacy.pharmacy_shop.reposities.ChiTietDonHangRepo;
import com.pharmacy.pharmacy_shop.reposities.DonHangRepo;
import com.pharmacy.pharmacy_shop.services.AccountService;
import com.pharmacy.pharmacy_shop.services.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import com.pharmacy.pharmacy_shop.services.KhuyenMaiService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class DonHangImpl implements DonHangService {
    @Autowired
    private DonHangRepo donHangRepo;
    private ChiTietDonHangRepo chiTietDonHangRepo;

    @Override
    public String autoGenID() {
        DonHang latestDonHang = donHangRepo.findDonHangWithIDMax();
        String latestID = latestDonHang != null ? latestDonHang.getId() : "DH000";

        // Tăng ID
        String prefix = "DH";
        int number = Integer.parseInt(latestID.substring(2)) + 1;
        return prefix + String.format("%03d", number);
    }

    @Override
    public void addDonHang(DonHang donHang, List<ChiTietDonHang> ctdh) {
        // 1. Lưu đơn hàng (DonHang)
        donHang.setNgayTaoHoaDon(LocalDateTime.now());  // Cập nhật thời gian tạo đơn hàng
        donHang.setTongTien(calculateTotalAmount(ctdh)); // Tính tổng tiền đơn hàng
        DonHang savedDonHang = donHangRepo.save(donHang);

        // 2. Lưu chi tiết đơn hàng (ChiTietDonHang)
        for (ChiTietDonHang chiTiet : ctdh) {
            chiTiet.setDonHang(savedDonHang); // Gán đối tượng đơn hàng cho chi tiết đơn hàng
            chiTietDonHangRepo.save(chiTiet);  // Lưu chi tiết đơn hàng
        }
    }

    @Override
    public BigDecimal calculateTotalAmount(List<ChiTietDonHang> chiTietDonHangList) {
        BigDecimal totalAmount = BigDecimal.ZERO;

        for (ChiTietDonHang chiTiet : chiTietDonHangList) {
            BigDecimal thanhTien = BigDecimal.valueOf(chiTiet.getThanhTien()); // Tính tổng tiền của từng chi tiết
            totalAmount = totalAmount.add(thanhTien); // Cộng dồn vào tổng tiền
        }

        return totalAmount;
    }

    @Override
    public Long countOrdersByMonthAndYear(int year, int month) {
        return donHangRepo.countOrdersByMonthAndYear(month, year);
    }

    @Override
    public BigDecimal tongTienTatCaDonHang() {
        return donHangRepo.tongTienTatCaDonHang();
    }

    @Override
    public List<DonHang> getAllDonHang() {
        return donHangRepo.findAll();
    }

    @Override
    public List<DonHang> getDonHangById(String id) {
        Optional<DonHang> donHang = donHangRepo.findById(id);  // Sử dụng Optional để lấy DonHang
        return donHang.map(List::of).orElse(List.of());  // Nếu không tìm thấy, trả về danh sách rỗng
    }

    @Override
    public DonHang addDonHang(DonHang donHang) {
        return donHangRepo.save(donHang);
    }

    @Override
    public void deleteDonHang(String id) {
        donHangRepo.deleteById(id);
    }

    @Override
    public List<DonHang> filterDonHang(String search, String paymentMethod) {
        return donHangRepo.findByIdContainingOrPhuongThucThanhToanContaining(search, paymentMethod);
    }

    @Override
    public Map<String, Object> getOrderSummary() {
        List<DonHang> donHangs = donHangRepo.findAll();

        long totalOrders = donHangs.size();
        BigDecimal totalAmount = donHangs.stream()
                .map(DonHang::getTongTien)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        long pendingOrders = donHangs.stream()
                .filter(donHang -> !donHang.isTinhTrang()) // Tìm các hóa đơn chưa thanh toán
                .count();

        Map<String, Object> summary = new HashMap<>();
        summary.put("totalOrders", totalOrders);
        summary.put("totalAmount", totalAmount);
        summary.put("pendingOrders", pendingOrders);

        return summary;
    }

    @Override
    public List<DonHang> filterByDate(List<DonHang> donHangs, String dateFilter) {
        LocalDate today = LocalDate.now();
        switch (dateFilter) {
            case "today":
                return donHangs.stream()
                        .filter(donHang -> donHang.getNgayTaoHoaDon().toLocalDate().isEqual(today))
                        .collect(Collectors.toList());
            case "thisWeek":
                LocalDate startOfWeek = today.minusDays(today.getDayOfWeek().getValue() - 1); // Lấy đầu tuần
                LocalDate endOfWeek = startOfWeek.plusDays(6); // Lấy cuối tuần
                return donHangs.stream()
                        .filter(donHang -> !donHang.getNgayTaoHoaDon().toLocalDate().isBefore(startOfWeek)
                                && !donHang.getNgayTaoHoaDon().toLocalDate().isAfter(endOfWeek))
                        .collect(Collectors.toList());
            case "thisMonth":
                LocalDate startOfMonth = today.withDayOfMonth(1); // Lấy đầu tháng
                return donHangs.stream()
                        .filter(donHang -> !donHang.getNgayTaoHoaDon().toLocalDate().isBefore(startOfMonth))
                        .collect(Collectors.toList());
            case "lastMonth":
                LocalDate firstDayOfLastMonth = today.minusMonths(1).withDayOfMonth(1); // Đầu tháng trước
                LocalDate lastDayOfLastMonth = firstDayOfLastMonth.withDayOfMonth(firstDayOfLastMonth.lengthOfMonth()); // Cuối tháng trước
                return donHangs.stream()
                        .filter(donHang -> !donHang.getNgayTaoHoaDon().toLocalDate().isBefore(firstDayOfLastMonth)
                                && !donHang.getNgayTaoHoaDon().toLocalDate().isAfter(lastDayOfLastMonth))
                        .collect(Collectors.toList());
            case "all":
            default:
                return donHangs;
        }
    }

    public List<DonHang> filterByPaymentStatus(List<DonHang> donHangs, String paymentStatus) {
        switch (paymentStatus) {
            case "paid":
                return donHangs.stream()
                        .filter(DonHang::isTinhTrang) // Lọc những hóa đơn đã thanh toán (tinhTrang = true)
                        .collect(Collectors.toList());
            case "unpaid":
                return donHangs.stream()
                        .filter(donHang -> !donHang.isTinhTrang()) // Lọc những hóa đơn chưa thanh toán (tinhTrang = false)
                        .collect(Collectors.toList());
            case "all":
            default:
                return donHangs;
        }
    }
}
