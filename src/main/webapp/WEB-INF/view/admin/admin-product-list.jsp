<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
								<jsp:param name="name" value="Product" />
							</jsp:include>
						</div>
						<div class="col-sm-6">
							<jsp:include page="partial/breadcrumb.jsp">
								<jsp:param name="item_sub" value="Home" />
								<jsp:param name="item_main" value="Product" />
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
										<i class="fa-solid fa-magnifying-glass"></i> Search
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
													<label>Name:</label> <input name="name" value='<%= request.getParameter("name") == null ? "" : request.getParameter("name")%>'
														class="form-control" style="width: 100%;"
														placeholder="Name">
												</div>
												<div class="form-group">
													<label>Price:</label>
													<div>
														<input id="product-price" type="text" name="price"
															class="js-range-slider" value="<%= request.getParameter("price") %>" />
													</div>
			
												</div>
												
												<div class="row">
													<div class="col-6">
														<div class="form-group">
															<label>Is new product:</label> 
															<input type="checkbox" name="newProduct"
															${ newProduct == true ? 'checked' : '' }
																data-toggle="toggle" data-on="Yes" data-off="No"
																data-onstyle="primary"
																data-size="sm">
														</div>
													</div>
													<div class="col-6">
														<div class="form-group">
															<label>Is best Saler:</label> 
															<input type="checkbox" name="bestSaler"
															${ bestSaler == true ? 'checked' : '' }
																data-toggle="toggle" data-on="Yes" data-off="No"
																data-onstyle="primary"
																data-size="sm">
														</div>
													</div>
												</div>
											</div>
											<div class="col-6">
												<div class="form-group">
													<label>Category:</label> 
													<select class="form-control" name="category" style="width: 100%;">
														<c:forEach items="${categories}" var="category">
															<option ${ categoryID == category.categoryID ? 'selected="selected"' : '' } value="${ category.categoryID }">${ category.name }</option>
														</c:forEach>
													</select>
												</div>
												<div class="form-group">
													<label>Stock:</label>
													<div>
														<input id="product-stock" type="text" name="stock"
															class="js-range-slider" value="<%= request.getParameter("stock") %>" />
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card-footer">
										<div class="col-12 text-center">
											<button class="btn btn-primary btn-search"
												style="width: 40%;" type="submit">
												<i class="fa-solid fa-magnifying-glass"></i> Search
											</button>
										</div>
									</div>
								</form>
							</div>

							<div class="card">
								<div class="card-header">
									<div class="card-title">Table</div>
									<div class="card-tools">
										<button class="btn btn-danger mr-2">Delete Selected</button>
										<a class="btn btn-primary"
											href="${pageContext.request.contextPath}/admin/product/create"
											style="color: white;">Add</a>

									</div>
								</div>
								<div class="card-body">
									<div>
										<label>Show <select name="example_length"
											aria-controls="example" class="">
												<option value="10">10</option>
												<option value="25">25</option>
												<option value="50">50</option>
												<option value="100">100</option>
										</select> entries
										</label>
									</div>
									<table class="table table-bordered table-hover data-table-form">
										<thead>
											<tr>
												<th style="width: 70px;" class="text-center"><input
													type="checkbox"></th>
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
													<td class="text-center check-item"><input
														type="checkbox"></td>
													<td>${ product.name }</td>
													<td>${ product.price }</td>
													<td>${ product.stock }</td>
													<td>${ product.newProduct }</td>
													<td>${ product.bestSaler }</td>
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
			skin: "round",
			postfix : " 000Vnd"
		});
		$("#product-stock").ionRangeSlider({
			type : "int",
			min : 0,
			max : 100,
			step : 1,
			skin: "round",
			grid : true,
		});
/* 		$(".irs").css("margin-top", "-14px"); */
	</script>
</body>
</html>