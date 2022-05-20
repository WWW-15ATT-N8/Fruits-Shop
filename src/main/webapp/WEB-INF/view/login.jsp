<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<title>Đăng nhập - Vinfruts</title>
	<meta name=”viewport” content=” width=device-width, initial-scale=1″>
	<!-- <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" /> -->
	<!-- <script src="../bootstrap/jquery/jquery-3.6.0.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script> -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Home.css" type="text/css">
	<!--  <script src="../js/data.js"></script>
	        <script src="../js/functionsHandle.js"></script>
	        <script src="../js/regex.js"></script>
	        <script src="../js/search.js"></script>  -->
<style type="text/css">
#form-login{
			min-height: 350px;
}
</style>
</head>
<body>
	<div class="wrapper">

		<jsp:include page="customer/Navbar.jsp"></jsp:include>


		<div class="container-fluid" id="form-login">
			<div class="row" id="form-body">
				<form  method="POST" action="${pageContext.request.contextPath}/authenticateLogin"
				style="background: whitesmoke;border-radius: 30px;padding: 10px 40px;margin: auto;">
					<center><h3>Đăng nhập</h3></center>
					<div class="row">
                        <div class="col-12">
                            <label>Số điện thoại: </label><br/>
                            <input name="username" class="tt-name" type="text" placeholder="0xxx-xxx-xxx" >
                            <%-- <br><form:errors path="phone"/> --%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Mật khẩu: </label><br/>
                            <input type="password" name="password" class="tt-name"   placeholder="nhập mật khẩu" >
                            <%-- <br><form:errors path="password"/> --%>
                        </div>
                    </div>
                    <c:if test="${param.error != null}">
						<div class="alert alert-danger col-xs-offset-1 col-xs-10">
							Sai tài khoản hoặc mật khẩu.</div>
					</c:if>

					<!-- Check for logout -->

					<c:if test="${param.logout != null}">

						<div class="alert alert-success col-xs-offset-1 col-xs-10">Đã
							đăng xuất.</div>

					</c:if>
                     <div class="row">
                        <div class="col-4">
                            <input type="submit" value="Đăng nhập" id="login">
                        </div>
                    </div>
                   <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
		</div>

		<jsp:include page="customer/Footer.jsp"></jsp:include>

	</div>
</body>
</html>