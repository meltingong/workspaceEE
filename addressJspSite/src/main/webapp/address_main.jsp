<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>주소록관리메인</h1><hr/>
<p>접속IP:<%=request.getRemoteAddr()%></p>
<ul>
	<li><a href='address_list.jsp'>주소록리스트</a></li>
	<li><a href='address_insert_form.jsp'>주소록쓰기폼</a></li>
</ul>
</body>
</html>
