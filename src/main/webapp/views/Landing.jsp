<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<%@ include file="../css/Landing_css.jsp" %>
<%@ include file="../css/boostrap_css.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<!-- Header section -->
		<div class="container-fluid bg-body-tertiary">
			<nav class="container d-flex py-2 align-items-center">
				<div class="logo_wrap d-flex justify-content-center align-items-center">
					<img alt="logo" src='../images/logo.jpg' class="logo_landing" />			
				</div>
				<form class="d-flex flex-grow-1">
					<input type="text" class="form-control me-2" placeholder="Search..." />
					<input class="btn btn-outline-success" type="submit" value="Search" />
				</form>
				<div class="d-flex w-[20]">
					<a class="nav-link ps-3" href="#">Đăng nhập</a>
					<div class="d-flex justify-content-center align-items-center ps-3">
						<i class="fa-solid fa-cart-shopping pe-1"></i>		
						<a class="nav-link" href="#">Giỏ hàng</a>				
					</div>
				</div>
			</nav>		
		</div>
		
		<!-- Danh muc section -->
		<div class="w-100 py-3 bg-success text-white">
			<div class="container d-flex ">
				<a href="#" class="nav-link pe-3">Thuốc xương khớp</a>
				<a href="#" class="nav-link pe-3">Thuốc tim mạch</a>
				<a href="#" class="nav-link pe-3">Thuốc Cho bé</a>
				<a href="#" class="nav-link pe-3">Thực phẩm bổ sung</a>
				<a href="#" class="nav-link pe-3">Dụng cụ y tế</a>			
			</div>
		</div>
		
		<!-- Banner section -->
		<div class="banner text-white d-flex align-items-center">
			<div class="ps-5">
				<h1 class="text-wrap fw-bold" style="width: 650px">Cải thiện sức khỏe của bạn với thuốc tốt nhất có trên thị trường</h1>
				<p class="fw-lighter fs-5">text test Cải thiện sức khỏe của bạn với thuốc tốt nhất </p>
				<div class="">
					<a href="#" class="btn btn-success me-3 rounded-pill">Mua ngay</a>
					<a href="#" class="btn btn-success rounded-pill">Top products</a>
				</div>			
			</div>
		</div>
		
		<!-- Điểm nổi bật -->
		<div class="container py-5 d-flex justify-content-between">
			<div class="d-flex justify-content-between align-items-center">
				<div class="bg-light d-flex justify-content-center align-items-center" style="width: 50px; height: 50px; border-radius: 50%">
					<i class="fa-solid fa-truck"></i>			
				</div>
				<div>
					<p class="fw-bold fs-5" style="">Miễn phí ship toàn quốc</p>
					<p>Cho tất cả đơn hành trên 200.000đ</p>				
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center" style="width: 25%">
				<div class="bg-light d-flex justify-content-center align-items-center" style="width: 50px; height: 50px; border-radius: 50%">
					<i class="fa-solid fa-truck"></i>			
				</div>
				<div>
					<p class="fw-bold fs-5" style="">Miễn phí ship toàn quốc</p>
					<p>Cho tất cả đơn hành trên 200.000đ</p>				
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center" style="width: 25%">
				<div class="bg-light d-flex justify-content-center align-items-center" style="width: 50px; height: 50px; border-radius: 50%">
					<i class="fa-solid fa-truck"></i>			
				</div>
				<div>
					<p class="fw-bold fs-5" style="">Miễn phí ship toàn quốc</p>
					<p>Cho tất cả đơn hành trên 200.000đ</p>				
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center" style="width: 25%">
				<div class="bg-light d-flex justify-content-center align-items-center" style="width: 50px; height: 50px; border-radius: 50%">
					<i class="fa-solid fa-truck"></i>			
				</div>
				<div>
					<p class="fw-bold fs-5" style="">Miễn phí ship toàn quốc</p>
					<p>Cho tất cả đơn hành trên 200.000đ</p>				
				</div>
			</div>
		</div>
		
		<!-- banner 2 -->
		<div class="container pb-5 d-flex justify-content-between">
			<div class="banner2 text-white rounded d-flex flex-column justify-content-between">
				<p>Nivia</p>
				<p class="fw-bold">Anti-age Skin serum</p>
			</div>
			<div class="banner2 text-white rounded d-flex flex-column justify-content-between">
				<p>Nivia</p>
				<p class="fw-bold">Anti-age Skin serum</p>
			</div>
			<div class="banner2 text-white rounded d-flex flex-column justify-content-between">
				<p>Nivia</p>
				<p class="fw-bold">Anti-age Skin serum</p>
			</div>
		</div>
		
		<!-- trending product section -->
		<div class="container">
			<div class="d-flex justify-content-between align-items-center pb-2 border-bottom">
				<p>Sản Phẩm Bán Chạy</p>
				<a href="#">View All</a>
			</div>
			
			<!-- product card -->
			<div class="row gap-2">
				<%
					for(int i = 0; i < 4; ++i) {
				%>
					<div class="mt-3 card product_card col">
						<img class="card-img-top" src="../images/landing_banner.jpg" alt="logo" />
						<div class="card-body">
							<div class="rating_block">
								<%
									for(int j = 0; j < 5; ++j) {
								%>
										<i class="fa-solid fa-star"></i>							
								<%
									}
								%>
							</div>
							<p>Sửa rửa mặt oxy</p>
							<div class="d-flex justify-content-between align-items-center">
								<p>143.000đ</p>
								<a 
									href="#" class="bg-success d-flex justify-content-center align-items-center" 
									style="display: block; width: 40px; height: 40px; border-radius: 50%">
									<i class="fa-solid fa-cart-shopping text-white"></i>										
								</a>
							</div>
						</div>
					</div>
				<%
					}
				%>
			</div>	
		</div>
		
		<!-- banner best selling -->
		<div class="d-flex justify-content-between container py-5" style="height: 700px">
			<div class="banner_best_seller h-100 me-4 rounded d-flex align-items-center ps-5" style="width: 60%">
				<div class="">
					<p class="text-white btn btn-success rounded-pill fw-bold">25% OFF</p>
					<p class="fs-2 fw-bold">Black Garlic Oil</p>
					<p class="fw-light">Strongest and Thicker Hair</p>
					<p class="fw-bold fs-2">$37.00 <span class="fw-light fs-6">Including Tax</span></p>
				</div>			
			</div>
			<div class="d-flex flex-column justify-content-between h-100" style="width: 40%">
				<div class="banner_best_seller w-100 h-50 mb-2 rounded d-flex align-items-center ps-5">
					<div class="">
						<p class="text-white btn btn-success rounded-pill fw-bold">25% OFF</p>
						<p class="fs-2 fw-bold">Black Garlic Oil</p>
						<p class="fw-light">Strongest and Thicker Hair</p>
						<p class="fw-bold fs-2">$37.00 <span class="fw-light fs-6">Including Tax</span></p>
					</div>		
				</div>
				<div class="banner_best_seller w-100 h-50 mt-2 rounded d-flex align-items-center ps-5">
					<div class="">
						<p class="text-white btn btn-success rounded-pill fw-bold">25% OFF</p>
						<p class="fs-2 fw-bold">Black Garlic Oil</p>
						<p class="fw-light">Strongest and Thicker Hair</p>
						<p class="fw-bold fs-2">$37.00 <span class="fw-light fs-6">Including Tax</span></p>
					</div>		
				</div>				
			</div>
		</div>
		
		<!-- best offer for you -->
		<div class="container">
			<div class="d-flex justify-content-between align-items-center pb-2 border-bottom">
				<p>Đơn hàng tốt nhất cho bạn</p>
				<a href="#">View All</a>
			</div>
			
			<!-- product card -->
			<div class="row gap-2">
				<%
					for(int i = 0; i < 4; ++i) {
				%>
					<div class="mt-3 card product_card col">
						<img class="card-img-top" src="../images/landing_banner.jpg" alt="logo" />
						<div class="card-body">
							<div class="rating_block">
								<%
									for(int j = 0; j < 5; ++j) {
								%>
										<i class="fa-solid fa-star"></i>							
								<%
									}
								%>
							</div>
							<p>Sửa rửa mặt oxy</p>
							<div class="d-flex justify-content-between align-items-center">
								<p>143.000đ</p>
								<a 
									href="#" class="bg-success d-flex justify-content-center align-items-center" 
									style="display: block; width: 40px; height: 40px; border-radius: 50%">
									<i class="fa-solid fa-cart-shopping text-white"></i>										
								</a>
							</div>
						</div>
					</div>
				<%
					}
				%>
			</div>	
		</div>
		
		
	</div>
</body>
</html>