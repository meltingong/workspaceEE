<%@page import="product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductService productService = new ProductService();
	String sort_option = request.getParameter("sort_option");
	
	if(sort_option.equals("sort_asc")){
		productService.categorySortAsc(1);
	}else if(sort_option.equals("sort_desc")){
		productService.categorySortDesc(1);
	}else{
		
	}
	
	
%>