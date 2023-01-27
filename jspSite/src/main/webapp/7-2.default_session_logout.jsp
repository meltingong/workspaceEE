<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "7-2.default_session_login_check.jspf" %>
<%
   /*
   세션객체무효화
   */
   session.invalidate();

   request.getSession(true);
   
   response.sendRedirect("7-2.default_session_login_form.jsp");	
%>
