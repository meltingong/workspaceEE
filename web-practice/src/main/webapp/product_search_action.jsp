<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="product.Product"%>
<%@page import="product.Category"%>
<%@page import="product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 	String keyword = request.getParameter("mainsearchkeyword");
	ProductService productService = new ProductService();
	List<Product> productList = new ArrayList<Product>();
	if(keyword.equals("반지")){
		productList = productService.searchCategory(keyword);
		response.sendRedirect("product_list.jsp?type_no=1");
	}else if(keyword.equals("목걸이")){
		productList = productService.searchCategory(keyword);
		response.sendRedirect("product_list.jsp?type_no=2");
	}else if(keyword.equals("팔찌")){
		productList = productService.searchCategory(keyword);
		response.sendRedirect("product_list.jsp?type_no=3");
	}else if(keyword.equals("귀걸이")){
		productList = productService.searchCategory(keyword);
		response.sendRedirect("product_list.jsp?type_no=4");
	}else{
		productList = productService.searchProductName(keyword);
		
	} */
	String keyword = request.getParameter("mainsearchkeyword");
	ProductService productService = new ProductService();
	List<Product> productList = new ArrayList<Product>();
	if(keyword.equals("반지")||keyword.equals("목걸이")||keyword.equals("팔찌")||keyword.equals("귀걸이")){
		productList = productService.searchCategory(keyword);
		response.sendRedirect("product_list.jsp?type_no="+productList.get(1).getCa_no());
	}else{
		productList = productService.searchProductName(keyword);
		response.sendRedirect("product_list.jsp");
	}
%>