<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Giới Thiệu - Vinfruts</title>
        <meta name=”viewport” content=” width=device-width, initial-scale=1″>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/GioiThieu.css" type="text/css"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Navbar.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer.css" type="text/css">
       <!--  <script src="../js/data.js"></script>
        <script src="../js/functionsHandle.js"></script>
        <script src="../js/regex.js"></script>
        <script src="../js/search.js"></script> -->

    </head>
    <body>
        <div class= "wrapper">

           <jsp:include page="./Navbar.jsp"></jsp:include>
           
           
           <h1>Đây là trang giới thiệu</h1>

            

            <jsp:include page="./Footer.jsp"></jsp:include>
            
        </div>    
    </body>
</html>