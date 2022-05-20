
<%@page import="nhom08.entity.Category"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
	<title>Sản Phẩm - Vinfruts</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/DanhSachSanPham.css" type="text/css">
	<!--  <script src="../js/data.js"></script>
	        <script src="../js/functionsHandle.js"></script>
	        <script src="../js/regex.js"></script>
	        <script src="../js/search.js"></script>  -->

</head>
<body>
	<div class="wrapper">

		<jsp:include page="Navbar.jsp"></jsp:include>



		<%
			
			Category category = (Category)request.getAttribute("category"); 
			int pageID = (int)request.getAttribute("page");
			int sl_product = (int)request.getAttribute("size_product");
			
		%>
		<div class="container-fluid" id="danhsachsanpham">
		
		
			<div class="row" id= "title-ds">
				<div class="col-6" id="path-ds">
					<font color="black">
						<a href="${pageContext.request.contextPath}" style="color: black;">TRANG CHỦ</a> /
						<%if (category == null){
							out.print("<a style=\"color: black;\" href=\"/fruits-shop/product/list/page=1\"> DANH SÁCH SẢN PHẨM ");
						} else {
							out.print("<a style=\"color: black;\" href=\"/fruits-shop/category/id="+category.getCategoryID() +"\">" +category.getName());
						}%>
						 </a> / PAGE ${page}
					</font>
				</div>
				  <div class="col-3" id="sl-ds">Hiển thị <%= (pageID-1)*8 + 1%>-<%= pageID*8%> của <%= sl_product%> kết quả</div>
				  <div class="col-3" id="filter-ds">
					  	<select class="orderby" aria-label="Đơn hàng của cửa hàng" id="filter" onchange="tai_lai_trang()"> 
					  		<option value="1" <% 
					  				if(session.getAttribute("orderby") == null)
					  					out.print("selected='selected'");
					  				else if((int)session.getAttribute("orderby") == 1)
					  					out.print("selected='selected'");
					  					
					  		%>  >Tất cả</option>
					  		<option value="2"<% 
					  				if(session.getAttribute("orderby") != null)
					  					 if((int)session.getAttribute("orderby") == 2)
					  						out.print("selected='selected'");	
					  		%> >Thứ tự theo giá: thấp đến cao</option>
					  		<option value="3" <% 
					  				if(session.getAttribute("orderby") != null)
					  					 if((int)session.getAttribute("orderby") == 3)
					  						out.print("selected='selected'");	
					  		%> >Thứ tự theo giá: cao xuống thấp</option>
						</select>
				  </div>
			</div>
		
		
			<div class="row" id="row-man">
				<c:forEach items="${products}" var="product">
					<div class=" col-6 col-md-3 picture" id="${product.productID}" >
			            <a href="${pageContext.request.contextPath}/product/id=${product.productID}"><img src="${pageContext.request.contextPath}/resources/img/product_picture/img_${product.productID}_1.jpg" alt="Picture"></a>
			            <a href="${pageContext.request.contextPath}/product/id=${product.productID}"><p class="name-watch">${product.name}</p></a>
			            <p class="price"><fmt:formatNumber value = "${product.price}" type = "number" maxFractionDigits = "0"/> ₫</p>
		        	</div>
				</c:forEach>
			</div>
			
			<div class="row">
				<div class="pagination">
					<a href="<% 
								int tmp = (int)request.getAttribute("page");
								if(tmp > 1) {
									if(category == null){	
										out.println("/fruits-shop/product/list/page="+ (pageID-1));
									}else{
										out.println("/fruits-shop/category/id=" + category.getCategoryID() + "/page="+ (pageID-1));
									}
								}
								else out.println("");%> ">«</a>
					<%
						int size = (int)request.getAttribute("size_product");
						int pagenum = (size+7)/8;
						for(int i = 1 ; i <= pagenum ; i++){
							if(i == pageID){
								if(category == null){
									out.println("<a href=\"/fruits-shop/product/list/page="+ i +"\" class= \"active\">"+ i +"</a>");
								}else{
									out.println("<a href=\"/fruits-shop/category/id=" + category.getCategoryID()+ "/page="+ i +"\" class= \"active\">"+ i +"</a>");
								}
							}
							else{
								if(category == null){			
									out.println("<a href=\"/fruits-shop/product/list/page="+ i +"\" >"+ i +"</a>");								
								}else{
									out.println("<a href=\"/fruits-shop/category/id=" + category.getCategoryID() + "/page="+ i +"\" >"+ i +"</a>");
								}
							}
						}
							
					%>
					
					<a href="<% 
								int tmp2 = ((int)request.getAttribute("size_product")+7) /8;
								if(pageID< tmp2) {
									if(category == null){	
										out.println("/fruits-shop/product/list/page="+ (pageID+1));
									}else{
										out.println("/fruits-shop/category/id=" + category.getCategoryID() + "/page="+ (pageID+1));
									}
								}
								else 
									out.println("");%> ">»</a>
			 	</div>
			</div>
			
			
		</div>

		<jsp:include page="Footer.jsp"></jsp:include>
			
	</div>
	<script type="text/javascript">
    function tai_lai_trang(){
    	var x = document.getElementById("filter").value;
    	window.location=<%
    			if(category == null)
    				out.print("\"http://localhost:8080/fruits-shop/product/list/page=1?orderby=\"");
    			else
    				out.print("\"http://localhost:8080/fruits-shop/category/id=" + category.getCategoryID() + "/page=1?orderby=\"");
    			%> + x;
    }
    </script>
</body>
</html>