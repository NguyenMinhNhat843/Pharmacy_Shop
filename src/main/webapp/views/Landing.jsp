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
		<!-- Header -->
		<%@ include file="../includes/Header.jsp" %>
		
		<!-- Banner header -->
		<div class="banner text-white d-flex align-items-center">
			<div class="ps-5">
				<p class="text-wrap fw-bold fs-1" style="width: 650px; text-shadow: 2px 2px 4px gray">
					Cải thiện sức khỏe của bạn với thuốc tốt nhất có trên thị trường
				</p>
				<p class="fw-lighter fs-5 pb-3" style="text-shadow: 2px 2px 4px gray">
					Cải thiện sức khỏe của bạn với thuốc tốt nhất 
				</p>
				<div class="">
					<a href="#" class="btn btn-success me-3 rounded-pill">
						Mua ngay
						<i class="fa-solid fa-cart-shopping"></i>
					</a>
					<a href="#" class="btn btn-success rounded-pill">
						Top products
						<i class="fa-solid fa-arrow-right"></i>
					</a>
				</div>			
			</div>
		</div>
		
		<!-- Điểm nổi bật -->
		<div class="container py-5 d-flex justify-content-between">
			<div class="d-flex justify-content-between align-items-center">
				<div class="icon_point bg-light d-flex justify-content-center align-items-center">
					<i class="fa-solid fa-truck fa-2x"></i>			
				</div>
				<div>
					<p class="fw-bold fs-5" style="">Miễn phí ship toàn quốc</p>
					<p>Miễn ship cho tất cả đơn hành trên 200.000đ</p>				
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center">
				<div class="icon_point bg-light d-flex justify-content-center align-items-center">
					<i class="fa-solid fa-money-bill fa-2x"></i>
				</div>
				<div>
					<p class="fw-bold fs-5" style="">Bảo mật thanh toán</p>
					<p>Chúng tôi đảm bảo bảo mật thanh toán của bạn</p>				
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center">
				<div class="icon_point bg-light d-flex justify-content-center align-items-center">
					<i class="fa-solid fa-rotate-left fa-2x"></i>
				</div>
				<div>
					<p class="fw-bold fs-5" style="">Đảm bảo hoàn tiền</p>
					<p>Hoàn tiền 100% theo chính sách đổi trả</p>				
				</div>
			</div>
			<div class="d-flex justify-content-between align-items-center">
				<div class="icon_point bg-light d-flex justify-content-center align-items-center">
					<i class="fa-solid fa-phone-volume fa-2x"></i>
				</div>
				<div>
					<p class="fw-bold fs-5" style="">Hỗ trợ khách hàng 24/7</p>
					<p>Hỗ trợ khách hàng tận tình mọi lúc mọi nơi</p>				
				</div>
			</div>
		</div>
		
		<!-- banner 2 -->
		<div class="container pb-5 d-flex justify-content-between">
			<a href="./Detail_Product.jsp" class="banner2 text-white rounded d-flex flex-column justify-content-between">
				<p class="fw-bold fs-5">Nevia</p>
				<p class="fw-bold">Sạch sâu từ da mặt, sáng bóng tức thì</p>
			</a>
			<a href="./Detail_Product.jsp" class="banner2 text-white rounded d-flex flex-column justify-content-between">
				<p class="fw-bold fs-5">Nevia</p>
				<p class="fw-bold">Sạch sâu từ da mặt, sáng bóng tức thì</p>
			</a>
			<a href="./Detail_Product.jsp" class="banner2 text-white rounded d-flex flex-column justify-content-between">
				<p class="fw-bold fs-5">Nevia</p>
				<p class="fw-bold">Sạch sâu từ da mặt, sáng bóng tức thì</p>
			</a>
		</div>
		
		<!-- Sản phẩm bán chạy -->
		<div class="container">
			<div class="d-flex justify-content-between align-items-center pb-2 border-bottom">
				<p class="fw-bold fs-4">Sản Phẩm Bán Chạy</p>
				<a href="./List_Product.jsp">View All</a>
			</div>
			
			<!-- product card -->
			<div class="row">
				<% for(int i = 0; i < 4; ++i) { %>
					<div class="mt-3 card product_card col mx-1">
						<a href="./Detail_Product.jsp" style="color: #333">
							<img class="card-img-top" src="../images/landing_banner.jpg" alt="logo" />
							<div class="card-body">
								<div class="rating_block">
									<%
										for(int j = 0; j < 5; ++j) {
									%>
											<i class="fa-solid fa-star" style="color: orange"></i>							
									<%
										}
									%>
								</div>
								<p>Dung dịch vệ sinh mũi cho người lớn</p>
								<div class="d-flex justify-content-between align-items-center">
									<p>143.000đ</p>
									<a 
										href="./Cart.jsp" class="bg-success d-flex justify-content-center align-items-center" 
										style="display: block; width: 40px; height: 40px; border-radius: 50%"
									>
										<i class="fa-solid fa-cart-shopping text-white"></i>										
									</a>
								</div>
							</div>						
						</a>
					</div>
				<% } %>
			</div>	
		</div>
		
		<!-- banner cho sản phẩm bán chạy -->
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
		
		<!-- Đơn hàng tốt nhất cho bạn -->
		<div class="container">
			<div class="d-flex justify-content-between align-items-center pb-2 border-bottom">
				<p class="fw-bold fs-4">Đơn hàng tốt nhất cho bạn</p>
				<a href="./List_Product.jsp">View All</a>
			</div>
			
			<!-- product card -->
			<div class="row">
				<% for(int i = 0; i < 4; ++i) { %>
					<div class="mt-3 card product_card col mx-1">
						<a href="./Detail_Product.jsp" style="color: #333">
							<img class="card-img-top" src="../images/landing_banner.jpg" alt="logo" />
							<div class="card-body">
								<div class="rating_block">
									<%
										for(int j = 0; j < 5; ++j) {
									%>
											<i class="fa-solid fa-star" style="color: orange"></i>							
									<%
										}
									%>
								</div>
								<p>Dung dịch vệ sinh mũi cho người lớn</p>
								<div class="d-flex justify-content-between align-items-center">
									<p>143.000đ</p>
									<a 
										href="./Cart.jsp" class="bg-success d-flex justify-content-center align-items-center" 
										style="display: block; width: 40px; height: 40px; border-radius: 50%"
									>
										<i class="fa-solid fa-cart-shopping text-white"></i>										
									</a>
								</div>
							</div>						
						</a>
					</div>
				<% } %>
			</div>	
		</div>
		
		<!-- sản phẩm bán nhiều nhất -->
		<div class="container pt-5">
			<div class="d-flex justify-content-between align-items-center pb-2 border-bottom">
				<p class="fw-bold fs-4">Sản Phẩm Bán Nhiều Nhất</p>
				<a href="./List_Product.jsp">View All</a>
			</div>
			
			<!-- product card -->
			<div class="row">
				<% for(int i = 0; i < 4; ++i) { %>
					<div class="mt-3 card product_card col mx-1">
						<a href="./Detail_Product.jsp" style="color: #333">
							<img class="card-img-top" src="../images/landing_banner.jpg" alt="logo" />
							<div class="card-body">
								<div class="rating_block">
									<%
										for(int j = 0; j < 5; ++j) {
									%>
											<i class="fa-solid fa-star" style="color: orange"></i>							
									<%
										}
									%>
								</div>
								<p>Dung dịch vệ sinh mũi cho người lớn</p>
								<div class="d-flex justify-content-between align-items-center">
									<p>143.000đ</p>
									<a 
										href="./Cart.jsp" class="bg-success d-flex justify-content-center align-items-center" 
										style="display: block; width: 40px; height: 40px; border-radius: 50%"
									>
										<i class="fa-solid fa-cart-shopping text-white"></i>										
									</a>
								</div>
							</div>						
						</a>
					</div>
				<% } %>
			</div>	
		</div>
		
		<!-- Phản hồi của khách hàng -->
		<div class="container py-5">
			<div class="d-flex justify-content-between align-items-center pb-2 border-bottom">
				<p class="fw-bold fs-4">Phản hồi của khách hàng</p>
				<a href="./List_Product.jsp">View All</a>
			</div>
			
			<div class="row gap-2 flex-nowrap pt-3">
				<% for(int i = 0; i < 4; ++i) { %>
					<div class="col bg-light rounded p-2" style="width: 25%" >
						<div class="d-flex justify-content-space align-items-center">
							<img class="rounded-circle" style="width: 45px; height: 45px" src="../images/landing_banner.jpg" alt="avatar"/>
							<div class="ps-2">
								<p>Daniel Lester</p>
								<p>27 th3 2024</p>
							</div>
						</div>
						<div class="rating_block">
							<%
								for(int j = 0; j < 5; ++j) {
							%>
									<i class="fa-solid fa-star"></i>							
							<%
								}
							%>
						</div>
						<p>Sản phẩm sử dụng rất tốt</p>
					</div>
				<% } %>
			</div>
		</div>
		
		<!-- Bài viết và tips -->
		<div class="container pb-3">
			<div class="d-flex justify-content-between align-items-center pb-2 border-bottom">
				<p class="fw-bold fs-4">Bài viết và mẹo hay</p>
				<a href="./List_Product.jsp">View All</a>
			</div>
			
			<div class="row gap-2 flex-nowrap pt-3">
				<% for(int i = 0; i < 4; ++i) { %>
					<div class="col bg-dark-subtle rounded p-0" style="width: 25%" >
						<a href="./Article.jsp" style="color: #333">
							<div class="">
								<img class="w-100 rounded" src="../images/landing_banner.jpg" alt="avatar"/>
							</div>
							<div class="d-flex justify-content-space align-items-center p-2">
								<p>Daniel Lester</p>
								<p>27 th3 2024</p>
							</div>
							<p class="fw-bold fs-6 px-2 pb-2">Cách chăm sóc da mặt đúng cách</p>
						</a>
					</div>
				<% } %>
			</div>
		</div>
		
		<!-- Câu hỏi thường gặp -->
		<div class="container p-0 pt-5 d-flex justify-content-center">
			<div style="width: 65%">
				<p class="fw-bold fs-3 pb-3 text-center">Câu hỏi phổ biến</p>
				
				<!-- list câu hỏi -->
				<div>
					<% for(int i = 0; i < 4 ; ++i) { %>
						<div class="p-3 bg-dark-subtle rounded mb-3 d-flex justify-content-between align-items-center">
							<p>Làm thế nào để thanh toán bằng momo?</p>
							<i class="fa-solid fa-plus"></i>
							<!-- <i class="fa-solid fa-minus"></i> -->
						</div>
					
					<% } %>
				</div>			
			</div>
		</div>
		
		<!-- footer -->
		<%@ include file="../includes/Footer.jsp" %>
	</div>
</body>
</html>