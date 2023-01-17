package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycleCounterServlet
 */
@WebServlet("/lifecycle_counter.do")
public class LifeCycleCounterServlet extends HttpServlet {
	private int count;
	public LifeCycleCounterServlet() {
		System.out.println("0.LifeCycleCounterService() �⺻������ȣ��[���ʿ�û�� �� �ѹ� ȣ��] ��ü�ּ�: " + this);
	}
	@Override
	public void init(ServletConfig config) throws ServletException {
			super.init(config);
			System.out.println("1. init()�޼ҵ� ������ ȣ�� ���Ŀ� �� �ѹ� ȣ��[��ü�ʱ�ȭ,���ҽ�ȹ��]");
		}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("2. service�޼ҵ� ����");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Insert title here</title>");
		out.println("</head>");
		out.println("<body bgcolor=#40e0d0 style=\"font-size: 9pt; line-height: 140%;\">");
		out.println("	<center>");
		out.println("		��������� ��������� <font color=#0000FF>"+ ++count +" </font> ���Դϴ�");
		out.println("	</center>");
		out.println("</body>");
		out.println("</html>");
	}
	@Override
	public void destroy() {
		System.out.println("3.destory()�޼ҵ� --> ������ü�� �޸𸮿��� �����Ǳ� ������ ȣ��[���ҽ��ݳ�]");
	}
	
	
	
}
