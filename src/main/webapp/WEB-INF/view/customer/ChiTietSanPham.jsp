<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<head>
<title>Chi Tiết Sản Phẩm - Vinfruts</title>
<meta name=”viewport” content=” width=device-width, initial-scale=1″>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ChiTietSanPham.css" type="text/css">
<!-- <script src="../js/data.js"></script>
        <script src="../js/functionsHandle.js"></script>
        <script src="../js/regex.js"></script>
        <script src="../js/search.js"></script> -->
</head>
<body>
	<div class="wrapper">

		<jsp:include page="./Navbar.jsp"></jsp:include>

		<div class="container-fluid">
			<div class="container-fluid  content">
				<div class="product">
					<div class="product-name-img">
						<div class="product-img">
							<div class="slideshow-container" id="slideshow">
								<c:forEach items="${img}" var="image">
									 <div class="mySlides"><img src="${pageContext.request.contextPath}${image.src}" class="show-picture" ></div>
								</c:forEach>
								<a class="prev" onclick="plusSlides(-1)">❮</a>
								<a class="next" onclick="plusSlides(1)">❯</a>
								<div class="row-img" id="slide-img"> 
									<%int cnt = 1;%>
									<c:forEach items="${img}" var="image">
										 <div class="column"><img class="demo cursor" src="${pageContext.request.contextPath}${image.src}" onclick="currentSlide(<%=cnt%>)"></div>
										 <%cnt += 1;%>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="product-name">
							<p  id="path" style="color: #dcd0ca;" >
									<a style="color: #dcd0ca;" href="${pageContext.request.contextPath}/">TRANG CHỦ </a> /
									<a style="color: #dcd0ca;" href="${pageContext.request.contextPath}/category/id=${category.categoryID}">${category.name} </a>
							</p>
							<hr>
							<h1 id="product-name-title">${product.name}</h1>
							<p id="product-name-price"><fmt:formatNumber value = "${product.price}" type = "number" maxFractionDigits = "0"/> ₫</p>
							<hr>
							<p id="product-name-discriptions">
								${desc}
							</p>
							<hr>
							<c:url var="addCart" value="/user/cart/addcart"></c:url>
							<form class="order" action="${addCart}" method="get">	
								<input type="hidden" name="productID" value="${product.productID}" > 
								<input type="button" value="-" id="down" onclick="changeValueGH(-1)"> 
								<input type="text" value="1" id="soluong" name='quantity'> 
								<input type="button" value="+" id="up" onclick="changeValueGH(1)"> 
								<input type="submit" value="Thêm vào giỏ" id="themGioHang">
							</form>
							 <c:if test="${addcartError != null}">
								<div class="alert alert-danger col-xs-offset-1 col-xs-10">
									${addcartError}</div>
							</c:if>
							<hr>
							<p id="danhmuc">
							Loại sản phẩm: ${category.name}
							</p>
						</div>
					</div>
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active tab-tt"
							href="#product-informations" role="tab" data-toggle="tab">Mô
								tả</a></li>
						<li class="nav-item "><a class="nav-link tab-tt"
							href="#product-guarantee" role="tab" data-toggle="tab">Đánh giá</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane active product-informations" role="tabpanel"
							id="product-informations">
							<p id="guarantee">
								${product.detail}
							</p>
						</div>
						<div class="tab-pane product-informations guarantee"
							role="tabpanel" id="product-guarantee">
							
						</div>
					</div>

					<div class="sanphamtuongtu">
						<hr>
						<span class="sanphamtuongtu-title">Một số sản phẩm tương tự</span>
						<div class="row" id="sptt-product">
							<c:forEach items="${sam_product}" var="product">
								<div class=" col-6 col-md-3 picture" id="${product.productID}" >
						            <a href="${pageContext.request.contextPath}/product/id=${product.productID}"><img src="${pageContext.request.contextPath}/resources/img/product_picture/img_${product.productID}_1.jpg" alt="Picture"></a>
						            <a href="${pageContext.request.contextPath}/product/id=${product.productID}"><p class="name-watch">${product.name}</p></a>
						            <p class="price"><fmt:formatNumber value = "${product.price}" type = "number" maxFractionDigits = "0"/> ₫</p>
					        	</div>
							</c:forEach>
						</div>
					</div>
				</div>


				<div class="modal bd-example-modal-sm" id="exampleModal"
					tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Giỏ Hàng</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body modal-body-GH">Sản phẩm được thêm
								vào giỏ thành công</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-close" data-dismiss="modal">Đóng</button>
								<a type="button" class="btn btn-goGH" href="${pageContext.request.contextPath}/giohang">Xem
									giỏ hàng</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="./Footer.jsp"></jsp:include>

		</div>
		<script type="text/javascript">
			var slideIndex = 1;
			showSlides(slideIndex);

			function plusSlides(n) {
				showSlides(slideIndex += n);

			}

			function currentSlide(n) {
				showSlides(slideIndex = n);
			}

			function showSlides(n) {
				var i;
				var slides = document.getElementsByClassName("mySlides");
				var dots = document.getElementsByClassName("demo");
				if (n > slides.length) {
					slideIndex = 1
				}
				if (n < 1) {
					slideIndex = slides.length
				}
				for (i = 0; i < slides.length; i++) {
					slides[i].style.display = "none";
				}
				for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className
							.replace(" active", "");
				}
				slides[slideIndex - 1].style.display = "block";
				dots[slideIndex - 1].className += " active";
			}
			function changeValueGH(x) {
				var n = document.getElementById('soluong').value;
				if (!(parseInt(n) == 1 && x == -1))
					document.getElementById('soluong').value = parseInt(n) + x;
			}
		</script>
</body>
</html>