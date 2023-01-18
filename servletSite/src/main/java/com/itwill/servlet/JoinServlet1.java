package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.PRIVATE_MEMBER;

/**
 * Servlet implementation class JoinServlet1
 */
@WebServlet("/join1.do")
public class JoinServlet1 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("05-03.form1.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		/*
		 * 0. ��û��ü ���ڵ� ����
		 */
		request.setCharacterEncoding("UTF-8");
		/*
		 * 1. �Ķ��Ÿ �ޱ�
		 */
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1+"@"+email2;
		String gender = request.getParameter("email1");
		String[] favorites = request.getParameterValues("favorite");
		String message = request.getParameter("message");
		
		/*
		 * 2. ��������(Service��ü �޼ҵ� ȣ��)
		 */
		
		/*
		 * 3. Ŭ���̾�Ʈ�� �������
		 */
		out.println("<h1>��������</h>");

		out.println("<ul>");
		out.println("<li>���̵�: "+id+"</li>");
		out.println("<li>�о�����:"+pass+"</li>");
		out.println("<li>�̸���:"+email+"</li>");
		out.println("<li>����:"+gender+"</li>");
		out.println("<li>���ɻ�");
		out.println("<ul>");
		if(favorites!=null) {
			for(String favorite : favorites) {
				out.println("<li>"+favorite+"</li>");
			}
		}
		out.println("</ul>");
		out.println("</li>");
		out.println("<li>�����λ�:"+message+"</li>");
		out.println("</ul>");

		
		
		
	}

}
