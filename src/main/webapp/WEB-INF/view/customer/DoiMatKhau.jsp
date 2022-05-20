<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<title>Đổi mật khẩu - Vinfruts</title>
	<meta name=”viewport” content=” width=device-width, initial-scale=1″>
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
#navbar-btn-home{
    color: white !important;
}
#form-login{
			min-height: 350px;
}
</style>
</head>
<body>
	<div class="wrapper">

		<jsp:include page="Navbar.jsp"></jsp:include>


		<div class="container-fluid" id="form-login">
			<div class="row" id="form-body">
				<form  method="POST" action="${pageContext.request.contextPath}/user/doi-mat-khau/save?${_csrf.parameterName}=${_csrf.token}"
				style="background: whitesmoke;border-radius: 30px;padding: 10px 40px;margin: auto; min-width: 500px;">
				<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
					<center><h3>Đổi mật khẩu</h3></center>
					<c:if test="${changpasswordSuccess != null}">
						<div class="alert alert-success col-xs-offset-1 col-xs-10" style="text-align: center;">${changpasswordSuccess}</div>
					</c:if>
					 <div class="row">
                        <div class="col-12">
                            <label>Mật khẩu cũ: </label><br/>
                            <input type="password" name="oldpassword" class="tt-name"   placeholder="nhập mật khẩu cũ" >
                            <%-- <br><form:errors path="password"/> --%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Mật khẩu mới: </label><br/>
                            <input type="password" name="newpassword" class="tt-name"   placeholder="nhập mật khẩu mới" >
                            <%-- <br><form:errors path="password"/> --%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Nhập lại mật khẩu: </label><br/>
                            <input type="password" name="confirmpassword" class="tt-name"   placeholder="xác nhận mật khẩu" >
                            <%-- <br><form:errors path="password"/> --%>
                        </div>
                    </div>
					<c:if test="${changpasswordError != null}">
						<div class="alert alert-danger col-xs-offset-1 col-xs-10"  style="text-align: center;">${changpasswordError}</div>
					</c:if>
                     <div class="row">
                        <div class="col-4">
                            <input type="submit" value="Đổi mật khẩu" id="login">
                        </div>
                    </div>
                   <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
		</div>

		<jsp:include page="Footer.jsp"></jsp:include>

	</div>
</body>
</html>