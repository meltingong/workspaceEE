<%@page import="product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductService productService = new ProductService();
	String select = request.getParameter("select");
	String sort_asc = request.getParameter("sort_asc");
	String sort_desc = request.getParameter("sort_desc");
	
	if(select.equals("가격 오름차순")){
		productService.categorySortAsc(1);
	}

%>