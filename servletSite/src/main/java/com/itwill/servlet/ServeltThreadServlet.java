package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/serveltThreadServlet.do")
public class ServeltThreadServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currentThreadName = Thread.currentThread().getName();
		
		System.out.println(request.getRemoteAddr()+"���� ��û�� ���� " +request.getLocalAddr() +"[���缭��]���� �Ҵ�� �������" + currentThreadName + "�Դϴ�");
		System.out.println(request.getLocalAddr()+"[���缭��]���� " + request.getRemoteAddr() + "���� �������� �����մϴ�.");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>����������</title>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h5>ServletThreadServlet[Dynamic Resource]���ྲ����</h5>");
		out.println("<hr>");
		out.println("������� ������ �̸�: " + currentThreadName + "<br>");
		out.println(request.getRemoteAddr()+"���� ��û�� ���� " +request.getLocalAddr() +"[���缭��]���� �Ҵ�� �������" + currentThreadName + "�Դϴ�.<br>");
		out.println(request.getLocalAddr()+"[���缭��]���� " + request.getRemoteAddr() + "���� �������� �����մϴ�.");
		out.println("</body>");
		out.println("</html>");
	}

}
