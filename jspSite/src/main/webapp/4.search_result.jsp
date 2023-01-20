<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>xx 검색결과</h1><hr>
	<ol>
		<%for(int i=0;i<10;i++){ %>
		<li>xx 검색데이타[<%=(i+1)%>]</li>
		<%}%>
	</ol>
	<a href='4.search_form.jsp'>다시검색</a>
</body>
</html>











