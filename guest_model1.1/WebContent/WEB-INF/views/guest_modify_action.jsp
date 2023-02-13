<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
GET방식이면 guest_main.jsp redirection

	0.요청객체encoding설정
	1.파라메타받기(guest_no,guest_name,guest_email,guest_homepage,guest_title,guest_content)
	 Guest객체생성
	2.GuestService객체생성
	3.GuestService객체 update(Guest객체) 메쏘드호출
	4.guest_view.jsp로 redirection
*/
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect(request.getContextPath());
	return;
}

String guest_noStr=request.getParameter("guest_no");
String guest_name=request.getParameter("guest_name");
String guest_email=request.getParameter("guest_email");
String guest_homepage=request.getParameter("guest_homepage");
String guest_title=request.getParameter("guest_title");
String guest_content=request.getParameter("guest_content");
new GuestService().update(new Guest(Integer.parseInt(guest_noStr),
									guest_name,
									null,
									guest_email,
									guest_homepage,
									guest_title,guest_content));
response.sendRedirect("guest_view.jsp?guest_no="+guest_noStr);

%>