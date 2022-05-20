<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lưu loại sản phẩm</title>
<style type="text/css">
	.error {
		color: red !important;
	}
</style>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/css/OverlayScrollbars.min.css">
</head>
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
								<jsp:param name="name" value="Lưu loại sản phẩm" />
							</jsp:include>
						</div>
						<div class="col-sm-6">
							<jsp:include page="partial/breadcrumb.jsp">
								<jsp:param name="item_sub" value="Loại sản phẩm" />
								<jsp:param
									value="${pageContext.request.contextPath}/admin/category/list"
									name="item_sub_src" />
								<jsp:param name="item_main" value="Lưu loại sản phẩm" />
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
								<div class="card-header bg-info">
									<div class="card-title">Create Category</div>
								</div>
								<c:url var="saveUrl"
									value="${pageContext.request.contextPath}/admin/category/save" />

								<form:form modelAttribute="category" method="POST"
									action="${pageContext.request.contextPath}/admin/category/save">
									<div class="card-body">
										<form:hidden path="categoryID" />
										<div class="form-group">
											<label>Tên loại sản phẩm</label>
											<form:input path="name" class="form-control"
												placeholder="Nhập tên loại sản phẩm" />
											<br>
											<form:errors cssClass="error" class="form-text note"
												path="name" />
										</div>
										<div class="form-group">
											<label for="category_description">Mô tả loại sản phẩm</label>
											<form:textarea path="description" class="form-control"
												rows="3" placeholder="Nhập mô tả loại sản phẩm" />
											<form:errors cssClass="error" class="form-text note"
												path="description" />

										</div>
									</div>
									<div class="card-footer">
										<form:button class="btn btn-primary float-right">Save</form:button>
									</div>

								</form:form>
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
		src="https://cdnjs.cloudflare.com/ajax/libs/overlayscrollbars/1.13.1/js/OverlayScrollbars.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
</body>
</html>