<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Header section -->
<div class="container-fluid bg-body-tertiary">
	<nav class="container d-flex py-2 align-items-center">
		<a href="./Landing.jsp" class="logo_wrap d-flex justify-content-center align-items-center">
			<img alt="logo" src='../images/logo.jpg' class="logo_landing" />			
		</a>
		<form class="d-flex flex-grow-1">
			<input type="text" class="form-control me-2" placeholder="Search..." />
			<input class="btn btn-outline-success" type="submit" value="Search" />
		</form>
		<div class="d-flex w-[20]">
			<a class="nav-link ps-3" href="./Login.jsp">Đăng nhập</a>
			<div class="d-flex justify-content-center align-items-center ps-3">
				<i class="fa-solid fa-cart-shopping pe-1"></i>		
				<a class="nav-link" href="./Cart.jsp">Giỏ hàng</a>				
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