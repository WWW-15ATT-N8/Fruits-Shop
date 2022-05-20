<%@page import="nhom08.service.CartService"%>
<%@page import="nhom08.entity.*"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark sticky-top">
	<div class="container-fluid">
		<button class="navbar-toggler d-xl-none" type="button"
			data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="true"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
			class="img-logo" src="${pageContext.request.contextPath}/resources/img/Logo_01.png" alt="Logo"></a>
		<ul class="navbar-nav  mt-2 mt-lg-0 icon-user-phone">
			<li class="nav-item">
			<a  class="nav-link bi bi-cart btn-person" id="icon-cart" 
			href="${pageContext.request.contextPath}/user/cart"></a>
				<!-- <button class="nav-link bi bi-cart btn-person" id="icon-cart"
					onclick="go()"></button> -->
			</li>
			<li class="nav-item">
				<button type="button" class="nav-link bi bi-person btn-person"
					data-toggle="modal" data-target="#ModalLogin">
					</a>
			</li>
		</ul>

		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav  mt-2 mt-lg-0 nav-phone">
				<li class="nav-item">
					<form class="form-inline my-2 my-lg-0" id="form-search2">
						<input class="form-control mr-sm-2" id="input-search2" type="text"
							placeholder="VD: Trái cây nhập khẩu"> <span
							class="nav-link bi bi-search" id="search2"></span>
					</form>
				</li>
			</ul>
			<ul class="navbar-nav mr-auto ml-auto mt-2 mt-lg-0 navcenter">
				<li class="nav-item"><a class="nav-link" id="navbar-btn-home"
					href="${pageContext.request.contextPath}/">Trang Chủ</a></li>
				<li class="nav-item "><a class="nav-link" id="navbar-btn-traicaynhapkhau"
					href="${pageContext.request.contextPath}/category/id=4">Trái cây nhập khẩu</a></li>
				<li class="nav-item dropdown" id="navbar-btn-quatang"><a
					class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/product/list/page=1"
					id="dropdownId" aria-haspopup="true" aria-expanded="false">Danh mục sản phẩm</a>
					<div class="dropdown-menu" aria-labelledby="dropdownId">
						<%-- <%
							List<Category> categories = (List<Category>)session.getAttribute("category");
							for(Category c : categories){
								if(c.getCategoryID()!=4)
									out.println("<a class=\"dropdown-item\" href=\"/fruits-shop/category/id="+c.getCategoryID()+"\">"+ c.getName() +"</a>");
							}
						%> --%>
					</div></li>
				
				<li class="nav-item "><a class="nav-link" id="navbar-btn-dichvu"
					href="${pageContext.request.contextPath}/dichvu">Giới thiệu</a></li>
				<%-- <li class="nav-item"><a class="nav-link" id="navbar-btn-gioithieu"
				href="${pageContext.request.contextPath}/vevinfruits">Về
						VinFruits</a></li> --%>
			</ul>
			<ul class="navbar-nav  mt-2 mt-lg-0 nav-pc">
				<li class="nav-item input-search">
					<form class="form-inline my-2 my-lg-0" id="form-search">
						<input class="form-control mr-sm-2" id="input-search" type="text"
							placeholder="VD: Trái cây nhập khẩu"> 
						<span class="nav-link bi bi-search" id="search"></span>
					</form>
					<!-- <span class="nav-link bi bi-search" id="search"></span> -->
				</li>
				<security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER')">
	            	<li class="nav-item" >
					<a class="nav-link bi bi-cart btn-person-cart-pc" id="icon-cart-pc" href="${pageContext.request.contextPath}/user/cart">
						<% 
							if(session.getAttribute("USER") != null){
								double total = (double)session.getAttribute("total");
								DecimalFormat f = new DecimalFormat("###,###,### ");
								String tmp = f.format(total);
								if(total>0)
									out.println(tmp + "₫");
							}
						%>
					</a>
					</li>
	            </security:authorize>
				
				<security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER')">
					<li class="nav-item dropdown">
						<button type="button" class="nav-link dropdown-toggle bi bi-person btn-person-pc"  id="btnLogin" aria-haspopup="true" aria-expanded="false"></button>
		      				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownId">
		        				<security:authorize access="hasAnyRole('ADMIN')">
								<a class="dropdown-item" href="/fruits-shop/admin/dashboard">Trang quản trị</a>
		                    	</security:authorize>
		       				<a class="dropdown-item" href="/fruits-shop/user/thong-tin-ca-nhan">Thông tin cá nhân</a>
		       				<a class="dropdown-item" href="/fruits-shop/user/order/list">Đơn hàng</a>
		       				<a class="dropdown-item" href="/fruits-shop/user/doi-mat-khau">Đổi mật khẩu</a>
		       				<a class="dropdown-item" href="/fruits-shop/logout">Đăng xuất</a>
		      				</div>            
		            </li>
	            </security:authorize>
	            <security:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_CUSTOMER')">
					<li class="nav-item" style="margin: 0 10px;">
						<a class="btn btn-info" href="/fruits-shop/registration">Đăng kí</a>
					</li>
	            	<li class="nav-item">
						<a class="btn btn-success" href="/fruits-shop/login">Đăng nhập</a>
					</li>
	             </security:authorize>
			</ul>

		</div>
	</div>
</nav>