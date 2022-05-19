<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<ol class="breadcrumb float-sm-right">
      <li class="breadcrumb-item"><a href="<c:out value="${param.item_sub_src}"/>"><c:out value="${param.item_sub}"/></a></li>
      <li class="breadcrumb-item active"><c:out value="${param.item_main}"/></li>
    </ol>
</body>
</html>