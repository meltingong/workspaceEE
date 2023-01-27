<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*********로그인한회원만볼수있는페이지*************/
	
%>

<%
   /*
   세션객체무효화
   */
   
   response.sendRedirect("7-2.default_session_login_form.jsp");	
%>
