<%@page import="com.itwill.student.StudentService"%>
<%@page import="com.itwill.student.StudentDao"%>
<%@page import="com.itwill.student.Student"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList, java.util.List" %>	

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  %>

<%
	Student student=new Student();
	StudentDao studentDao=new StudentDao();
	StudentService studentService=new StudentService();

	ArrayList list=new ArrayList();
	list.add("KIM");
	list.add("JUNG");
	HashMap map=new HashMap();
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>page 지시어 [import]</h1>
<h2>형태:&lt;%@page import="com.itwill.Student"&gt;</h2>
<hr/>
<ul>
	<li><%=list %></li>
	<li><%=map %></li>
	<li><%=student %></li>
	<li><%=studentDao %></li>
	<li><%=studentService %></li>
</ul>
</body>
</html>
