<%@page import="product.ProductService"%>
<%@page import="cart.Cart"%>
<%@page import="cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>       
<%
       if(request.getMethod().equalsIgnoreCase("GET")){
       		response.sendRedirect("product_list.jsp");
       		return;
       	}
       	/*
       	1.파라메타받기(cart_qty,p_no)
       	2.장바구니에 제품을담고 cart_view.jsp로redirection
       	*/
       	String p_option = request.getParameter("p_option");
       	String cart_qty=request.getParameter("cart_qty");
       	String p_noStr=request.getParameter("p_no");
       	CartService cartService=new CartService();
       	cartService.addCart(sUserId,Integer.parseInt(p_noStr),Integer.parseInt(cart_qty));
       	ProductService productService = new ProductService();
       	productService.updateOption(Integer.parseInt(p_noStr),p_option);
       	response.sendRedirect("cart_view.jsp");
       	/*
       	response.sendRedirect("cart_view_select.jsp");
       	response.sendRedirect("cart_view_select_update_qty.jsp");
       	response.sendRedirect("cart_view_select_update_qyt_all_check_delete_image.jsp");
       	*/
       %>