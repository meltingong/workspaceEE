<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.bean.User"%>
<%@page import="com.itwill.util.NumberFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String title="오늘은 목요일 날씨가 맑아요 기분이 상쾌하네요!";
	request.setAttribute("title", title);
	request.setAttribute("name","JAMES");
	request.setAttribute("price",1234567);
	request.setAttribute("weight","74.5684");
	request.setAttribute("user", new User("guard","1111","김가드","guard@gmail.com"));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL function[ EL안에서 사용가능한 ]</h1><hr>
<ul>
	<li>--JSTL에서제공하는 EL내에서사용가능한function(ㅠㅠㅠㅠ)---</li>
	<li>-- 표준 EL 안에서는  EL객체(속성객체)의 메쏘드호출이가능 --</li>
	<li>-- 표준 EL안에서는  static method호출 가능(객체생성없이호출가능한메쏘드)  --</li>
	<li>-- 표준 EL안에서는  객체생성불가능(생성자호출불가능) --</li>
</ul>
</body>
</html>







