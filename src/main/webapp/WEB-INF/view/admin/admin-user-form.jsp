
<%@page import="java.util.List"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Insert title here</title>
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
<body>
<% request.setCharacterEncoding("UTF-8"); 
 response.setCharacterEncoding("UTF-8");%>
<div class="wrapper">

		<jsp:include page="partial/navbar.jsp"></jsp:include>
		<jsp:include page="partial/asidebar.jsp"></jsp:include>

		<div class="content-wrapper">
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<jsp:include page="partial/header.jsp">
								<jsp:param name="name" value="Create User" />
							</jsp:include>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<jsp:include page="partial/breadcrumb.jsp">
								<jsp:param name="item_sub" value="User" />
								<jsp:param
									value="${pageContext.request.contextPath}/admin/user/list"
									name="item_sub_src" />
								<jsp:param name="item_main" value="Create" />
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
								<div class="card-header bg-info" aria-expanded="true"
									data-target=".collapse" data-card-widget="collapse"
									style="cursor: pointer;">
									<div class="card-title">Create Product Info</div>
									<div class="card-tools">
										<button data-card-widget="collapse" type="button"
											class="btn btn-tool">
											<i class="fas fa-minus"></i>
										</button>
									</div>
								</div>

									<div class="card-body collapse show">
								<form:form modelAttribute="user" method="POST" action="${pageContext.request.contextPath}/admin/user/save">

									<form:hidden path="userID" />
										<div class="row">
											<div class="col-12">
												<div class="form-group">
													<label>Full Name:</label>
													<form:input path="fullName" name="fullName" value="" class="form-control" placeholder="Full Name"/>
													
													
												</div>
												<div class="form-group">
													<label>Role:</label> 
													<select modelAttribute="roleID" name="roleID" class="form-control" style="width: 100%;">
														<c:forEach items="${roles}" var="role">
															<option value="${ role.roleID }" ${role.roleID == roleID ? 'selected="selected"' : ''} >${ role.title }</option>
														</c:forEach>
													</select>
												</div>
												<div class="form-group">
													<label>Email:</label> 
													<form:input path="email" class="form-control"
														style="width: 100%;" placeholder="Email"/>
												
												</div>
												<div class="form-group">
													<label>Address:</label> 
													<form:input path="address" class="form-control"
														style="width: 100%;" placeholder="Address"/>
												</div>
												<div class="form-group">
													<label>Phone:</label> 
													<form:input path="phone" class="form-control"
														style="width: 100%;" placeholder="Phone"/>
												</div>
												
												<div class="form-group">
													<label>Password:</label> 
													<input name="password" class="form-control"
														style="width: 100%;" placeholder="Password"/>
												</div>
											</div>
										</div>
										
										<form:button class="btn btn-primary float-right">Save</form:button>
									</form:form>
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

</div>

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