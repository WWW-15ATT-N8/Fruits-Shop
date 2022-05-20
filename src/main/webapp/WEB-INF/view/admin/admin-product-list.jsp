<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Sản phẩm</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/css/ion.rangeSlider.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/css/OverlayScrollbars.min.css">
</head>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<body class="font-sans antialiased hold-transition sidebar-mini">
	<div class="wrapper">
		<jsp:include page="partial/navbar.jsp"></jsp:include>
		<jsp:include page="partial/asidebar.jsp"></jsp:include>

		<div class="content-wrapper">
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<jsp:include page="partial/header.jsp">
								<jsp:param name="name" value="Sản phẩm" />
							</jsp:include>
						</div>
						<div class="col-sm-6">
							<jsp:include page="partial/breadcrumb.jsp">
								<jsp:param name="item_sub" value="Dashboard" />
								<jsp:param
									value="${pageContext.request.contextPath}/admin/dashboard"
									name="item_sub_src" />
								<jsp:param name="item_main" value="Sản phẩm" />
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
												<div class="form-group">
													<label>Tên sản phẩm:</label> <input name="name"
														value='<%=request.getParameter("name") == null ? "" : request.getParameter("name")%>'
														class="form-control" style="width: 100%;"
														placeholder="Nhập tên sản phẩm">
												</div>

												<div class="form-group">
													<label>Có phải sản phẩm mới:</label> <select
														class="form-control" name="newProduct"
														style="width: 100%;">
														<% if( request.getAttribute("newProduct") != null) {%>
														<option
															<%= request.getAttribute("newProduct").equals("all") ? "selected='selected'" : "" %>
															value="all">~~ Tất cả ~~</option>
														<option
															${ newProduct == true ? 'selected="selected"' : '' }
															value="true">Sản phẩm mới</option>
														<option
															<% if(!request.getAttribute("newProduct").equals("all")) {%> ${ newProduct==
															false ? 'selected="selected" ' : '' }<%} %> value="false">Không
															phải sản phẩm mới</option>
														<%} else {%>
														<option value="all">~~ Tất cả ~~</option>
														<option value="true">Sản phẩm mới</option>
														<option value="false">Không phải sản phẩm mới</option>

														<%} %>
													</select>
												</div>
												<div class="form-group">
													<label>Giá sản phẩm:</label>
													<div>
														<input id="product-price" type="text" name="price"
															class="js-range-slider"
															value="<%=request.getParameter("price")%>" />
													</div>
												</div>
											</div>

											<div class="col-6">
												<div class="form-group">
													<label>Sản phẩm đang bán chạy :</label> <select
														class="form-control" name="bestSaler" style="width: 100%;">
														<% if( request.getAttribute("bestSaler") != null) {%>
														<option
															<%=  request.getAttribute("bestSaler").equals("all") ? "selected='selected'" : "" %>
															value="all">~~ Tất cả ~~</option>
														<option
															${  bestSaler == true ? 'selected="selected"' : '' }
															value="true">Sản phẩm bán chạy</option>
														<option
															<% if(!request.getAttribute("bestSaler").equals("all")) {%> ${ bestSaler==
															false ? 'selected="selected" ' : '' }<%} %> value="false">Sản
															phẩm không bán chạy</option>
														<%} else {%>
														<option value="all">~~ Tất cả ~~</option>
														<option value="true">Sản phẩm bán chạy</option>
														<option value="false">Sản phẩm không bán chạy</option>

														<%} %>
													</select>
												</div>
												<div class="form-group">
													<label>Loại sản phẩm:</label> <select class="form-control"
														name="category" style="width: 100%;">
														<option value="-1">~~ Tất cả ~~</option>
														<c:forEach items="${categories}" var="category">
															<option
																${ categoryID == category.categoryID ? 'selected="selected"' : '' }
																value="${ category.categoryID }">${ category.name }</option>
														</c:forEach>
													</select>
												</div>
												<div class="form-group">
													<label>Số lượng sản phẩm:</label>
													<div>
														<input id="product-stock" type="text" name="stock"
															class="js-range-slider"
															value="<%=request.getParameter("stock")%>" />
													</div>
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

							<div class="card">
								<div class="card-header">
									<div class="card-title">Danh sách sản phẩm</div>
									<div class="card-tools">
										<a class="btn btn-primary"
											href="${pageContext.request.contextPath}/admin/product/create"
											style="color: white;">Thêm sản phẩm</a>

									</div>
								</div>
								<div class="card-body">
									<table class="table table-bordered table-hover data-table-form">
										<thead>
											<tr>
												<th class="text-capitalize">Name</th>
												<th class="text-capitalize">Price</th>
												<th class="text-capitalize">Stock</th>
												<th class="text-capitalize">New</th>
												<th class="text-capitalize">Best Saler</th>
												<th class="text-capitalize">Category</th>
												<th style="width: 130px;" class="text-capitalize text-right">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${products.pageList}" var="product">
												<c:url var="deleteProduct" value="/admin/product/delete">
													<c:param name="productID" value="${product.productID}" />
												</c:url>
												<c:url var="updateProduct" value="/admin/product/update">
													<c:param name="productID" value="${product.productID}" />
												</c:url>
												<tr>

													<td>${ product.name }</td>
													<td>${ product.price }</td>
													<td>${ product.stock }</td>
													<td class="text-center">${ product.newProduct ? '<i class="fa-regular fa-circle-check mt-3" style="font-size:25px;color:#008000;"></i>' : '<i class="fa-regular fa-circle-xmark mt-3" style="font-size:25px;color:#FF0000;"></i>' }</td>
													<td class="text-center">${ product.bestSaler ? '<i class="fa-regular fa-circle-check mt-3" style="font-size:25px;color:#008000;"></i>' : '<i class="fa-regular fa-circle-xmark mt-3" style="font-size:25px;color:#FF0000;"></i>' }</td>
													<td>${ product.category.name }</td>
													<td><a id="editProduct" href="${ updateProduct }"
														type="button" class="btn btn-warning mr-2"><i
															class="fa-solid fa-pen-to-square"></i></a> <a
														id="deleteCaterory" href="${ deleteProduct }"
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
		src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/js/OverlayScrollbars.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
	<script type="text/javascript">
		$("#product-price").ionRangeSlider({
			type : "int",
			min : 0,
			max : 10000,
			step : 10,
			grid : true,
			skin : "round",
			postfix : " 000Vnd"
		});
		$("#product-stock").ionRangeSlider({
			type : "int",
			min : 0,
			max : 100,
			step : 1,
			skin : "round",
			grid : true,
		});
		/* 		$(".irs").css("margin-top", "-14px"); */
	</script>
</body>
</html>