package com.pharmacy.pharmacy_shop.controller;

import com.pharmacy.pharmacy_shop.entity.Account;
import com.pharmacy.pharmacy_shop.entity.SanPham;
import com.pharmacy.pharmacy_shop.services.SanPhamService;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/Detail_Product")
public class ChiTietSanPhamController {

    private static final Logger logger = LoggerFactory.getLogger(ChiTietSanPhamController.class);

    @Autowired
    private SanPhamService sanPhamService;

    // =========================== View: Detail Product
    @GetMapping("")
    public String getProductDetail(@RequestParam(value = "id", required = false) String id, Model model, HttpSession session) {
        // Lấy account từ session
        Account account = (Account) session.getAttribute("loggedInUser");

        // 1. Kiểm tra ID có hợp lệ không
        if (id == null || id.isEmpty()) {
            logger.warn("Product ID is missing in request");
            return "redirect:/home"; // Điều hướng về trang chính nếu thiếu ID
        }

        logger.info("Received request for product ID: {}", id);

        // 2. Lấy sản phẩm chi tiết
        SanPham sanPham = sanPhamService.getSanPhamById(id);
        System.out.println("ChiTietSanPhamController:       " + sanPham);
        if (sanPham == null) {
            logger.warn("Product with ID {} not found", id);
            model.addAttribute("errorMessage", "Sản phẩm không tồn tại hoặc đã bị xóa.");
            return "product-not-found"; // Điều hướng đến trang báo lỗi
        }

        // 3. Lấy danh sách sản phẩm tương tự (cùng type) ngoại trừ sản phẩm hiện tại
        List<SanPham> similarProducts = sanPhamService.findSimilarProducts(sanPham.getType().getId(), sanPham.getId());
        logger.info("Fetched similar products: {} items", similarProducts.size());

//        // 4. Lấy danh sách sản phẩm cùng thương hiệu (cùng brand) ngoại trừ sản phẩm hiện tại
//        List<SanPham> sameBrandProducts = sanPhamService.getSameBrandProducts(sanPham.getBrand(), sanPham.getId());
//        logger.info("Fetched same-brand products: {} items", sameBrandProducts.size());

        // 5. Đưa dữ liệu vào model để hiển thị trên giao diện
        model.addAttribute("account", account);
        model.addAttribute("sanPham", sanPham);
        model.addAttribute("similarProducts", similarProducts);
//       model.addAttribute("sameBrandProducts", sameBrandProducts);

        logger.info("Product details loaded successfully for ID: {}", id);

        // 6. Trả về giao diện chi tiết sản phẩm
        return "Detail_Product";
    }
}
