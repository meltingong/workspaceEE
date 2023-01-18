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
		  1. ��û�� ���۵Ǵ� �Ķ��Ÿ �ޱ�
		  	- �Ķ��Ÿ �̸��� input element�� name �Ӽ��� ��ġ
		  		���̵�:<input type="text" name="id">
				�п���:<input type="password" name="pass">
		 */
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		if(id==null||id.equals("") || pass ==null || pass.equals("")) {
			response.sendRedirect("05-02.login_post.html");
			return;
		}
		/*
		 * 2. �α��� ��������(service��ü���)
		 */
		boolean isMember1 = id.equals("xxxx") && pass.equals("1111");
		boolean isMember2 = id.equals("yyyy") && pass.equals("2222");
		
		out.println("<h1>Post �α��� ���</h1><hr>");
		if(isMember1 || isMember2) {
			// �α��� ����
			out.println("<h3>" + id + "�� �α��� ����</h3><hr>");
			out.println("<a href = 'index.html'>��������</a>");
		}else {
			// �α��� ����
			out.println("<h3>" + id + "�� �α��� ����</h3><hr>");
			out.println("<a href = '05-02.login_post.html'>�ٽ� �α���</a>");
			
		}
		
	}

}
