<%@page import="product.Product"%>
<%@page import="java.util.List"%>
<%@page import="product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductService productService = new ProductService();
	String type_no = request.getParameter("type_no");
	String sort_option = request.getParameter("sort_option");
	
	if(sort_option.equals("sort_asc")){
		List<Product> productList = productService.priceSortAsc();
		response.sendRedirect("product_list.jsp");
	}else if(sort_option.equals("sort_desc")){
		productService.priceSortDesc();
		List<Product> productList = productService.priceSortAsc();
		response.sendRedirect("product_list.jsp?type_no="+type_no);
	}
	
%>