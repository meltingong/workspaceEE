<%@page import="java.io.PrintWriter"%>
<%@page import="com.itwill.address.AddressService"%>
<%@page import="com.itwill.address.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
 GET방식으로 요청이 오면 address_main.jsp redirection

 * 0.요청객체encoding설정
 * 1.파라메타받기(id,name,phone,address)--> Address객체생성
 * 2.AddressService객체생성
 * 3.AddressService.insert(Address객체)메쏘드실행
 * 4.address_list.jsp 로 redirection
 */
 try{
	 if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("address_main.jsp");
		}
	 request.setCharacterEncoding("UTF-8");
	 String name = request.getParameter("name");
	 String phone = request.getParameter("phone");
	 String address = request.getParameter("address");
	 
	 AddressService addressService = new AddressService();
	 addressService.insert(new Address(0,name,phone,address));
	 response.sendRedirect("address_list.jsp");
 }catch(Exception e){
	 e.printStackTrace();
 }
%>

