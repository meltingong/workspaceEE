<%@page import="product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductService productService = new ProductService();
	String sort_option = request.getParameter("sort_option");
	
	if(sort_option.equals("sort_asc")){
		System.out.println(productService.priceSortAsc());
	}else if(sort_option.equals("sort_desc")){
		System.out.println(productService.priceSortDesc());
	}else{
		
	}
	
	
%>