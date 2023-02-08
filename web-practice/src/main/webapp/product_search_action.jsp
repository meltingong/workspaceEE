<%@page import="java.util.List"%>
<%@page import="product.Product"%>
<%@page import="product.Category"%>
<%@page import="product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("mainsearchkeyword");
	ProductService productService = new ProductService();
	if(keyword.equals("")){
		productService.searchCategory(keyword);
	}
	
	

%>