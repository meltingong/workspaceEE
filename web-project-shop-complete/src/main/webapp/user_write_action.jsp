<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shop.user.exception.ExistedUserException"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_write_form.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");
	String userId=request.getParameter("userId");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	User newUser=null;
	try{
		newUser=new User(userId,password,name,email);
		UserService userService=new UserService();
		int rowCount = userService.create(newUser);
		response.sendRedirect("user_login_form.jsp");
	}catch(ExistedUserException e){
		/*************************case1[redirect]**************
    	response.sendRedirect("user_write_form.jsp?msg="+URLEncoder.encode(e.getMessage(),"UTF-8"));
    	****************************************************/
    	/*************case2[forward]**************
    	//이동할려는 page로 데이타를 전달해야할때
    	//<jsp:forward parth="user_write_form.jsp"/>
    	request.setAttribute("msg", e.getMessage());
    	request.setAttribute("fuser", newUser);
    	RequestDispatcher rd=request.getRequestDispatcher("user_write_form.jsp");
    	rd.forward(request, response);
    	******************************************/
		/*****************case3[정상응답]***************/
		out.println("<script>");
		out.println("alert('"+e.getMessage()+"');");
		out.println("location.href='user_write_form.jsp';");
		out.println("</script>");
		/********************************************/
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("user_error.jsp");		
	}
%>















