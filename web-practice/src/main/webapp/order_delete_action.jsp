<%@page import="com.itwill.shop.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>   
<%
	/*
		1. 주문번호 받기
		2. 주문삭제
		 - 주문상세 테이블 delete
		 - 주문테이블 delete
	 */

	 if(request.getMethod().equalsIgnoreCase("GET")){
		 response.sendRedirect("order_list.jsp");
		 return;
	 }
	String o_noStr = request.getParameter("o_no");
	OrderService orderService = new OrderService();
	orderService.deleteByOrderNo(Integer.parseInt(o_noStr));
	response.sendRedirect("order_list.jsp");






%>	
          