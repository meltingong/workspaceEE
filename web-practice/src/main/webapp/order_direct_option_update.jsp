<%@page import="javax.websocket.SendResult"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String p_option = request.getParameter("p_option");
	String p_noStr = request.getParameter("p_no");
	ProductService productService = new ProductService();
	productService.updateOption(Integer.parseInt(p_noStr), p_option);
	//pageContext.forward("product_detail.jsp?p_no="+p_noStr);
	response.sendRedirect("product_detail.jsp?p_no="+p_noStr);

%>
