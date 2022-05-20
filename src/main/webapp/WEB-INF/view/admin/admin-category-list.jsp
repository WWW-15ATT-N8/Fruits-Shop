<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loại sản phẩm</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/css/ion.rangeSlider.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/css/OverlayScrollbars.min.css">

</head>
<body class="font-sans antialiased hold-transition sidebar-mini">
	<div class="wrapper">
		<jsp:include page="partial/navbar.jsp"></jsp:include>
		<jsp:include page="partial/asidebar.jsp"></jsp:include>

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<jsp:include page="partial/header.jsp">
								<jsp:param name="name" value="Loại sản phẩm" />
							</jsp:include>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<jsp:include page="partial/breadcrumb.jsp">
								<jsp:param name="item_sub" value="Dashboard" />
								<jsp:param
									value="${pageContext.request.contextPath}/admin/dashboard"
									name="item_sub_src" />
								<jsp:param name="item_main" value="Loại sản phẩm" />
							</jsp:include>
						</div>
					</div>
				</div>
			</div>

			<div class="content">
				<div class="content-fluid">
					<div class="row">
						<div class="col-12">
							<!-- Search form -->
							<div class="card">
								<div class="card-header" aria-expanded="true"
									data-target=".collapse" data-card-widget="collapse"
									style="cursor: pointer;">
									<div class="card-title">
										<i class="fa-solid fa-magnifying-glass"></i> Tìm kiếm
									</div>
									<div class="card-tools">
										<button data-card-widget="collapse" type="button"
											class="btn btn-tool">
											<i class="fas fa-minus"></i>
										</button>
									</div>
								</div>
								<div class="card-body collapse show">
									<form>
										<div class="row">
											<div class="col-6">
												<input type="hidden" name="page" value="1">
												<div class="form-group">
													<label>Tên loại sản phẩm:</label> <input type="search"
														name="name" class="form-control" value="${ name }"
														style="width: 100%;" placeholder="Nhập tên loại sản phẩm">
												</div>
											</div>
											<div class="col-6">
												<div class="form-group">
													<label>Số lượng sản phẩm theo loại:</label>
													<div>
														<input name="rangeNumOfProduct" type="text"
															class="js-range-slider mb-3"
															value="${ rangeNumOfProduct }" />

													</div>
													<!-- <Slider/> -->
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12 text-center">
												<button type="submit" class="btn btn-primary btn-search">
													<i class="fa-solid fa-magnifying-glass"></i> Search
												</button>

											</div>
										</div>
									</form>
								</div>
							</div>
							<!-- Search form -->
							<!-- Table -->
							<div class="card">
								<div class="card-header">
									<div class="card-title">Danh sách loại sản phẩm</div>
									<div class="card-tools">
										<a class="btn btn-primary"
											href="${pageContext.request.contextPath}/admin/category/create"
											style="color: white;">Thêm loại sản phẩm</a>

									</div>
								</div>
								<div class="card-body">

									<table class="table table-bordered table-hover data-table-form">
										<thead>
											<tr>
												<th class="text-capitalize">Name</th>
												<th class="text-capitalize">Num Of Product</th>

												<th style="width: 130px;" class="text-capitalize text-right">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${categories.pageList}" var="category">
												<c:url var="deleteCategory" value="/admin/category/delete">
													<c:param name="categoryID" value="${category.categoryID}" />
												</c:url>
												<c:url var="updateCategory" value="/admin/category/update">
													<c:param name="categoryID" value="${category.categoryID}" />
												</c:url>
												<tr>
													<td>${ category.name }</td>
													<td>${ category.products.size() }</td>
													<td><a id="editCategory" href="${ updateCategory }"
														type="button" class="btn btn-warning mr-2"><i
															class="fa-solid fa-pen-to-square"></i></a> <a
														id="deleteCaterory" href="${ deleteCategory }"
														class="btn btn-danger"><i class="fa-solid fa-trash"></i></a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="card-footer">
									<div class="row">
										<div class="col-6">Pagination</div>
										<div class="col-6">
											<jsp:include page="partial/pagination.jsp">
												<jsp:param name="pageCount" value="${ pageCount }" />
												<jsp:param name="pageCurrent" value="${ pageCurrent }" />
												<jsp:param name="url" value="${ url }" />

											</jsp:include>
										</div>
									</div>
								</div>
							</div>
							<!-- Table -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="partial/footer.jsp"></jsp:include>
		<jsp:include page="partial/control-sidebar.jsp"></jsp:include>

	</div>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/js/ion.rangeSlider.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/js/OverlayScrollbars.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
	<script type="text/javascript">
		$(".js-range-slider").ionRangeSlider({
	        type: "int",
	        min: 0,
	        max: 100,
	        grid: true,
			skin : "round",
	    });
		</script>
</body>
</html>