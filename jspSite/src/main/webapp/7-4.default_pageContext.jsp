<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>기본객체 pageContext[PageContext]</h1>
<hr/>
<ol>
	<li><%=pageContext%></li>
	<li><%=pageContext.getRequest()%> == <%=request%></li>
	<li><%=pageContext.getResponse()%> == <%=response %></li>
	<li><%=pageContext.getSession()%> == <%=session %></li>
	<li><%=pageContext.getServletContext()%> == <%=application %></li>
	<li><%=pageContext.getServletConfig()%> == <%=config %></li>
</ol>
</body>
</html>
