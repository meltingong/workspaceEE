<%@page import="com.itwill.bean.Student"%>
<%@page import="com.itwill.bean.Car"%>
<%@page import="com.itwill.bean.User"%>
<%@page import="com.itwill.bean.Guest"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Car c=new Car(1,"TESLAR","RED");
	Student s=new Student(100,"백학생",new Car(2,"AVANTE","WHITE"));
	
	request.setAttribute("car", c);
	request.setAttribute("student", s);
	
	Date d=new Date();
	request.setAttribute("today", d);
	

%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>EL 자바 Bean객체의 property(멤버변수)출력</h1><hr/>
<ul>
	<li>${car}</li>
	<li>${car.no}</li>
	<li>${car.model}</li>
	<li>${car.color}</li>
	<li>${student}</li>
	<li>${student.no}</li>
	<li>${student.name}</li>
	<li>${student.car}</li>
	<li>${student.car.no}</li>
	<li>${student.car.model}</li>
	<li>${student.car.color}</li>
	<li>${today}</li>
	<li>${today.getYear()+1900}</li>
	<li>${today.year+1900} 년</li>
	<li>${today.month+1} 월</li>
	
</ul>












</body>
</html>