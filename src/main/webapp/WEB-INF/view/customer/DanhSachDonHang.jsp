
<%@page import="nhom08.entity.Category"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
	<title>Danh sách hóa đơn - Vinfruts</title>
	<meta name=”viewport” content=” width=device-width, initial-scale=1″>
	<!-- <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" /> -->
	<!-- <script src="../bootstrap/jquery/jquery-3.6.0.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script> -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/DanhSachDonHang.css" type="text/css">
	<!--  <script src="../js/data.js"></script>
	        <script src="../js/functionsHandle.js"></script>
	        <script src="../js/regex.js"></script>
	        <script src="../js/search.js"></script>  -->

</head>
<body>
	<div class="wrapper">

		<jsp:include page="Navbar.jsp"></jsp:include>
		<div class="container-fluid" id="danhsachdonhang">
			<div class="row">
				<!-- <h4>Danh sách đơn hàng của bạn</h4>	 -->
				<table class="table table-hover" id="lichsu-donhang">
				  <thead>
				  	<tr>
				  		<th colspan="6" class="thead-dark">Lịch sử mua hàng</th>
				  	</tr>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Đơn hàng</th>
				      <th scope="col">Ngày </th>
				      <th scope="col">Tình trạng</th>
				      <th scope="col" class="donhang-btn">Tổng</th>
				      <th scope="col" class="donhang-btn">Các thao tác</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%int cnt = 1; %>
				    <c:forEach items="${listorder}" var="order">
						<tr>
					      <th scope="row"><%=cnt%></th>
					      <td>&num;${order.orderID}</td>
					      <td>${order.createdDate}</td>
					      <td>${order.status.name}</td>
					      <td class="donhang-btn"><fmt:formatNumber value = "${order.total}" type = "number" maxFractionDigits = "0"/> VND</td>
					      <td class="donhang-btn"><a class="btn btn-info" href="${pageContext.request.contextPath}/user/order/id=${order.orderID}"> Chi tiết </a></td>
					    </tr>
					    <%cnt++; %>
					</c:forEach>
				  </tbody>
				  <tfoot>
				  	<tr><th colspan="6">&emsp;</th></tr>
				  </tfoot>
				</table>

			</div>	
		</div>
		<jsp:include page="Footer.jsp"></jsp:include>

	</div>
</body>
</html>