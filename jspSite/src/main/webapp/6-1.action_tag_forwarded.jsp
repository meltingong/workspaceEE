<%@page import="com.itwill.student.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("6-1.action_forwarded.jsp");
	String id = (String)request.getAttribute("id");
	String name = (String)request.getAttribute("name");
	int age = (Integer)request.getAttribute("age");
	Student student =(Student)request.getAttribute("student");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>6-1.action_forwarded.jsp</h1>
<hr>
<p>
	나는 6-1.action_forward.jsp에서 forwading
	당한 jsp입니다..
	제가 응답합니다.
</p>
<p>
	6-1.action_forward.jsp에서 넣어준 속성데이터<br>
	<%=id %><br>
	<%=name %><br>
	<%=age %><br>
	<%=student %><br>
</p>
</body>
</html>
