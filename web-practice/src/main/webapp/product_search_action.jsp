<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("mainsearchkeyword");
	String type_noStr = request.getParameter("type_no");
	ProductService productService = new ProductService();
	List<Product> productList = new ArrayList<Product>();
	if(keyword.equals("반지")||keyword.equals("목걸이")||keyword.equals("팔찌")||keyword.equals("귀걸이")){
		productList = productService.searchCategory(keyword);
		response.sendRedirect("product_list.jsp?type_no="+productList.get(0).getCa_no());
	}else{
		//productList = productService.searchProductName(keyword);
		pageContext.forward("product_list.jsp");
	}
%>