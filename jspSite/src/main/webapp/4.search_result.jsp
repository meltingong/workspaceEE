<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String searchkeyword = request.getParameter("searchkeyword");
	if(searchkeyword == null || searchkeyword.equals("")){
		response.sendRedirect("4.search_form.jsp");
		return;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=searchkeyword %>검색결과</h1><hr>
	<ol>
		<%for(int i=0;i<10;i++){ %>
		<li><%=searchkeyword%>검색데이타[<%=(i+1)%>]</li>
		<%}%>
	</ol>
	<a href='4.search_form.jsp'>다시검색</a>
</body>
</html>











