package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.DonHang;
import com.pharmacy.pharmacy_shop.services.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/quanly/donhang")
public class DonHangController {

    @Autowired
    private DonHangService donHangService;

    // ========================= Hiển thị danh sách hóa đơn
    @GetMapping("/list")
    public String viewQuanLyDonHang(@RequestParam(value = "page", defaultValue = "1") int page,
                                    @RequestParam(value = "keyword", required = false) String keyword,
                                    @RequestParam(value = "dateFilter", required = false) String dateFilter,
                                    @RequestParam(value = "paymentStatus", required = false) String paymentStatus,
                                    Model model) {
        // Lấy danh sách hóa đơn
        List<DonHang> donHangs = donHangService.getAllDonHang();

        // Lọc theo từ khóa
        if (keyword != null && !keyword.isEmpty()) {
            donHangs = donHangService.filterDonHang(keyword, keyword);
        }

        // Lọc theo ngày
        if (dateFilter != null && !dateFilter.isEmpty()) {
            donHangs = donHangService.filterByDate(donHangs, dateFilter);
        }

        // Lọc theo tình trạng thanh toán
        if (paymentStatus != null && !paymentStatus.isEmpty()) {
            donHangs = donHangService.filterByPaymentStatus(donHangs, paymentStatus);
        }

        // Phân trang
        int pageSize = 10;
        int totalPages = (int) Math.ceil((double) donHangs.size() / pageSize);
        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, donHangs.size());
        List<DonHang> paginatedDonHangs = donHangs.subList(startIndex, endIndex);

        // Lấy dữ liệu tổng hợp (số lượng hóa đơn, tổng tiền, số hóa đơn chưa thanh toán)
        Map<String, Object> summary = donHangService.getOrderSummary();

        // Truyền dữ liệu vào model
        model.addAttribute("donHangs", paginatedDonHangs);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("keyword", keyword);
        model.addAttribute("dateFilter", dateFilter);
        model.addAttribute("paymentStatus", paymentStatus);

        // Thêm dữ liệu tổng hợp vào model
        model.addAttribute("totalOrders", summary.get("totalOrders"));
        model.addAttribute("totalAmount", summary.get("totalAmount"));
        model.addAttribute("pendingOrders", summary.get("pendingOrders"));

        return "ManagerDonHang"; // View hiển thị danh sách hóa đơn
    }

    // ========================= Tìm kiếm hóa đơn
    @GetMapping("/search")
    public String searchDonHang(@RequestParam("keyword") String keyword, Model model) {
        List<DonHang> donHangs = donHangService.filterDonHang(keyword, keyword);
        model.addAttribute("donHangs", donHangs);
        return "ManagerDonHang"; // View hiển thị kết quả tìm kiếm
    }

}
