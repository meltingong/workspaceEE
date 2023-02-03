<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>     
<%
	if(request.getMethod().equals("GET")){
		response.sendRedirect("shop_main.jsp");
		return;
	}
	try{
		request.setCharacterEncoding("UTF-8");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		User user=new User(sUserId,password,name,email);
		UserService userService=new UserService();
		int updateRowCount=userService.update(user);
		
		response.sendRedirect("user_view.jsp");
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("user_error.jsp");
	}
	
%>






