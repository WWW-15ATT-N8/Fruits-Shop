<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="nhom08.entity.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css">

</head>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<body>
	<div class="wrapper">
		<jsp:include page="partial/navbar.jsp"></jsp:include>
		<jsp:include page="partial/asidebar.jsp"></jsp:include>
		<div class="content-wrapper">
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<jsp:include page="partial/header.jsp">
								<jsp:param name="name" value="Dashboard" />
							</jsp:include>
						</div>
					</div>
				</div>
			</div>
			<div class="content-header">
				<section class="content">
					<div class="container-fluid">

						<div class="row">
							<div class="col-lg-3 col-6">
								<div class="small-box bg-info">
									<div class="inner bg-info disabled">
										<h3>${ totalOrder}</h3>
										<p>Total Orders</p>
									</div>
									<div class="icon">
										<i class="fa-solid fa-cart-shopping"></i>
									</div>
									<a href="${pageContext.request.contextPath}/admin/order/list"
										class="small-box-footer">More info <i
										class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<div class="col-lg-3 col-6">
								<div class="small-box bg-warning">
									<div class="inner bg-warning disabled">
										<h3>${theWatingOrder}</h3>
										<p>The waiting order</p>
									</div>
									<div class="icon">
										<i class="fa-solid fa-rotate"></i>
									</div>
									<a
										href="${pageContext.request.contextPath}/admin/order/list?phone=&statusID=1&filter=1"
										class="small-box-footer">More info <i
										class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<div class="col-lg-3 col-6">
								<div class="small-box bg-teal">
									<div class="inner bg-teal disable">
										<h3>${customerRegis}</h3>
										<p>Customer Registrations</p>
									</div>
									<div class="icon">
										<i class="fa-solid fa-user"></i>
									</div>
									<a
										href="${pageContext.request.contextPath}/admin/user/list?roleID=2&fullName=&phone=&email=&address="
										class="small-box-footer">More info <i
										class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<div class="col-lg-3 col-6">
								<div class="small-box bg-danger">
									<div class="inner bg-danger disabled">
										<h3>${ lowStockProduct }</h3>
										<p>Low stock product</p>
									</div>
									<div class="icon">
										<i class="fa-solid fa-cart-flatbed"></i>
									</div>
									<a
										href="${pageContext.request.contextPath}/admin/product/list?name=&newProduct=all&price=0%3B10000&bestSaler=all&category=-1&stock=0%3B5"
										class="small-box-footer">More info <i
										class="fas fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<i class="fa-solid fa-chart-pie"></i> Biểu đồ doanh thu
								</div>
								<div class="card-body">
									<canvas id="myChart" style="width: 100%;"></canvas>
								</div>
							</div>

						</div>
					</div>
					<div class="row">
						
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">Danh sách hóa đơn mới nhất</div>
								</div>
								<div class="card-body">
									<table class="table table-bordered table-hover data-table-form">
										<thead>
											<tr>
												<th class="text-capitalize">Date Added</th>
												<th class="text-capitalize">Customer name</th>
												<th class="text-capitalize">Total</th>
												<th class="text-capitalize">Status</th>
												<th style="width: 130px;" class="text-capitalize text-right">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${lastOrders}" var="order">
												<c:url var="DetailOrder" value="/admin/order/detail">
													<c:param name="orderID" value="${order.orderID}" />
												</c:url>
												<tr>
													<td>${ order.createdDate }</td>
													<td>${ order.user.fullName}</td>
													<td><fmt:formatNumber value="${ order.total }"
															type="number" maxFractionDigits="0" /> VND</td>
													<td>${ order.status.name }</td>
													<td>
													
													<a id="DetailOrder" href="${ DetailOrder }"
												type="button" class="btn btn-warning mr-2"
												style="width: 90%; margin-bottom: 2%; color: white;"> <i
													class="fa-regular fa-file-lines"></i> Chi tiết
											</a> <%-- ${((order.status.statusID != 4 && order.status.statusID != 5) ? '<a id="deleteOrder" href="${ deleteOrder}" class="btn btn-danger" style="width: 90%; margin-top:2%;"> <i class="fa-solid fa-trash"></i> Hủy đơn</a>' : '')}	
													 --%>
													
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
			</section>
		</div>
		<jsp:include page="partial/footer.jsp"></jsp:include>
		<jsp:include page="partial/control-sidebar.jsp"></jsp:include>
	</div>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
	<script type="text/javascript">
	
		<% List<Double> priceInDay = (List<Double>) request.getAttribute("priceInDay"); %>
		var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0') - 1;
		var mm = String(today.getMonth() + 1).padStart(2, '0');
		var valuePrice = []
		var arrDay = [];
		<% for(Double price : priceInDay) {%>
			valuePrice.push(<%= price %>);
		<% } %>
		for (var i = 9; i >= 0; i--) {
			arrDay.push((dd-i)+'/'+mm)
		}
		console.log(valuePrice);
		var xValues = arrDay;
		var yValues = valuePrice;
		new Chart("myChart", {
			  type: "line",
			  data: {
			    labels: xValues,
			    datasets: [{
			      fill: false,
			      lineTension: 0,
			      backgroundColor: "rgba(0,0,255,1.0)",
			      borderColor: "rgba(0,0,255,0.1)",
			      data: yValues
			    }]
			  },
			  options: {
			    legend: {display: false},
			    scales: {
			      yAxes: [{ticks: {min: 0, max:100000000}}],
			    }
			  }
			});
			
	</script>
</body>
</html>