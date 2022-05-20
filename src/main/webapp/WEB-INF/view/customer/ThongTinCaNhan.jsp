<%@page import="nhom08.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="nhom08.entity.Cart"%>
<%@page import="nhom08.entity.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Thông tin cá nhân - Vinfruts</title>
		<meta name=”viewport” content=” width=device-width, initial-scale=1″>
		<meta charset="utf-8" />
		<!-- <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" /> -->
		<!-- <script src="../bootstrap/jquery/jquery-3.6.0.min.js"></script>
		<script src="../bootstrap/js/bootstrap.min.js"></script> -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Home.css" type="text/css">
		<!--  <script src="../js/data.js"></script>
		        <script src="../js/functionsHandle.js"></script>
		        <script src="../js/regex.js"></script>
		        <script src="../js/search.js"></script>  -->	
 <style type="text/css">
#thongtincanhan{
	min-height: 400px;
}
#thongtincanhan .row{
		background-color: #fafafa;
		border: 3px solid #e5e8eb;
	    border-radius: 10px;
	    padding: 2%;
	    max-width: 700px;
}
#navbar-btn-home{
    color: white !important;
}
.error{
color: red !important;
}
 
 </style>
	</head>
	<body>
		<div class="wrapper">
	
	<%User u = (User)session.getAttribute("USER") ;%>
			<jsp:include page="Navbar.jsp"></jsp:include>
	
			<div class="container-fluid" id="thongtincanhan">
					<div class="row">
						<div class="col-12">	
							<center><h3>Thông tin cá nhân</h3></center>
						</div>
						<c:if test="${saveOrderError != null}">
							<div class="col-12">
								<div class="alert alert-danger col-xs-offset-1 col-xs-10" style="text-align: center;">
									${saveOrderError}
								</div>
							</div>
						</c:if>
						<c:if test="${updateMessage != null}">
							<div class="col-12">
								<div class="alert alert-success col-xs-offset-1 col-xs-10" style="text-align: center;">
									${updateMessage}
								</div>
							</div>
						</c:if>
						<form:form action="${pageContext.request.contextPath}/user/thong-tin-ca-nhan/update" style="margin: auto;width: 80%;"
								method="post" modelAttribute="UserUpdate">
							   <form:input type="hidden"  value="<%= u.getUserID()%>"  path="userID"/>
							   <form:input type="hidden"  value="<%= u.getPhone()%>" path="phone"/>
							   <div class="form-group">
							    <label for="exampleInputEmail1">Họ và tên:</label>
							    <form:input type="text" class="form-control" placeholder="nhập họ và tên" path="fullName" />
							    <br><form:errors  cssClass="error" class="form-text text-muted" path="fullName" />
							  </div>
							  <div class="form-group">
							    <label for="exampleInputEmail1">Số điện thoại:</label>
							    <input type="text" class="form-control"  disabled id="info-phone" value="<%= u.getPhone()%>">
							    <br>
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputEmail1">Địa chỉ email:</label>
							    <form:input type="email" class="form-control" placeholder="nhập dịa chỉ email"  path="email"/>
							    <br><form:errors  cssClass="error" class="form-text text-muted" path="email" />
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputEmail1">Địa chỉ:</label>
							    <form:input type="text" class="form-control" placeholder="nhập địa chỉ"  path="address"/>
							    <br><form:errors  cssClass="error" class="form-text text-muted" path="address" />
							  </div>
							  
							   <div class="form-group">
							    <input type="submit" class="form-control btn btn-primary" value="Lưu thông tin">
							  </div>
							  
						</form:form>
					</div>
			</div>
	
			<jsp:include page="Footer.jsp"></jsp:include>
	
		</div>
	</body>
</html>