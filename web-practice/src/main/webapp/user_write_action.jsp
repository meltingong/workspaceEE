<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("get")){
		response.sendRedirect("user_write_form.jsp");
		return;
	}

	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	User newUser = null;
	try {
		newUser = new User(userId,password,name,email,phone,address);
		UserService userService = new UserService();
		int result = userService.create(newUser);
		if(result == 1){
			// 회원가입 성공
			response.sendRedirect("user_login_form.jsp");
		} 
	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("user_write_form.jsp");
	}
	
	
	
%>















