<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>    
<%
    /*
                    	 주문생성
                    	*/
                    	if(request.getMethod().equalsIgnoreCase("GET")){
                    		response.sendRedirect("order_list.jsp");
                    		return;
                    	}
                    	String buyType=request.getParameter("buyType");
                    	String p_noStr=request.getParameter("p_no");
                    	String p_qtyStr=request.getParameter("p_qty");
                    	String[] cart_item_no_strArray=request.getParameterValues("cart_item_no");
                    	OrderService orderService=new OrderService();
                    	CartService cartService=new CartService();
                    	if(buyType.equals("cart")){
                    		orderService.create(sUserId);
                    	}else if(buyType.equals("cart_select")){
                    		orderService.create(sUserId,cart_item_no_strArray);	
                        }else if(buyType.equals("direct")){
                    		orderService.create(sUserId, Integer.parseInt(p_noStr), Integer.parseInt(p_qtyStr));
                    	}
                    	response.sendRedirect("order_list.jsp");
    %>