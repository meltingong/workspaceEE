<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%

pageContext.setAttribute("url", "page.jsp");
request.setAttribute("url", "request.jsp");
session.setAttribute("url", "session.jsp");
application.setAttribute("url", "application.jsp");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>EL 내장객체(implicit object) 타입은맵이다.</h1><hr>
<ul>
	<li>---pageScope,requestScope,sessionScope,applicationScope---</li>
	<li>${url }</li>
	<li>${pageScope.url }</li>
	<li>${request['url']}</li>
	<li>${sessionScope.url }</li>
	<li>${applicationScope.url }</li>
	
	<li>--------param---------</li>
	<li>${param }</li>
	<li>--------paramValues---------</li>
	<li>${paramValues }</li>
	
	<li>--------cookie---------</li>
	
	<li>--------pageContext[빈객체]---------</li>
	
</ul>	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</ul>
</body>
</html>