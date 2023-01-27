<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	GET방식이면 guest_main.jsp redirection
	0.요청객체encoding설정
	1.파라메타받기(guest_no)
	2.GuestService객체생성
	3.GuestService객체 delete(guest_no) 메쏘드호출
	4.guest_list.jsp로 redirection
*/

	try{
		if(request.getMethod().equalsIgnoreCase("GET")){
			response.sendRedirect("guest_main.jsp");
			return;
		}else{
			request.setCharacterEncoding("UTF-8");
			String guest_no = request.getParameter("guest_no");
			GuestService guestService = new GuestService();
			guestService.delete(Integer.parseInt(guest_no));
			response.sendRedirect("guest_list.jsp");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
