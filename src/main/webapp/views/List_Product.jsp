<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.*,jakarta.servlet.http.*"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sản Phẩm Theo Danh Mục </title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">
<%@ include file="../css/Landing_css.jsp" %>
<%@ include file="../css/boostrap_css.jsp" %>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	width: 90%;
	margin: 0 auto;
	max-width: 1500px;
}

.breadcrumb {
	margin: 10px 10px;
	font-size: 12px;
	background-color: #f9f9f9;
}

.breadcrumb a {
	text-decoration: none;
	color: #000;
}

.categories {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
	gap: 16px;
	text-align: center;
	gap: 16px;
}

.grid_link {
	text-decoration: none;
	color: inherit;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.grid_link img {
	width: 100%;
	max-width: 150px;
	height: auto;
	border-radius: 8px;
	transition: transform 0.3s;
	object-fit: cover;
	overflow: hidden;
}

.grid_link p {
	margin-top: 8px;
	font-size: 1rem;
}

.main_section {
	display: flex;
	gap: 20px;
	padding: 20px;
	font-family: Arial, sans-serif;
	flex-direction: row;
}

.header-sort {
	display: flex;
	justify-content: space-between;
	align-items: center;
	text-align: center;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
}

.clear-filter {
	color: #007bff;
	text-decoration: none;
	cursor: pointer;
}

.filter-sidebar {
	width: 180px;
	flex-shrink: 0;
	padding: 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #fff;
	height: 600px;
}

.rentPrice {
	font-weight: bold;
	height: 20px;
	margin-bottom: 10px;
	margin-top: 30px;
}

.filter-sidebar h2 {
	font-size: 1.2rem;
	margin-bottom: 16px;
	font-weight: bold;
}

.filter-section {
	margin-bottom: 20px;
}

.price-input, .brand-input {
	width: 90%;
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	margin-top: 12px;
}

.brand-list {
	max-height: 128px;
	overflow-y: auto;
	transition: max-height 0.3s ease;
}

.brand-list.expanded {
	max-height: 200px;
}

.hidden-brand {
	display: none;
}

.show-more {
	display: inline-block;
	color: #007bff;
	font-size: 0.9rem;
	text-decoration: none;
	cursor: pointer;
	margin-top: 8px;
}

.apply-btn {
	display: block;
	width: 100%;
	padding: 8px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
	text-align: center;
}

.checkbox-group label {
	display: flex;
	align-items: center;
	margin-bottom: 8px;
	font-size: 0.9rem;
	color: grey;
}

.show-more {
	display: inline-block;
	color: #007bff;
	font-size: 0.9rem;
	text-decoration: none;
	cursor: pointer;
	margin-top: 15px;
}

.viewmore-filter {
	text-align: center;
}

.show-more:hover {
	color: #0056b3;
}

.product-grid {
	flex-grow: 1;
}

.sort-options {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
	align-items: center;
	width: 100%;
}

.sort-btn {
	padding: 15px 25px;
	border: 1px solid grey;
	background-color: white;
	color: grey;
	border-radius: 10px;
	cursor: pointer;
	font-weight: 800px;
}

.sort-btn:hover {
	color: darkgrey;
}

.products {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 20px;
}

.product-card {
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 16px;
	background-color: #fff;
	text-decoration: none;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	color: grey;
}

.product-card img {
	max-width: 100%;
	height: auto;
	border-radius: 8px;
}

.product-card h3 {
	font-size: 1rem;
	margin: 8px 0;
	color: black;
	font-weight: bold;
	font-size: 1rem;
}

.price {
	font-weight: bold;
	color: darkblue;
	margin: 0px 0px 10px 0px;
}

.old-price {
	text-decoration: line-through;
	color: #888;
	margin-right: 5px;
}

.buy-btn {
	padding: 8px 16px;
	border: none;
	background-color: #0056b3;
	color: #fff;
	border-radius: 15px;
	cursor: pointer;
	margin-top: 10px;
	height: 50px;
	font-weight: bold;
	font-size: 20px;
}

.buy-btn:hover {
	background-color: darkblue;
}

.span-text {
	display: flex;
	font-size: 15px;
	color: grey;
}

.span-text span {
	margin-right: 5px;
	text-align: center;
	align-items: center;
}

.product-title {
	display: -webkit-box;
	-webkit-box-orient: vertical; /* Định hướng thành cột */
	-webkit-line-clamp: 2; /* Giới hạn tối đa 2 dòng */
	overflow: hidden; /* Ẩn phần vượt quá */
	text-overflow: ellipsis; /* Hiển thị dấu ba chấm */
	line-height: 1.2; /* Thiết lập chiều cao dòng */
	max-height: 2.4em;
}

.product_list_main {
	flex-grow: 1;
}

.load-more {
	display: flex;
	justify-content: center;
}

.view-more-btn {
	background-color: white;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	justify-content: center;
	margin-top: 20px;
	width: 250px;
	height: 50px;
	border: 1px solid #0056b3;
	color: #0056b3;
	font-size: 20px;
}

.view-more-btn:hover {
	background-color: lightblue;
}
</style>
<body>
<%@ include file="../includes/Header.jsp" %>
	<div class="container">
		<div class="breadcrumb">
			<a href="#">Trang chủ</a> &gt; <span>Thực phẩm chức năng</span>
		</div>
		<h2>Thực phẩm chức năng</h2>
		<div class="categories">
			<a href="#" class="grid_link"> <img
				src="../images/List_Product/ForChildren.png"
				alt="Thực phẩm chức năng 1">
				<p>Dành cho trẻ em</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/BeautiCare.jpg"
				alt="Thực phẩm chức năng 2">
				<p>Chăm sóc sắc đẹp</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/HeartCare.jpg"
				alt="Thực phẩm chức năng 3">
				<p>Chăm sóc tim mạch</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/RespiratoryGroup.jpg"
				alt="Thực phẩm chức năng 4">
				<p>Nhóm hô hấp</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/TaiMuiHong.jpg"
				alt="Thực phẩm chức năng 5">
				<p>Nhóm Tai/Mũi/Họng</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/vitami.jpg" alt="Thực phẩm chức năng 6">
				<p>Vitamin và Khoáng Chất</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/SupportsSexPhysiology.jpg"
				alt="Thực phẩm chức năng 7">
				<p>Hỗ trợ sinh lý nam nữ</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/LiverCare.jpg"
				alt="Thực phẩm chức năng 8">
				<p>Chăm sóc gan</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/NeurologicalCare.jpg"
				alt="Thực phẩm chức năng 9">
				<p>Nhóm thần kinh</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/loseweight.jpg"
				alt="Thực phẩm chức năng 10">
				<p>Giảm cân</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/BloodSugar.jpg"
				alt="Thực phẩm chức năng 11">
				<p>Nhóm đường huyết</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/BoneJointCare.jpg"
				alt="Thực phẩm chức năng 12">
				<p>Nhóm cơ xương khớp</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/StomachCare.jpg"
				alt="Thực phẩm chức năng 13">
				<p>Nhóm dạ dày</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/KidneyCare.jpg"
				alt="Thực phẩm chức năng 14">
				<p>Nhóm thận tiết niệu</p>
			</a> <a href="#" class="grid_link"> <img
				src="../images/List_Product/WomenCare.jpg"
				alt="Thực phẩm chức năng 15">
				<p>Dành cho phụ nữ mang thai</p>
			</a>
		</div>
		<div class="main_section">
			<div>
				<aside>
					<aside class="filter-sidebar">
						<div class = "header-sort">
							<h2>Bộ lọc</h2>
							<a href="#" class="clear-filter">Thiết lập lại</a>
						</div>
					
						<div class="filter-section">
								<div class="rentPrice">
									<label>Khoảng giá</label>
								</div>
							 <input type="number"
								placeholder="Tối thiểu" class="price-input"> <input
								type="number" placeholder="Tối đa" class="price-input">
							<button class="apply-btn">Áp dụng</button>
						</div>
						<div class="filter-section">
							<div class="checkbox-group">
								<label><input type="checkbox"> Dưới 100.000 đ</label> <label><input
									type="checkbox"> 100.000 đ - 300.000 đ</label> <label><input
									type="checkbox"> 300.000 đ - 500.000 đ</label> <label><input
									type="checkbox"> Trên 500.000 d</label>
							</div>
						</div>
						<!-- Brand Filter -->
						<div class="filter-section">
							<label>Thương hiệu</label> <input type="text"
								placeholder="Nhập tên thương hiệu" class="brand-input">
							<div class="checkbox-group brand-list">
								<label><input type="checkbox"> 6 Enzymes IP</label> <label><input
									type="checkbox"> 82X</label> <label><input
									type="checkbox"> Aan Pharma</label> <label><input
									type="checkbox"> Abbott</label> <label><input
									type="checkbox"> Abipha</label> <label><input
									type="checkbox" class="hidden-brand"> Brand X</label> <label><input
									type="checkbox" class="hidden-brand"> Brand Y</label> <label><input
									type="checkbox" class="hidden-brand"> Brand Z</label> <label><input
									type="checkbox" class="hidden-brand"> Brand A</label> <label><input
									type="checkbox" class="hidden-brand"> Brand B</label> <label><input
									type="checkbox" class="hidden-brand"> Brand C</label>
							</div>
							<div class = "viewmore-filter">
								<a href="#" class="show-more">Xem thêm</a>
							</div>
						</div>
					</aside>
			</div>
			<div class="product_list_main">
				<main class="product-grid">
					<div class="sort-options">
						<label class="labelSort">Sắp xếp theo:</label>
						<button class="sort-btn">Giá giảm dần</button>
						<button class="sort-btn">Giá tăng dần</button>
					</div>
					<div class="products">
						<a href="#" class="product-card"> <img
							src="../images/Product/botChart.jpg" alt="Product Image">
							<h3 class="product-title">Bột Charz giúp bù nước và chất
								điện giải hương cam (Hộp 30 gói)</h3> <del class="price"> </del>
							<p class="price">183.000 đ/Hộp</p>
							<div class="span-text">
								<span class="heart-icon"><i class="fas fa-heart"></i></span> <span>38.9k</span>
								<span>|</span> <span>Đã bán 6.7k</span>
							</div>
							<button class="buy-btn">Chọn sản phẩm</button>
						</a> <a href="#" class="product-card"> <img
							src="../images/Product/BotProanti.jpg" alt="Product Image">
							<h3 class="product-title">Bột PROANTIOBIOPLUS hỗ trợ làm
								giảm các triệu chứng rối loạn tiêu hóa</h3> <del class="price">
								<span class="old-price">490.000 đ</span>
							</del>
							<p class="price">343.000 đ/Hộp</p>
							<div class="span-text">
								<span class="heart-icon"><i class="fas fa-heart"></i></span> <span>32.7k</span>
								<span>|</span> <span>Đã bán 7.4k</span>
							</div>
							<button class="buy-btn">Chọn sản phẩm</button>
						</a> <a href="#" class="product-card"> <img
							src="../images/Product/BotHoaTanIsogos.jpg" alt="Product Image">
							<h3 class="product-title">Bột hòa tan Infogos bổ sung chất
								xơ, hỗ trợ giảm nguy cơ táo bón (Hộp 30 gói x 3g)</h3> <del
								class="price"> </del>
							<p class="price">117.000 đ/Hộp</p>
							<div class="span-text">
								<span class="heart-icon"><i class="fas fa-heart"></i></span> <span>37.6k</span>
								<span>|</span> <span>Đã bán 7.4k</span>
							</div>
							<button class="buy-btn">Chọn sản phẩm</button>
						</a> <a href="#" class="product-card"> <img
							src="../images/Product/enzymaxKid.jpg" alt="Product Image">
							<h3 class="product-title">Bột pha uống Enzymax Kids giúp bé
								tăng cường hấp thu dinh dưỡng (30 gói)</h3> <del class="price">

							</del>
							<p class="price">360.000 đ/Hộp</p>
							<div class="span-text">
								<span class="heart-icon"><i class="fas fa-heart"></i></span> <span>32.5k</span>
								<span>|</span> <span>Đã bán 6.0k</span>
							</div>
							<button class="buy-btn">Chọn sản phẩm</button>
						</a> <a href="#" class="product-card"> <img
							src="../images/Product/lactomin.jpg" alt="Product Image">
							<h3 class="product-title">Bột pha uống Lactomin Plus bổ sung
								vi khuẩn có ích & hỗ trợ phòng ngừa rối loạn tiêu hóa (30
								gói/hộp)</h3> <del class="price"> </del>
							<p class="price">174.000 đ/Hộp</p>
							<div class="span-text">
								<span class="heart-icon"><i class="fas fa-heart"></i></span> <span>18.6k</span>
								<span>|</span> <span>Đã bán 2.1k</span>
							</div>
							<button class="buy-btn">Chọn sản phẩm</button>
						</a> <a href="#" class="product-card"> <img
							src="../images/Product/vuongnaokhang.jpg" alt="Product Image">
							<h3 class="product-title">Bột pha uống giúp hoạt huyết, tăng
								cường vi chất não cho trẻ Vương Não Khang (Hộp 30 gói)</h3> <del
								class="price"> </del>
							<p class="price">215.000 đ/Hộp</p>
							<div class="span-text">
								<span class="heart-icon"><i class="fas fa-heart"></i></span> <span>38.4k</span>
								<span>|</span> <span>Đã bán 5.1k</span>
							</div>
							<button class="buy-btn">Chọn sản phẩm</button>
						</a> <a href="#" class="product-card"> <img
							src="../images/Product/edoz.jpg" alt="Product Image">
							<h3 class="product-title">Bột sủi bọt Edoz DHG hỗ trợ giảm
								triệu chứng khó tiêu, đầy hơi (Hộp 24 gói x 2g)</h3> <del
								class="price"> </del>
							<p class="price">30.000 đ/Hộp</p>
							<div class="span-text">
								<span class="heart-icon"><i class="fas fa-heart"></i></span> <span>33.4k</span>
								<span>|</span> <span>Đã bán 6.2k</span>
							</div>
							<button class="buy-btn">Chọn sản phẩm</button>
						</a> <a href="#" class="product-card"> <img
							src="../images/Product/probio.jpg" alt="Product Image">
							<h3 class="product-title">Bột uống Kolmar Condition Probio
								Cumin Hỗ trợ tiêu hóa (Hộp 30 gói)</h3> <del class="price">
								<span class="old-price">240.000 đ</span>
							</del>
							<p class="price">204.000 đ/Hộp</p>
							<div class="span-text">
								<span class="heart-icon"><i class="fas fa-heart"></i></span> <span>37.7k</span>
								<span>|</span> <span>Đã bán 7.2k</span>
							</div>
							<button class="buy-btn">Chọn sản phẩm</button>
						</a> <a href="#" class="product-card"> <img
							src="../images/Product/ferrolip.jpg" alt="Product Image">
							<h3 class="product-title">Bột uống FERROLIP bổ sung sắt (Hộp
								20 gói)</h3> <del class="price"> </del>
							<p class="price">360.000 đ/Hộp</p>
							<div class="span-text">
								<span class="heart-icon"><i class="fas fa-heart"></i></span> <span>32.7k</span>
								<span>|</span> <span>Đã bán 7.4k</span>
							</div>
							<button class="buy-btn">Chọn sản phẩm</button>
						</a> <a href="#" class="product-card"> <img
							src="../images/Product/healthaid.jpg" alt="Product Image">
							<h3 class="product-title">Bột uống Health Aid Bifina R bổ
								sung men vi sinh giảm rối loạn tiêu hóa, đại tràng (60 gói)</h3> <del
								class="price"> </del>
							<p class="price">1.000.000 đ/Hộp</p>
							<div class="span-text">
								<span class="heart-icon"><i class="fas fa-heart"></i></span> <span>38.1k</span>
								<span>|</span> <span>Đã bán 5.1k</span>
							</div>
							<button class="buy-btn">Chọn sản phẩm</button>
						</a>
					</div>
					<div class="load-more">
						<button class="view-more-btn">Xem thêm</button>
					</div>
				</main>
			</div>
		</div>
	</div>

<%@ include file="../includes/Footer.jsp" %>
</body>
</html>