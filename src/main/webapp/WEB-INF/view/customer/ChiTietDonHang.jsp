<%@page import="nhom08.entity.Order_Detail"%>
<%@page import="java.util.List"%>
<%@page import="nhom08.entity.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<title>Trang chủ - Vinfruts</title>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<!-- <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" /> -->
	<!-- <script src="../bootstrap/jquery/jquery-3.6.0.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script> -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Home.css" type="text/css">
	<!--  <script src="../js/data.js"></script>
	        <script src="../js/functionsHandle.js"></script>
	        <script src="../js/regex.js"></script>
	        <script src="../js/search.js"></script>  -->
	        
	 <style type="text/css">
	 	@charset "UTF-8";
		*{
		    margin: 0;
		    padding: 0;
		}
		.container-fluid:nth-child(2){
		    text-align: center;
		}
		.container-fluid{
		    padding: 0 !important;
		}
		.container-fluid .row
		{
		    max-width: 1222.5px;
		    margin: 5vh auto;
		    text-align: left;
		}
		#chitiethoadon{
			min-height: 350px;
		}
		#chitiethoadon .row{
			background-color: #fafafa;
			border: 3px solid #e5e8eb;
		    border-radius: 10px;
		    padding: 2%;
		}
		
		#chitiethoadon .donhang-btn{
			text-align: right !important;
		}
		
	 
	 </style>

</head>
<body>
	<div class="wrapper">
		<jsp:include page="Navbar.jsp"></jsp:include>
		<div class="container-fluid" id="chitiethoadon">
			<%
			 	Order o = (Order)request.getAttribute("ORDER");
			%>
			<div class="row">
				<p style="padding: 0.75rem;font-size: 1.1em;font-weight: 500;">Đơn hàng <b>&num;<%= o.getOrderID()%></b> đã đặt vào <b> ngày <%= o.getCreatedDate().getDate()%> tháng <%= o.getCreatedDate().getMonth()%> 
				năm <%= o.getCreatedDate().getYear() + 1900%></b> và tình trạng hiện tại là <b><%= o.getStatus().getName()%></b></p>
				<table class="table">
			  <thead>
			  	<tr><th colspan="6" class="thead-dark" style="font-size: 2em; color: #878787;">Chi tiết đơn hàng</th></tr>
			    <tr>
			      <th scope="col">Sản phẩm</th>
			      <th scope="col" class="donhang-btn">Đơn giá</th>
			      <th scope="col" style="text-align: center;">Số lượng</th>
			      <th scope="col" class="donhang-btn">tổng</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach items="${ORDER.order_Details}" var="detail">
			  		<tr>
				      <td  style="font-weight: 600;">${detail.product.name}</td>
				      <td class="donhang-btn"><fmt:formatNumber value = "${detail.price}" type = "number" maxFractionDigits = "0"/> VND</td>
				      <td style="text-align: center;">${detail.amount}</td>
				      <td class="donhang-btn"><fmt:formatNumber value = "${detail.price * detail.amount}" type = "number" maxFractionDigits = "0"/> VND</td>
				    </tr>
			  	</c:forEach>
			  	<tr  style="border-top: 3px solid #e5e8eb;"> 
			  		<td colspan="2">Tổng số phụ:</td>
			  		<td colspan="2" class="donhang-btn"><fmt:formatNumber value = "<%= o.getTongTien()%>" type = "number" maxFractionDigits = "0"/> VND</td>
			  	</tr>    
			  	<tr> 
			  		<td colspan="2">Giảm giá:</td>
			  		<td colspan="2" class="donhang-btn"><fmt:formatNumber value = "<%= o.getTongTien()*o.getDiscount()%>" type = "number" maxFractionDigits = "0"/> VND</td>
			  	</tr>
			  	<tr> 
			  		<td colspan="2">VAT (8%):</td>
			  		<td colspan="2" class="donhang-btn"><fmt:formatNumber value = "<%= o.getTongTien()*0.08%>" type = "number" maxFractionDigits = "0"/> VND</td>
			  	</tr>  
			  	<tr> 
			  		<td colspan="2">Phí vận chuyển:</td>
			  		<td colspan="2" class="donhang-btn"><fmt:formatNumber value = "0" type = "number" maxFractionDigits = "0"/> VND</td>
			  	</tr> 		  	
			  </tbody>
			  <tfoot>
			  	<tr> 
			  		<td colspan="2" style="font-size: 1.1em;font-weight: 500;">Tổng cộng</td>
			  		<td colspan="2" class="donhang-btn" style="font-size: 1.1em;font-weight: 500;"><fmt:formatNumber value = "<%= o.getThanhTien() %>" type = "number" maxFractionDigits = "0"/> VND</td>
			  	</tr>  
			  	<tr><th colspan="6"></th></tr>
			  </tfoot>
			</table>
			<p style="padding: 0.75rem;font-size: 1.1em;font-weight: 500;"><b>Số điện thoại nhận hàng:</b> <%= o.getShipPhone()%></p>
			</br>
			<p style="padding: 0.75rem;font-size: 1.1em;font-weight: 500;"><b>Địa chỉ giao hàng:</b> <%= o.getShipAddress()%></p>
			</div>
		</div>
		<jsp:include page="Footer.jsp"></jsp:include>

	</div>
</body>
</html>