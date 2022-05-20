<%@page import="nhom08.entity.Order"%>
<%@page import="nhom08.entity.User"%>
<%@page import="nhom08.entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Chi tiết hóa đơn</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/css/OverlayScrollbars.min.css">
</head>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<body>
<div class="wrapper">
	<jsp:include page="partial/navbar.jsp"></jsp:include>
	<jsp:include page="partial/asidebar.jsp"></jsp:include>
	<%
	Order o = (Order) request.getAttribute("order");
	%>

	<div class="content-wrapper">
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<jsp:include page="partial/header.jsp">
							<jsp:param name="name" value="Chi tiết hóa đơn #${order.orderID}" />
						</jsp:include>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<jsp:include page="partial/breadcrumb.jsp">
							<jsp:param name="item_sub" value="Hóa đơn" />
							<jsp:param
								value="${pageContext.request.contextPath}/admin/order/list"
								name="item_sub_src" />
							<jsp:param name="item_main" value="Chi tiết hóa đơn" />
						</jsp:include>
					</div>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="content-fluid">
				<div class="row">
					<div class="col-12">

						<div class="card">
							<div class="card-header" aria-expanded="true"
								data-target=".collapse" data-card-widget="collapse"
								style="cursor: pointer;">
								<div class="card-title">
									<i class="fa-solid fa-user"></i> Thông tin hóa đơn
								</div>
								<div class="card-tools">
									<button data-card-widget="collapse" type="button"
										class="btn btn-tool">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body collapse show">
								<div class="row">
									<div class="col-6">
<<<<<<< HEAD
										<p><b>Mã đơn hàng</b>: <%= o.getOrderID()%></p>
										<p><b>Ngày tạo</b>: <%= o.getCreatedDate()%></p>
										<p><b>Địa chỉ giao hàng</b>: <%= o.getShipAddress().toUpperCase()%></p>
										<p><b>Số điện thoại giao hàng</b>: <%= o.getShipPhone()%></p>
=======
										<p>
											<b>Mã đơn hàng</b>:
											<%=o.getOrderID()%></p>
										<p>
											<b>Ngày tạo</b>:
											<%=o.getCreatedDate()%></p>
										<p>
											<b>Địa chỉ giao hàng</b>:
											<%=o.getShipAddress()%></p>
										<p>
											<b>Số điện thoại giao hàng</b>:
											<%=o.getShipAddress()%></p>
>>>>>>> 563ff034ddead2d64a1316926f3617e2a24c0001
									</div>
									<div class="col-6">
										<%
										User u = o.getUser();
										%>
										<p>
											<b>Mã khách hàng</b>:
											<%=u.getUserID()%></p>
										<p>
											<b>Tên khách hàng</b>:
											<%=u.getFullName()%></p>
										<p>
											<b>Số điện thoại</b>:
											<%=u.getPhone()%></p>
										<p>
											<b>Email</b>:
											<%=u.getEmail()%></p>
									</div>
								</div>
								<div class="row">
									<div class="col-4">
										<p>
											<b>Trạng thái đơn hàng</b>:
											<%=o.getStatus().getName()%></p>
									</div>
									<div class="col-4">
										<p>
											<b>Giảm giá</b>:
											<fmt:formatNumber value="<%=o.getDiscount()%>" type="number"
												maxFractionDigits="0" />
											VND
										</p>
									</div>
									<div class="col-4">
										<p>
											<b>Tổng tiền thanh toán</b>:
											<fmt:formatNumber value="<%=o.getTotal()%>" type="number"
												maxFractionDigits="0" />
											VND
										</p>

									</div>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" aria-expanded="true"
								data-target=".collapse" data-card-widget="collapse"
								style="cursor: pointer;">
								<div class="card-title">
									<i class="fa-brands fa-product-hunt"></i> Danh sách sản phẩm
								</div>
								<div class="card-tools">
									<button data-card-widget="collapse" type="button"
										class="btn btn-tool">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body collapse show">
								<table class="table table-bordered table-hover data-table-form">
									<thead>
										<tr>
											<th class="text-capitalize">Mã sản phẩm</th>
											<th class="text-capitalize">Tên sản phẩm</th>
											<th class="text-capitalize">Đơn giá</th>
											<th class="text-capitalize">số lượng</th>
											<th class="text-capitalize">tổng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${detail}" var="detail">
											<tr>
												<td>${ detail.product.productID }</td>
												<td>${ detail.product.name}</td>
												<td><fmt:formatNumber value="${ detail.price }"
														type="number" maxFractionDigits="0" /> VND</td>
												<td>${ detail.amount }</td>
												<td><fmt:formatNumber
														value="${ detail.price*detail.amount }" type="number"
														maxFractionDigits="0" /> VND</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="4"><b>Tổng tiền</b></td>
											<td><fmt:formatNumber value="<%=o.getTotal()%>"
													type="number" maxFractionDigits="0" /> VND</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="partial/footer.jsp"></jsp:include>
	<jsp:include page="partial/control-sidebar.jsp"></jsp:include>
<<<<<<< HEAD
</div>
		<script type="text/javascript"
=======
	<script type="text/javascript"
>>>>>>> 563ff034ddead2d64a1316926f3617e2a24c0001
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/js/OverlayScrollbars.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>


</body>
</html>