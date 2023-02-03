<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
/*
        	 주문생성
*/
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("order_list.jsp");
	return;
}

response.sendRedirect("order_list.jsp");
%>