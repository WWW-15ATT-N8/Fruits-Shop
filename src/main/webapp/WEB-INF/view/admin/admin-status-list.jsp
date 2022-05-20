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
<title>Trạng thái sản phẩm</title>
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
	<jsp:include page="partial/navbar.jsp"></jsp:include>
	<jsp:include page="partial/asidebar.jsp"></jsp:include>

	<div class="content-wrapper">
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<jsp:include page="partial/header.jsp">
							<jsp:param name="name" value="Danh sách trạng thái đơn hàng" />
						</jsp:include>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<jsp:include page="partial/breadcrumb.jsp">
							<jsp:param name="item_sub" value="Dashboard" />
							<jsp:param
								value="${pageContext.request.contextPath}/admin/dashboard"
								name="item_sub_src" />
							<jsp:param name="item_main" value="Trạng thái sản phẩm" />
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
									<i class="fa-solid fa-circle-dot"></i> Danh sách trạng thái
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
											<th class="text-capitalize">Mã trạng thái</th>
											<th class="text-capitalize">Tên trạng thái</th>
											<th class="text-capitalize">Mô tả trạng thái</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${statuses}" var="status">
											<tr>
												<td>${ status.statusID }</td>
												<td>${ status.name}</td>
												<td>${ status.description}</td>
											</tr>
										</c:forEach>
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
	<script type="text/javascript"
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