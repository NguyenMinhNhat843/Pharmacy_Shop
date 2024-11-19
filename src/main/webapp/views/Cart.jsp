<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	<title>Cart</title>
	<style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f5f5f5;
            }

            .cart-container {
                width: 90%;
                margin: 0 auto;
                background-color: white;
                padding: 20px;
                border-radius: 8px;
            }

            h2, h3 {
                margin: 0 0 20px 0;
            }

            /* Flexbox cho 2 cột */
            .cart-content {
                display: flex;
                gap: 20px;
            }

            /* Cột bên trái (giỏ hàng và quà tặng) */
            .left-section {
                flex: 3;
            }

            .cart {
                border-bottom: 1px solid #ccc;
                margin-bottom: 20px;
            }

            .cart-header, .cart-item {
                display: flex;
                align-items: center;
                padding: 10px 0;
            }

            .product-header, .product {
                flex: 2;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .header-item, .price, .quantity, .total {
                flex: 1;
                text-align: center;
            }

            .product img, .gift-item img {
                width: 50px;
                height: 50px;
                border-radius: 4px;
            }

            .product-info {
                display: flex;
                flex-direction: column;
            }

            .product-name {
                font-weight: bold;
                font-size: 14px;
                margin: 0;
            }

            .unit {
                font-size: 12px;
                color: gray;
            }

            .quantity button {
                width: 30px;
                height: 30px;
                border-radius: 50%;
                font-size: 1rem;
            }

            .quantity input {
                width: 40px;
                text-align: center;
                border: none;
                text-align: center;
            }

            .total p, .gift-price {
                font-weight: bold;
                margin: 0;
            }

            .total {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 5px;
            }

            .delete-item {
                background: none;
                border: none;
                cursor: pointer;
                font-size: 20px;
                color: red;
            }

            .gift-section, .cart-summary {
                margin-top: 20px;
                background-color: #fff;
                padding: 10px;
                border-radius: 8px;
            }

            .gift-section {
                margin-top: 20px;
                background-color: #fff;
                padding: 10px;
                border-radius: 8px;
                flex: 4;
            }

            .gift-item {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 10px 0;
                flex: 1;
            }

            .gift-name {
                font-weight: bold;
                font-size: 14px;
            }

            .gift-item .unit {
                font-size: 12px;
                color: gray;
            }

            .gift-info {
                flex: 3;
            }

            .quantity-gift, .total-gift {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 5px;
                flex: 1;
            }

            .total-gift p {
                font-weight: bold;
                margin: 0;
            }


            /* Cột bên phải (Tóm tắt giỏ hàng) */
            .cart-summary {
                flex: 1;
                display: flex;
                flex-direction: column;
                gap: 10px;
                border: 1px solid #ccc;
            }

            .summary-details p {
                display: flex;
                justify-content: space-between;
                margin: 10px 0;
            }

            .total-summary span {
                color: red;
                font-size: 16px;
                font-weight: bold;
            }

            .buy-button {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                margin-top: 10px;
            }

            .buy-button:hover {
                background-color: #0056b3;
            }

            /* ComboBox cho phần chọn mã */
            .promo-code-section {
                display: flex;
                flex-direction: column;
                margin-bottom: 10px;
            }

            .promo-code-section label {
                margin-bottom: 5px;
                font-weight: bold;
            }

            .promo-code {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }


        </style>
</head>
<body>
<div class="cart-container">
    <h2>Giỏ hàng (1)</h2>
    <div class="cart-content">
        <!-- Cột giỏ hàng và quà tặng -->
        <div class="left-section">
            <!-- Giỏ hàng -->
            <div class="cart">
                <div class="cart-header">
                    <div class="product-header">
                        <input type="checkbox"/>
                        <p>Sản phẩm</p>
                    </div>
                    <div class="header-item">Đơn giá</div>
                    <div class="header-item">Số lượng</div>
                    <div class="header-item">Thành tiền</div>
                </div>
                <div class="cart-item">
                    <div class="product">
                        <input type="checkbox"/>
                        <img src="product.jpg" alt="Viên uống"/>
                        <div class="product-info">
                            <p class="product-name">Viên uống cho bà bầu Blackmores Pregnancy & Breast Feeding
                                Gold...</p>
                            <p class="unit">Chai</p>
                        </div>
                    </div>
                    <div class="price">625.000 đ</div>
                    <div class="quantity">
                        <button>-</button>
                        <input type="number" value="1"/>
                        <button>+</button>
                    </div>
                    <div class="total">
                        <p>625.000 đ</p>
                        <button class="delete-item">🗑</button>
                    </div>
                </div>
            </div>

            <!-- Quà tặng -->
            <div class="gift-section">
                <h3>Quà tặng</h3>
                <div class="gift-item">
                    <img src="gift.jpg" alt="Quà tặng"/>
                    <div class="gift-info">
                        <p class="gift-name">Viên uống cho bà bầu Blackmores Pregnancy & Breast Feeding Gold cung cấp
                            vitamin (60 viên)</p>
                        <p class="unit">Chai</p>
                    </div>
                    <!-- Cột Số lượng - Quà tặng -->
                    <div class="quantity-gift">
                        <p>x1</p>
                    </div>
                    <!-- Cột Thành tiền - Quà tặng -->
                    <div class="total-gift">
                        <p>0 đ</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Cột tóm tắt -->
        <div class="cart-summary">
            <h3>Khuyến mãi</h3>
            <div class="promo-code-section">
                <label for="promo-code">Chọn mã:</label>
                <select id="promo-code" class="promo-code">
                    <option value="">Chọn mã khuyến mãi</option>
                    <option value="PROMO10">Giảm 10%</option>
                    <option value="FREESHIP">Miễn phí vận chuyển</option>
                    <option value="DISCOUNT50">Giảm 50.000 đ</option>
                </select>
            </div>
            <div class="summary-details">
                <p>Tạm tính: <span>625.000 đ</span></p>
                <p>Giảm giá ưu đãi: <span>-</span></p>
                <p>Giảm giá sản phẩm: <span>-</span></p>
                <p class="total-summary">Tổng tiền: <span>625.000 đ</span></p>
            </div>
            <button class="buy-button">Mua ngay</button>
        </div>
    </div>
</div>
</body>
</html>