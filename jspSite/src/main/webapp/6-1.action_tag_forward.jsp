<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("6-1.action_forward.jsp");

	/*
	forwarding
		- 6-1.action_tage_forwarded.jsp로 HTTP요청을 보냄
	*/
%>
<jsp:forward page="6-1.action_tag_forwarded.jsp"/>