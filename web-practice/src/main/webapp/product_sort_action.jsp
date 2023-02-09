<%@page import="java.util.ArrayList"%>
<%@page import="product.Product"%>
<%@page import="java.util.List"%>
<%@page import="product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String type_noStr = request.getParameter("type_no");
		String sort_option = request.getParameter("sort_option");
		ProductService productService = new ProductService();
		List<Product> productList = new ArrayList<Product>();
		
	
		if(sort_option.equals("sort_asc")){
			pageContext.forward("product_list2.jsp");
		}else if(sort_option.equals("sort_desc")){
			pageContext.forward("product_list2.jsp");
		}
%>