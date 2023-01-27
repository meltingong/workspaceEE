<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session ='true'%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("7-2.default_session_login_form.jsp");
		return;
	}	
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	/*
		id   : user1,user2
		pass : 1111 ,2222
 	*/
 	boolean isMember1 = id.equals("user1")&& pass.equals("1111");
 	boolean isMember2 = id.equals("user2")&& pass.equals("2222");
 	if(!(isMember1||isMember2)){
		//로그인실패 		
		out.println("<script>");
		out.println("alert('로그인 실패');");
		out.println("location.href = '7-2.default_session_login_form.jsp';");
		out.println("</script>");
 		return;
 	}
 	/*
 	로그인성공시 세션객체에 loginId라는 키값으로 아이디값을 저장한다.
 	*/
 	
 	session.setAttribute("loginId", id);
 	
%>
<h1>로그인성공</h1><hr>
<p><%=id %>님 어서오세요</p>
<div>
	<a href='7-2.default_session_logout.jsp'><%=id %>님 로그아웃</a>
	<a href="7-2.default_session_use1.jsp">회원전용페이지1</a>
	<a href="7-2.default_session_use2.jsp">회원전용페이지2</a>
</div> 