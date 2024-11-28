package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.services.ChiTietGioHangService;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import org.springframework.ui.Model;
import com.pharmacy.pharmacy_shop.entity.*;
import com.pharmacy.pharmacy_shop.services.GioHangService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class GioHangController {
    @Autowired
    private GioHangService gioHangService;
    @Autowired
    private SanPhamService sanPhamService;

    // ====================== View Gio Hang
    @GetMapping("cart/view")
    public String viewGioHang(Model model, HttpSession session) {
        // Lấy account từ session
        Account account = (Account) session.getAttribute("loggedInUser");

        // Lấy danh sách Cart Item
        List<ChiTietGioHang> cartItems = (List<ChiTietGioHang>) session.getAttribute("cartItems");

        // Kiểm tra giỏ hàng rỗng hay ko
        if(cartItems == null) {
            model.addAttribute("msg", "Không có sản phẩm");
        } else {
            double totalAmount = 0;
            totalAmount = cartItems.stream()
                    .mapToDouble(item -> item.getSanPham().getGiaBan().doubleValue() * item.getSoLuong())
                    .sum();

            model.addAttribute("cartItems", cartItems);
            model.addAttribute("totalAmount", totalAmount);
            model.addAttribute("cartItems", cartItems);
        }

        return "Cart";
    }

    // ====================== Thêm sản phẩm vào giỏ hàng
    @PostMapping("/cart/add")
    public String addToCart(@RequestParam("id") String productId,
                            @RequestParam("quantity") int quantity,
                            HttpSession session, Model model) {

        // Kiểm tra xem người dùng đã đăng nhập chưa
//        Account account = (Account) session.getAttribute("loggedInUser");
//        if (account == null) {
//            model.addAttribute("error", "Please login to add items to the cart.");
//            return "redirect:/login";
//        }

        // Lấy giỏ hàng từ session
        System.out.println("id product: =========================   " + productId);
        List<ChiTietGioHang> cartItems = (List<ChiTietGioHang>) session.getAttribute("cartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("cartItems", cartItems);
        }

        // Lấy sản phẩm từ DB theo productId
        SanPham sanPham = sanPhamService.getSanPhamById(productId);  // Tìm sản phẩm theo ID

        // Kiểm tra nếu sản phẩm đã có trong giỏ hàng
        boolean found = false;
        for (ChiTietGioHang item : cartItems) {
            if (item.getSanPham().getId().equals(productId)) {
                // Nếu đã có thì tăng số lượng lên
                item.setSoLuong(item.getSoLuong() + quantity);
                found = true;
                break;
            }
        }

        // Nếu sản phẩm chưa có trong giỏ, tạo mới
        if (!found) {
            ChiTietGioHang newItem = new ChiTietGioHang();
            newItem.setSanPham(sanPham);
            newItem.setSoLuong(quantity);
            cartItems.add(newItem);
        }

        // Cập nhật giỏ hàng trong session
        session.setAttribute("cartItems", cartItems);

        // Thêm thông báo thành công và chuyển hướng đến giỏ hàng
        model.addAttribute("msg", "Product added to cart successfully.");
        return "redirect:/cart/view";
    }

    @PostMapping("/cart/buyNow")
    public String buyNow(@RequestParam("id") String productId,
                         @RequestParam("quantity") int quantity,
                         HttpSession session, Model model,
                         RedirectAttributes redirectAttributes) {

        // Lấy giỏ hàng từ session
        List<ChiTietGioHang> cartItems = (List<ChiTietGioHang>) session.getAttribute("cartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("cartItems", cartItems);
        }

        // Lấy sản phẩm từ DB theo productId
        SanPham sanPham = sanPhamService.getSanPhamById(productId);

        // Kiểm tra nếu sản phẩm đã có trong giỏ hàng
        boolean found = false;
        for (ChiTietGioHang item : cartItems) {
            if (item.getSanPham().getId().equals(productId)) {
                // Nếu đã có thì tăng số lượng lên
                item.setSoLuong(item.getSoLuong() + quantity);
                found = true;
                break;
            }
        }

        // Nếu sản phẩm chưa có trong giỏ, tạo mới
        if (!found) {
            ChiTietGioHang newItem = new ChiTietGioHang();
            newItem.setSanPham(sanPham);
            newItem.setSoLuong(quantity);
            cartItems.add(newItem);
        }

        // Cập nhật giỏ hàng trong session
        session.setAttribute("cartItems", cartItems);


        // Thêm thông báo thành công vào FlashAttributes
        redirectAttributes.addFlashAttribute("msg", "Product added to cart successfully.");

        // Quay lại trang chi tiết sản phẩm sau khi thêm vào giỏ hàng
        return "redirect:/Detail_Product?id=" + productId;
    }


}
