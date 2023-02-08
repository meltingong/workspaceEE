<%@page import="java.util.ArrayList"%>
<%@page import="product.Product"%>
<%@page import="java.util.List"%>
<%@page import="product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String type_no = request.getParameter("type_no");
	String sort_option = request.getParameter("sort_option");
	ProductService productService = new ProductService();
	List<Product> productList = new ArrayList<Product>();
	if(type_no == null){
		if(sort_option.equals("sort_asc")){
	productList = productService.priceSortAsc();
	response.sendRedirect("product_list.jsp");
		}else if(sort_option.equals("sort_desc")){
	productList = productService.priceSortDesc();
	response.sendRedirect("product_list.jsp");
		}
	}else{
		if(sort_option.equals("sort_asc")){
	productList = productService.categorySortAsc(Integer.parseInt(type_no));
	response.sendRedirect("product_list.jsp?type_no="+type_no);
		}else if(sort_option.equals("sort_desc")){
	productList = productService.categorySortDesc(Integer.parseInt(type_no));
	response.sendRedirect("product_list.jsp?type_no="+type_no);
		}
	}
%>