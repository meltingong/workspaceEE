<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
<%
	
	if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("order_create_form.jsp");
	return;
	}
	
	String address = request.getParameter("address");
	
	UserService userService = new UserService();
	userService.updateAddress(address, sUserId);
	response.sendRedirect("order_create_form.jsp");




%>
