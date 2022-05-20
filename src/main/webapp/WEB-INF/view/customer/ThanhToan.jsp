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
		<title>Thanh Toán - Vinfruts</title>
		<meta name=”viewport” content=” width=device-width, initial-scale=1″>
		<meta charset="utf-8" />
		<!-- <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css" /> -->
		<!-- <script src="../bootstrap/jquery/jquery-3.6.0.min.js"></script>
		<script src="../bootstrap/js/bootstrap.min.js"></script> -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ThanhToan.css" type="text/css">
		<!--  <script src="../js/data.js"></script>
		        <script src="../js/functionsHandle.js"></script>
		        <script src="../js/regex.js"></script>
		        <script src="../js/search.js"></script>  -->	
	</head>
	<body>
		<div class="wrapper">
	
			<jsp:include page="Navbar.jsp"></jsp:include>
	
			<% 
				User USER = (User)session.getAttribute("USER");
				List<Cart> carts = (List<Cart>)request.getAttribute("carts"); 
				int cnt = 0;
				int total = 0;
				for(Cart c : carts)
					total += c.getProduct().getPrice() * c.getAmount();
			 %>
	
			<div class="container-fluid" id="thanhtoan">
				<div class="thanhtoan row">
                    <div class="thanhtoan-left col-md-6">
                    
                    	<c:url var="saveOrder" value="/user/order/saveorder"></c:url>
                    	
                        <form:form class="thanhtoan"  action="${saveOrder}" modelAttribute="Order" method="get" >
                        	<form:input type="hidden" path="total"  value="<%= total%>"/>
                            <p id="tt-tt">Thông tin thanh toán</p>
                           <%--  <div class="row">
                                <div class="col-12">
                                    <label>Họ và tên: </label><br/>
                                    <input name="UName" class="tt-name" type="text" id="thanhtoan-Lname" disabled value="<%= USER.getFullName()%>">
                                    <small id="thanhtoan-Lname-note" class="form-text note"></small>
                                </div>
                            </div> --%>
                          <!--   <div class="row">
                                <div class="col-12">
                                    <label>Thành phố/Tỉnh: </label><br/>
                                    <input  type="text" id="thanhtoan-Tadd" placeholder="Thành Phố Hồ Chí Minh" >
                                    <small id="thanhtoan-Tadd-note" class="form-text note"></small>
                                </div>
                            </div> -->
                            <div class="row">
                                <div class="col-12">
                                    <label>Địa chỉ nhận hàng: </label>
                                    <form:input path="shipAddress"  type="text" id="thanhtoan-add" placeholder="13, Đường Nguyễn Văn Bảo, Quận Gò Vấp" />
                                   	<br><form:errors cssClass="error" class="form-text note" path="shipAddress" />
                                    <!-- <small id="thanhtoan-add-note" class="form-text note"></small> -->
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <label>Số điện thoại nhận hàng: </label><br/>
                                    <form:input path="shipPhone"  type="text" id="thanhtoan-tel" placeholder="0xxx-xxx-xxx" />
                                    <br><form:errors  cssClass="error" class="form-text note" path="shipPhone" />
                                   <!--  <small id="thanhtoan-tel-note" class="form-text note"></small> -->
                                </div>
                            </div>
<!--                             <div class="row">
                                <div class="col-12">
                                    <label>Email: </label><br/>
                                    <input name="UEmail type="text" id="thanhtoan-email" placeholder="example@gmail.com" >
                                    <small id="thanhtoan-email-note" class="form-text note"></small>
                                </div>
                            </div> -->
                            <div class="row">
                                <div class="col-12">
                                    <label>Ghi chú đơn hàng (tùy chọn): </label><br/>
                                    <form:textarea path="comment" id="tt-ghichu" cols="71" rows="6" placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay địa điểm giao hàng chi tiết hơn."/>
                                </div>
                            </div>
                           <div class="row">
                                <div class="col-12">
                                    <label>Hình thức thanh toán: </label> <br/>
                                    <input class="radio" id="tienmat" type="radio"  name="thanhtoan" checked >
                                    <label for="tienmat">Trả Tiền Mặt Khi Nhận Hàng</label><br>
                                    <!-- <input class="radio" id="nganhang" type="radio"  name="thanhtoan" >
                                    <label for="nganhang">Chuyển Khoản Ngân Hàng</label><br>
                                    <input class="radio" id="tragop" type="radio"  name="thanhtoan" >
                                    <label for="tragop">Thanh Toán Trả Góp Bằng Thẻ Tín Dụng</label> -->
                                </div>
                            </div>
                            <div class="row">
                            	<div class="col-12">
                            		<input type="submit" class="dathang" id="dathang" value="Đặt hàng"/>
                            	</div>
                            </div>
                        </form:form>
                    </div>
                    <div class="thanhtoan-right col-md-6">
                        <div id="thanhtoan-center">
                            <table>
                                <thead>
                                    <tr>
                                        <th colspan="3" id="th-tt"><p>Hóa Đơn Của Bạn</p></th>
                                    </tr>
                                </thead>
                                <tbody id="thanhtoan-ct">
                                    <tr id="sp-tt">
                                        <td colspan="2"><p>Sản Phẩm</p></td>
                                        <td></td>
                                        <td class="al-right"><p>Tổng Cộng</p></td>
                                    </tr>
                                        
                                        <c:forEach items="${carts}" var="cart">
                                        	<%
                                        		Cart c = carts.get(cnt);
                                        		Product p =  carts.get(cnt).getProduct();
                                        	%>
                                        	<tr class="thanhtoan-sp">
					                            <td id='tt-name' colspan="2">
					                                <p><%=  p.getName()%></p>
					                            </td>
					                            <td class="" id = "thanhtoan-soluong">
					                                <p>X <%= c.getAmount()%></p>
					                            </td>
					                            <td class="thanhtoan-total al-right" id = "totalprice<%= cnt%>"><b><fmt:formatNumber value = "<%=  p.getPrice()*c.getAmount()%>" type = "number" maxFractionDigits = "0"/> ₫</b></td>
				                            </tr>
				                            <%cnt++; %>
                                        </c:forEach>
									<tr id="subtotal">
				                        <td colspan="2"><p>Tạm tính</p></td>
				                        <td></td>
				                        <td class="al-right"><b><fmt:formatNumber value = "<%=  total%>" type = "number" maxFractionDigits = "0"/> ₫</b></td>
				                    </tr>  
				                    <tr>
				                        <td colspan="2"><p>Thuế VAT (8%)</p></td>
				                        <td></td>
				                        <td class="al-right"><b><fmt:formatNumber value = "<%=  total*0.08%>" type = "number" maxFractionDigits = "0"/> ₫</b></td>
				                    </tr>
				                    <tr>
				                        <td colspan="2"><p>Phí vận chuyển</p></td>
				                        <td></td>
				                        <td class="al-right" id="otherfees">
				                            <b>0 ₫</b>
				                        </td>
				                    </tr> 
				                    <tr>
				                        <td colspan="2"><p>Các loại phí khác</p></td>
				                        <td></td>
				                        <td class="al-right" id="otherfees">
				                            <b>0 ₫</b>
				                        </td>
				                    </tr>
				                    <tr id="total">
				                        <td colspan="2"><p>Tổng tiền thanh toán</p></td>
				                        <td></td>
				                        <td class="al-right"><b><fmt:formatNumber value = "<%=  total*1.08%>" type = "number" maxFractionDigits = "0"/> ₫</b></td>
				                    </tr>
                                </tbody>
                            </table>
                            <small id="thanhtoan-note" class="form-text note"></small>
                            <small class="form-text note"> * Dữ liệu cá nhân của bạn sẽ được sử dụng để xử lý đơn đặt hàng của bạn, hỗ trợ trải nghiệm của bạn trên trang web này và cho các mục đích khác được mô tả trong chính sách riêng tư của chúng tôi.</small>
                        </div>
                    </div>
			</div>
			</div>
	
			<jsp:include page="Footer.jsp"></jsp:include>
	
		</div>
	</body>
</html>