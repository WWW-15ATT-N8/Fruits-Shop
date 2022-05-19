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
	
	<ul class="pagination float-right">
		
		<%
		int pageLenght = Integer.parseInt(request.getParameter("pageCount"));
		int pageCurrent = Integer.parseInt(request.getParameter("pageCurrent"));
		String url = request.getParameter("url");
		int pageLenghtCustom = pageLenght >= 5 ? 5 : pageLenght;
		int pageStart = pageCurrent > 2 ? pageCurrent - 1 : 1;
		int pageEnd = pageStart == 1 ? pageLenghtCustom : pageCurrent + 3;
		if(pageEnd >= 5) {
			pageEnd = pageCurrent + 1 == pageLenght ? pageEnd - 2 : pageEnd;
			pageEnd = pageCurrent + 2 == pageLenght ? pageEnd - 1 : pageEnd;
		}
		
		for (int i = pageStart; i <= pageEnd; i += 1) {
			boolean isPageCurrent = (i == pageCurrent + 1);
		%>
		<li class='page-item <%= isPageCurrent ? "disabled" : "" %>'><a class="page-link"
			href='<%= url + "page="+i %>'><%= i %></a></li>
		<% } %>
	</ul>
</body>
</html>