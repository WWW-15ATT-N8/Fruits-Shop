<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<jsp:include page="partial/header.jsp">
								<jsp:param name="name" value="Create Category" />
							</jsp:include>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<jsp:include page="partial/breadcrumb.jsp">
								<jsp:param name="item_sub" value="Category" />
								<jsp:param value="${pageContext.request.contextPath}/admin/category/list" name="item_sub_src"/>
								<jsp:param name="item_main" value="Create" />
							</jsp:include>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>

			<div class="content">
				<div class="content-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header bg-info">
									<div class="card-title">Create Category</div>
								</div>
								<c:url var="saveUrl" value="${pageContext.request.contextPath}/admin/category/save" />
								
								<form:form modelAttribute="category" method="POST" action="${pageContext.request.contextPath}/admin/category/save">
									<div class="card-body">
										<form:hidden path="categoryID" />
										<div class="form-group">
											<label>Name</label> 
											<form:input path="name" class="form-control" placeholder="Enter name category"/>
										</div>
										<div class="form-group">
											<label for="category_description">Description</label>
											<form:textarea path="description" class="form-control" rows="3"
												placeholder="Enter description category"/>
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