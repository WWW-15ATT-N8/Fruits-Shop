<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="nhom08.entity.Cart"%>
<%@page import="nhom08.entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Giỏ Hàng - Vinfruts</title>
<meta name=”viewport” content=” width=device-width, initial-scale=1″>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/GioHang.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/Navbar.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/Footer.css"
	type="text/css">
<!--  <script src="../js/data.js"></script>
        <script src="../js/functionsHandle.js"></script>
        <script src="../js/regex.js"></script>
        <script src="../js/search.js"></script> -->

</head>
<body>
	<div class="wrapper">

		<jsp:include page="./Navbar.jsp"></jsp:include>
		
		<%
			DecimalFormat format = new DecimalFormat("###,###,###");
			List<Cart> carts = (List<Cart>)request.getAttribute("carts");	
			long total= 0;
		%>

		<div class="container-fluid">
			<div class="giohang">
				<div class="giohang-left">
				<c:url var="updateCart" value="/user/cart/updatecart"></c:url>
					<form id="form-gh" action="${updateCart}" method="post">
						<table>
							<thead>
							<%
								if(carts != null )
									if(carts.size() > 0)
										out.println("<tr><th colspan=\"2\">Sản Phẩm</th><th class=\"gh-price\">Giá</th><th class=\"amount\">Số lượng</th><th class=\"totalprice\">Tổng cộng</th></tr>");
							%>
							
							</thead>

							<tbody id="giohang-chitiet">
								<%int cnt = 0;%>
								<c:forEach items="${carts}" var="cart" >
									<%
										Cart c = carts.get(cnt);
										Product p = c.getProduct();
										total += p.getPrice() * c.getAmount();
									%>
									<tr>
			                            <td id='gh-pic' class="gh-tt"><img src="${pageContext.request.contextPath}/resources/img/product_picture/img_<%=  p.getProductID()%>_1.jpg" alt="alt"></td> 
			                            <td id='gh-name'>
			                                <a href="${pageContext.request.contextPath}/product/id=<%= p.getProductID()%>">
			                                    <p class="gh-name-watch"><%= p.getName()%></p>
			                                </a>
			                            </td>
			                            <td class="gh-tt gh-price" id = "price<%=  p.getProductID()%>"><b><fmt:formatNumber value = "<%=  p.getPrice()%>" type = "number" maxFractionDigits = "0"/> ₫</b></td>
			                            <td class="gh-tt amount" id = "gh-soluong">
			                                <input type="button" value="-" id="down" onclick="changeValueGH(-1,<%=  p.getProductID()%>)">
			                                <input type="text" name="amount" value="<%=  c.getAmount()%>" class="soluong" id="soluong-<%=  p.getProductID()%>">
			                                <input type="button" value="+" id="up" onclick="changeValueGH(1,<%=  p.getProductID()%>)">
			                            </td>
			                            <td class="gh-tt totalprice" id = "totalprice<%=  p.getProductID()%>"><b><fmt:formatNumber value = "<%=  p.getPrice()*c.getAmount()%>" type = "number" maxFractionDigits = "0"/> ₫</b></td>
			                        </tr>
			                        <% cnt++; %>
								</c:forEach>
							</tbody>
						</table>
						<%
							if(carts != null )
								if(carts.size() > 0)
									out.println("<input type=\"submit\" value=\"Cập nhật giỏ hàng\" class=\"capnhat\" id=\"capnhatgh\">");
						%>
					</form>		
					<%
						if(carts == null) 
							out.println("<p id=\"thongbao-giohang\">Bạn không có sản phẩm nào trong giỏ</p>"+
										"<button onclick=\"changeURL()\" class=\"capnhat\" id=\"quaylaiFalse\">Quay Lại cửa hàng</button>");
						else if(carts.size() <= 0) 
							out.println("<p id=\"thongbao-giohang\">Bạn không có sản phẩm nào trong giỏ</p>"+
										"<button onclick=\"changeURL()\" class=\"capnhat\" id=\"quaylaiFalse\">Quay Lại cửa hàng</button>");
					%>
				</div>
				<div class="giohang-right">
					<table>
						<thead>
							<tr>
								<th colspan="2">Thanh Toán</th>
							</tr>
						</thead>
						<tbody id="pay">
							<tr>
								<td>Tổng cộng</td>
								<td id="total"><b><%= format.format(total)%> ₫</b></td>
							</tr>
							<tr>
								<td>Phí vận chuyển</td>
								<td id="feeship"><b><%
														if(carts == null)
															out.println("0 ₫");
														else if(carts.size() <= 0)
															out.println("0 ₫");
														else
															out.println("Giao hàng miễn phí");
													%></b></td>
							</tr>
							<tr>
								<td>Thuế VAT (8%)</td>
								<td id="fee-VAT"><b><%= format.format(0.08*total)%> ₫</b></td>
							</tr>
							<tr>
								<td>Các loại phí khác</td>
								<td id="otherfees"><b>0 ₫</b></td>
							</tr>
							<tr id="total">
								<td>Tổng tiền thanh toán</td>
								<td id="totalpay"><b><%= format.format(1.08*total)%> ₫</b></td>
							</tr>
						</tbody>
					</table>
					<%
						if(carts == null || carts.size() <=0)
							out.println("<button class=\"thanhtoan\" id=\"btnthanhtoan-disabled\"\"disabled>Tiến hành thanh toán</button>");
						else 
							out.println("<a href=\"/fruits-shop/user/order\"><button class=\"thanhtoan\" id=\"btnthanhtoan\" >Tiến hành thanh toán</button></a>");
					%>
					
				</div>
			</div>
		</div>

		<jsp:include page="./Footer.jsp"></jsp:include>

	</div>

		<script>
            var gh ;
            var str ="";
            var pay = 0 ;
            var vat = 0;
            function  changeURL() {
            	
            	window.location.href = 'http://localhost:8080/fruits-shop/';
				
			}
            function changeValueGH(x,id){
                var id = 'soluong-' + String(id);
                var n = document.getElementById(id).value;
                if(!(parseInt(n)<=1 && x==-1))
                    document.getElementById(id).value = parseInt(n) + x ;
                else{
                    document.getElementById(id).value = 0 ;
                }
            }
        </script>
</body>
</html>