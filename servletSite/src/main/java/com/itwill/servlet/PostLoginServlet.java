package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetLoginServlet
 */
@WebServlet("/post_login.do")
public class PostLoginServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.sendRedirect("05-02.login_post.html");
		}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		/*
		  1. 요청시 전송되는 파라메타 받기
		  	- 파라메타 이름은 input element의 name 속성과 일치
		  		아이디:<input type="text" name="id">
				패에쓰:<input type="password" name="pass">
		 */
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		if(id==null||id.equals("") || pass ==null || pass.equals("")) {
			response.sendRedirect("05-02.login_post.html");
			return;
		}
		/*
		 * 2. 로그인 업무실행(service객체사용)
		 */
		boolean isMember1 = id.equals("xxxx") && pass.equals("1111");
		boolean isMember2 = id.equals("yyyy") && pass.equals("2222");
		
		out.println("<h1>Post 로그인 결과</h1><hr>");
		if(isMember1 || isMember2) {
			// 로그인 성공
			out.println("<h3>" + id + "님 로그인 성공</h3><hr>");
			out.println("<a href = 'index.html'>메인으로</a>");
		}else {
			// 로그인 실패
			out.println("<h3>" + id + "님 로그인 실패</h3><hr>");
			out.println("<a href = '05-02.login_post.html'>다시 로그인</a>");
			
		}
		
	}

}
