<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@include file = "user_login_check.jspf" %>
<%
	session.invalidate();
	response.sendRedirect("user_main.jsp");
%>