

<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%
	/*
	0  . GET방식요청일때 user_login_form.jsp로 redirection
	1  . 요청객체 인코딩설정
	2  . 파라메타 받기
	3  . UserService객체생성
	4  . UserService.login() 메쏘드실행
	*/
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_login_form.jsp");
		return;
	}
	//request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	UserService userService=new UserService();
	int result = userService.login(userId, password);
	/*
	 * 회원로그인
	 * 
	 * 0:아이디존재안함
	 * 1:패쓰워드 불일치
	 * 2:로그인성공(세션)
	 */
	 if(result==0){
		 //0:아이디존재안함
		 String msg1=userId+" 는 존재하지않는 아이디입니다.";
		 out.println("<script>");
		 out.println("alert('"+msg1+"');");
		 out.println("location.href='user_login_form.jsp';");
		 out.println("</script>");
			
	 }else if(result==1){
		 //1:패쓰워드 불일치
		 String msg2="패쓰워드가 일치하지않습니다.";
		 out.println("<script>");
		 out.println("alert('"+msg2+"');");
		 out.println("location.href='user_login_form.jsp';");
		 out.println("</script>");
			
		 
	 }else if(result==2){
		 //2:로그인성공(세션)
		 session.setAttribute("sUserId", userId);
		 response.sendRedirect("shop_main.jsp");
	 }
	
	
	
%>