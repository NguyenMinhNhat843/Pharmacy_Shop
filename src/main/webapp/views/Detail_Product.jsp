<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Detail Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<%@ include file="../css/Landing_css.jsp" %>
	<%@ include file="../css/boostrap_css.jsp" %>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
        }
        .container_css {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .product-header {
            display: flex;
            gap: 20px;
        }
        .product-images {
            flex: 1;
            text-align: center;
        }
        .product-main-image {
            width: 100%;
            max-width: 300px;
            border-radius: 8px;
        }
        .product-thumbnails {
            display: flex;
            justify-content: center;
            gap: 5px;
            margin-top: 10px;
        }
        .thumbnail {
            width: 60px;
            height: 60px;
            border-radius: 5px;
            cursor: pointer;
            border: 1px solid #ddd;
        }
        .product-info {
            flex: 2;
        }
        .product-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .product-price {
            font-size: 20px;
            color: #f00;
            margin-bottom: 15px;
        }
        .discount-price {
            font-size: 18px;
            color: #999;
            text-decoration: line-through;
            margin-left: 10px;
        }
        .tab-section {
            display: flex;
            gap: 10px;
            border-bottom: 1px solid #ddd;
            margin-top: 20px;
            padding-bottom: 10px;
        }
        .tab {
            cursor: pointer;
            padding: 10px;
            color: #666;
        }
        .tab.active {
            font-weight: bold;
            color: #333;
            border-bottom: 2px solid #333;
        }
        .tab-content {
            margin-top: 20px;
        }
        .sidebar {
            width: 300px;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
        }
        .btn_css {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            margin-top: 15px;
            font-size: 16px;
        }
        .btn_css:hover {
            background-color: #555;
        }

         /* Q&A Section */
        /* Q&A Section */
    .qa-section {
        margin-top: 40px;
        border-top: 1px solid #ddd;
        padding-top: 20px;
    }
    .qa-title {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 15px;
    }
    .qa-item {
        display: flex;
        margin-bottom: 20px;
    }
    .qa-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        overflow: hidden;
        margin-right: 15px;
    }
    .qa-avatar img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .qa-content {
        background-color: #f9f9f9;
        padding: 10px;
        border-radius: 8px;
        width: 100%;
    }
    .qa-author {
        font-weight: bold;
        color: #333;
    }
    .qa-time {
        font-size: 12px;
        color: #999;
        margin-top: 5px;
    }
        /* Product Carousel */
        .carousel-section {
            margin-top: 40px;
        }
        .carousel-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .carousel {
            display: flex;
            gap: 10px;
            overflow-x: auto;
            padding-bottom: 10px;
        }
        .product-card {
            width: 180px;
            background-color: #f9f9f9;
            border-radius: 8px;
            text-align: center;
            padding: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .product-card img {
            width: 100%;
            border-radius: 8px;
        }
        .product-card-title {
            font-size: 14px;
            margin-top: 10px;
            color: #333;
        }
        .product-card-price {
            color: #f00;
            font-size: 16px;
            margin-top: 5px;
        }
        .product-card-discount {
            font-size: 14px;
            color: #999;
            text-decoration: line-through;
            margin-top: 5px;
        }
        .btn-select {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 10px;
            font-size: 14px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>
<%@ include file="../includes/Header.jsp" %>
<div class="container_css my-5">
    <!-- Product Header Section -->
    <div class="product-header">
        <!-- Image Gallery -->
        <div class="product-images">
            <img src="" alt="Product Image" id="main-image" class="product-main-image">
            <div class="product-thumbnails" id="thumbnails">
                <!-- Thumbnails will be populated dynamically -->
            </div>
        </div>

        <!-- Product Information -->
        <div class="product-info">
            <div class="product-title" id="product-title">Product Name</div>
            <div class="product-price" id="product-price">367,500 ₫</div>
            <div class="discount-price" id="discount-price">735,000 ₫</div>
            <p id="product-status">In Stock</p>
            <button class="btn_css" onclick="addToCart()">Add to Cart</button>
        </div>

        <!-- Sidebar for Additional Options -->
        <div class="sidebar">
            <h4>Order Options</h4>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" min="1" value="1" style="width: 60px; margin-bottom: 20px;">
            <button class="btn_css">Buy Now</button>
            <button class="btn_css">Add to Cart</button>
            <div style="margin-top: 15px;">
                <p>Shipping options:</p>
                <ul>
                    <li>Standard delivery</li>
                    <li>Express delivery</li>
                    <li>Free shipping for orders over 500,000 ₫</li>
                </ul>
            </div>
        </div>
    </div>
    
    <!-- Tab Navigation for Description, Details, etc. -->
    <div class="tab-section">
        <div class="tab active" onclick="showTab('description')">Mô tả</div>
        <div class="tab" onclick="showTab('ingredients')">Thành phần</div>
        <div class="tab" onclick="showTab('usage')">Cách sử dụng</div>
        <div class="tab" onclick="showTab('notes')">Lưu ý</div>
    </div>

    <!-- Tab Contents -->
    <div class="tab-content" id="tab-content">
        <!-- Content will be loaded based on tab selection -->
        <p id="description-content">This is a high-quality product designed to boost health...</p>
    </div>

    <!-- Questions & Answers Section -->
    <div class="qa-section">
        <div class="qa-title">Hỏi & Đáp (16)</div>
        <!-- Example Q&A Item -->
        <div class="qa-item">
            <div class="qa-avatar">
                <img src="${pageContext.request.contextPath}/image/thuoc1.png" alt="Customer Avatar">
            </div>
            <div class="qa-content">
                <div class="qa-author">Khách hàng</div>
                <div class="qa-text">Tôi đã uống hết 2 hộp với lộ trình 6 tháng. Vậy tôi có thể sử dụng tiếp được không hay tạm ngưng bao lâu rồi uống tiếp?</div>
                <div class="qa-time">06:58 08-10-2024</div>
            </div>
        </div>
        <div class="qa-item">
            <div class="qa-avatar">
                <img src="${pageContext.request.contextPath}/image/logoPharmacity.png" alt="Pharmacity Avatar">
            </div>
            <div class="qa-content">
                <div class="qa-author">Pharmacity</div>
                <div class="qa-text">Sản phẩm Viên đông trùng hạ thảo Wellness Nutrition giúp tăng cường sức khỏe...</div>
                <div class="qa-time">14:11 08-10-2024</div>
            </div>
        </div>
    </div>

    <!-- Similar Products Carousel -->
    <div class="carousel-section">
        <div class="carousel-title">Sản phẩm tương tự</div>
        <div class="carousel" id="related-products">
            <!-- Similar Product Cards -->
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/image/thuoc1.png" alt="Product 1">
                <div class="product-card-title">Nước uống đông trùng hạ thảo...</div>
                <div class="product-card-price">258,500 ₫</div>
                <div class="product-card-discount">345,000 ₫</div>
                <a href="#" class="btn-select">Chọn sản phẩm</a>
            </div>
            <!-- Add more product-card divs as needed -->
        </div>
    </div>

    <!-- Same Brand Products Carousel -->
    <div class="carousel-section">
        <div class="carousel-title">Sản phẩm cùng thương hiệu</div>
        <div class="carousel" id="same-brand-products">
            <!-- Same Brand Product Cards -->
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/image/thuoc2.png" alt="Product 2">
                <div class="product-card-title">Viên uống Nature Gift...</div>
                <div class="product-card-price">405,000 ₫</div>
                <a href="#" class="btn-select">Chọn sản phẩm</a>
            </div>
            <!-- Add more product-card divs as needed -->
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="../includes/Footer.jsp" %>
<script>
    function loadProductData() {
        // Placeholder data
        const productData = {
            title: "Wellness Nutrition",
            price: "367,500 ₫",
            discountPrice: "735,000 ₫",
            status: "In Stock",
            mainImage: "${pageContext.request.contextPath}/image/thuoc1.png",
            thumbnails: ["${pageContext.request.contextPath}/image/thuoc1.png", "${pageContext.request.contextPath}/image/thuoc2.png"]
        };

        // Populate product details
        document.getElementById("product-title").textContent = productData.title;
        document.getElementById("product-price").textContent = productData.price;
        document.getElementById("discount-price").textContent = productData.discountPrice;
        document.getElementById("product-status").textContent = productData.status;
        document.getElementById("main-image").src = productData.mainImage;

        // Populate thumbnails
        const thumbnailsContainer = document.getElementById("thumbnails");
        productData.thumbnails.forEach(thumbnail => {
            const img = document.createElement("img");
            img.src = thumbnail;
            img.className = "thumbnail";
            img.onclick = () => document.getElementById("main-image").src = thumbnail;
            thumbnailsContainer.appendChild(img);
        });
    }

    function showTab(tabName) {
        document.getElementById("tab-content").innerHTML = `<p>${tabName} content goes here...</p>`;
        document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
        event.target.classList.add('active');
    }

    function addToCart() {
        alert("Product added to cart!");
    }

    window.onload = loadProductData;
</script>
</body>
</html>
