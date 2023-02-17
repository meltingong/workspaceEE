<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//session.setAttribute("sUserId", "admin");
	//session.setAttribute("sUserId", "guard");
	session.setAttribute("level", "5"); //레벨은 1~5 사이의 정수
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL core choose tag</h1><hr>

<c:choose>
	<c:when test="${!emptysUserId }">
		<c:choose>
		<c:when test="${sUserId == 'admin' }">
		<a href="">${sUserId }님 로그아웃</a><br>
		<a href="">상품리스트</a><br>
		<a href="">상품등록</a><br>
		</c:when>
		<c:otherwise>
		<a href="">${sUserId }님 로그아웃</a><br>
		<a href="">상품리스트</a><br>
		</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<a href="">로그인</a>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${level == 1 }">
		보초[${level }]<br>
	</c:when>
	<c:when test="${level == 2 }">
		초보[${level }]<br>
	</c:when>
	<c:when test="${level == 3 }">
		중수[${level }]
	</c:when>
	<c:when test="${level > 3 && level <=5 }">
		고수[${level }]
	</c:when>
	<c:otherwise>
		레벨을 1~5사이의 정수입니다.
	</c:otherwise>
</c:choose>
















</body>
</html>