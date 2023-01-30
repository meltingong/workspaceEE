<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "user_login_check.jspf" %>
<%
	/*
		0.login 여부체크
		1.GET방식이면 user_main.jsp redirection
		2.요청객체인코딩설정
		3.세션에있는 sUserId를 사용해서 UserService.remove(sUserId) 메쏘드호출
		4.성공: user_logout_action.jsp redirection --> user_main.jsp
		  실패: user_error.jsp 
		  	 
	*/
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_main.jsp");
		return;
	}
	//request.setCharacterEncoding("UTF-8");
	UserService userService = new UserService();
	userService.remove(sUserId);
	session.invalidate();
	request.getSession(true);
	response.sendRedirect("user_main.jsp");
	
%>