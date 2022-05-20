<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Trang chủ - Vinfruts</title>
	<meta name=”viewport” content=” width=device-width, initial-scale=1″>
	<!-- <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" /> -->
	<!-- <script src="../bootstrap/jquery/jquery-3.6.0.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script> -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Home.css" type="text/css">
	<!--  <script src="../js/data.js"></script>
	        <script src="../js/functionsHandle.js"></script>
	        <script src="../js/regex.js"></script>
	        <script src="../js/search.js"></script>  -->

</head>
<body>
	<div class="wrapper">

		<jsp:include page="Navbar.jsp"></jsp:include>


		<div class="container-fluid">
			<div class="slideshow-container">

				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/resources/img/slide/slide_01.jpg" style="width: 100%">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/resources/img/slide/slide_02.jpg" style="width: 100%">
				</div>
				<div class="mySlides fade">
					<img src="${pageContext.request.contextPath}/resources/img/slide/slide_01.jpg" style="width: 100%">
				</div>
			</div>

			<div style="text-align: center">
				<span class="dot"></span> <span class="dot"></span> <span
					class="dot"></span>
			</div>
			<div class="name">
				<p class="name-product">SẢN PHẨM MỚI</p>
				<p class="view-all">Xem Tất Cả</p>
			</div>
			<div class="row" id="row-man">
				<c:forEach items="${list_new_product}" var="product">
					<div class=" col-6 col-md-3 picture" id="${product.productID}" >
			            <a href="${pageContext.request.contextPath}/product/id=${product.productID}"><img src="${pageContext.request.contextPath}/resources/img/product_picture/img_${product.productID}_1.jpg" alt="Picture"></a>
			            <a href="${pageContext.request.contextPath}/product/id=${product.productID}"><p class="name-watch">${product.name}</p></a>
			            <p class="price"><fmt:formatNumber value = "${product.price}" type = "number" maxFractionDigits = "0"/> ₫</p>
		        	</div>
				</c:forEach>
			</div>


			<div class="pr-picture">
				<img src="../picture/hinh1.png" alt="">
			</div>


			<div class="name">
				<p class="name-product">SẢN PHẨM BÁN CHẠY</p>
				<p class="view-all">Xem Tất Cả</p>
			</div>
			<div class="row" id="row-woman">
				<c:forEach items="${list_best_saler_product}" var="product">
					<div class=" col-6 col-md-3 picture" id="${product.productID}" >
			            <a href="${pageContext.request.contextPath}/product/id=${product.productID}"><img src="${pageContext.request.contextPath}/resources/img/product_picture/img_${product.productID}_1.jpg" alt="Picture"></a>
			            <a href="${pageContext.request.contextPath}/product/id=${product.productID}"><p class="name-watch">${product.name}</p></a>
			            <p class="price"><fmt:formatNumber value = "${product.price}" type = "number" maxFractionDigits = "0"/> ₫</p>
		        	</div>
				</c:forEach>
			</div>


			<div class="pr-picture">
				<img src="../picture/banner_9.png" alt="">
			</div>


			<div class="name">
				<p class="name-product">- DỊCH VỤ CỦA CHÚNG TÔI -</p>
			</div>
			<div class="row">
				<div class="dich-vu">
					<img src="${pageContext.request.contextPath}/resources/img/banner/banner_01.png" alt="picture"
						class="dich-vu-img">
					<div class="dich-vu-info">
						<h4 class="dich-vu-title">Giỏ quà tặng cao cấp</h4>
						<h6 class="dich-vu-desc">Chúng tôi cung cấp tất cả các loại
							giỏ quà tặng trái cây phù hợp với các nhu cầu của bạn.</h6>
					</div>
				</div>
				<div class="dich-vu">
					<img src="${pageContext.request.contextPath}/resources/img/banner/banner_02.png" alt="picture"
						class="dich-vu-img">
					<div class="dich-vu-info">
						<h5 class="dich-vu-title">Hộp trái cây cao cấp</h5>
						<h6 class="dich-vu-desc">Các loại hộp trái cây nhập khẩu có
							sẵn sang trọng và đảm bảo chất lượng, phù hợp với mọi nhu cầu.</h6>
					</div>
				</div>
				<div class="dich-vu">
					<img src="${pageContext.request.contextPath}/resources/img/banner/banner_03.png" alt="picture"
						class="dich-vu-img">
					<div class="dich-vu-info">
						<h5 class="dich-vu-title">Trái cây nhập khẩu cao cấp</h5>
						<h6 class="dich-vu-desc">Tại Vinfruits, chúng tôi nhập khẩu
							các loại trái cây tươi ngon nhất, đảm bảo nguồn gốc xuất xứ rõ
							ràng.</h6>
					</div>
				</div>
				<div class="dich-vu">
					<img src="${pageContext.request.contextPath}/resources/img/banner/banner_03.png" alt="picture"
						class="dich-vu-img">
					<div class="dich-vu-info">
						<h5 class="dich-vu-title">Giao hàng trái cây trong 2h</h5>
						<h6 class="dich-vu-desc">Chúng tôi cung cấp dịch vụ giao hàng
							nội thành TP.HCM chỉ 2h để giúp bạn có được trải nghiệm mua hàng
							tốt nhất.</h6>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="Footer.jsp"></jsp:include>

	</div>
	<script>
            // localStorage.removeItem('giohang')
            // localStorage.removeItem('soluongsp')
            // changeIconGH();
            // renderMainPage();
            var slideIndex = 0;
            showSlides();

            function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}    
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" activeDot", "");
            }
            slides[slideIndex-1].style.display = "block";  
            dots[slideIndex-1].className += " activeDot";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
            }
        </script>
</body>
</html>