<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	/*
 	1.Locale객체얻기,생성
 	2.ResourceBundle 의 properties파일지정
 	*/
 %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL I18N[Internationalization] 국제화</h1><hr>
<a href="9.jstl_fmt_i18n.jsp?lang=en">영어</a>
<a href="9.jstl_fmt_i18n.jsp?lang=ja">일어</a>
<a href="9.jstl_fmt_i18n.jsp?lang=zh">중국어</a>
<a href="9.jstl_fmt_i18n.jsp?lang=ko">한국어</a>
<ol>
	
</ol>
</body>
</html>