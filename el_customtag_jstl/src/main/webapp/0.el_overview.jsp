<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bean.User"%>
<%@page import="com.itwill.bean.Guest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/***********String,Wrapper속성객체******************/
	/***********자바빈 속성객체******************/
	/********List(array)속성객체*****************/
	/********Map 속성객체*****************/
	/*************JSP local변수******************/
	/*
	속성(attribute)객체
		- 속성객체이름: a,b,c,d,e,f,guest,user,guestList,guestMap
	*/

%>    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>EL(Expression Language)</h1><hr>
<ul>
	<li>#########NO EL(EL을 사용하지않았을때)##########</li>
	<li>------------String,Wrapper---------------</li>
	<li></li>
	<li></li>
	<li></li>
	<li></li>
	<li></li>
	<li></li>
	<li>------------java Bean---------------</li>
	
	<li>------------List---------------</li>
	
	<li>------------Map---------------</li>
	
	<li>------------JSP service안에선언된 local변수--------------</li>

	
	<li>######### EL사용 ##########</li>
	<li>------------String,Wrapper---------------</li>
	
	<li>------------java Bean---------------</li>
	
	
	
	<li>------------List---------------</li>
	
	
	<li>------------Map---------------</li>
	
	<li>------------JSP service안에선언된 local변수 EL로는 출력 불가능--------------</li>
	
	
</ul>
</body>
</html>








