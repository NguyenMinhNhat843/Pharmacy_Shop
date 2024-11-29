package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.ChiTietGioHang;
import com.pharmacy.pharmacy_shop.entity.DonHang;
import com.pharmacy.pharmacy_shop.entity.PhieuThongTin;
import com.pharmacy.pharmacy_shop.services.DonHangService;
import com.pharmacy.pharmacy_shop.services.GioHangService;
import com.pharmacy.pharmacy_shop.services.PhieuThongTinService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("")
public class ThanhToanController {
    @Autowired
    private GioHangService gioHangService;
    @Autowired
    private PhieuThongTinService phieuThongTinService;
    @Autowired
    private DonHangService donHangService;

    // ========================== Thanh Toan View
    @PostMapping("/thanhtoan")
    public String thanhtoan(Model model, HttpSession session) {
        // Lấy account từ Session
        Account account = (Account) session.getAttribute("loggedInUser");
        // Lấy tổng tiền từ session
        Double tongTien = (Double) session.getAttribute("totalAmount");
        // Lấy danh sách Cart Item t Session
        List<ChiTietGioHang> cartItems = (List<ChiTietGioHang>) session.getAttribute("cartItems");

        model.addAttribute("totalAmount", tongTien);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("account", account);

        return "ThanhToan";
    }

    // ========================= Thanh toan Thanh Cong
    @PostMapping("/thanhtoan/checkout")
    public String checkout(Model model, HttpSession session, @ModelAttribute PhieuThongTin phieuThongTin) {
        // Lấy account từ session
        Account account = (Account) session.getAttribute("loggedInUser");
        // Lấy tổng tiền từ session
        Double tongTien = (Double) session.getAttribute("totalAmount");
        // Lấy danh sách sản phẩm đã đặt từ session
        List<ChiTietGioHang> cartItems = (List<ChiTietGioHang>) session.getAttribute("cartItems");

        // Tạo thực thể Phiếu thông tin
        String phieuThongTinId = phieuThongTinService.autoGenId();
        String firstName = phieuThongTin.getFirstName();
        String lastName = phieuThongTin.getLastName();
        String email = phieuThongTin.getEmail();
        String diaChi = phieuThongTin.getDiaChi();
        String phone = phieuThongTin.getSoDienThoai();
        Integer namSinh = phieuThongTin.getNamSinh();

        // Nếu không có account thì coi phone là ID của phiếu này
        if(account == null) {
            account = new Account();
            account.setId(phone);
        }

        PhieuThongTin new_p = new PhieuThongTin(phieuThongTinId, firstName, lastName, diaChi, phone, email, namSinh, account);

        // Lưu hóa đơn
        DonHang dh = new DonHang();
        dh.setId(donHangService.autoGenID());
        dh.setPhieuThongTin(new_p);
        dh.setPhuongThucThanhToan("Momo");
        // Lấy ngày giờ hiện tại
        LocalDateTime currentDateTime = LocalDateTime.now();
        dh.setNgayTaoHoaDon(currentDateTime);
        dh.setTongTien( new BigDecimal(tongTien));

        // Lưu hóa đơn và chi tiết hóa đơn
//        donHangService.addDonHang(dh, cartItems);

        return "index";
    }
}
