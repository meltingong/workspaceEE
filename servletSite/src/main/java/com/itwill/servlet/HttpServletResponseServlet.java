package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HttpServletResponseServlet
 */
@WebServlet("/response.do")
public class HttpServletResponseServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		/*
		 * http://192.168.15.9/servletSite/response.do?cmd=1
		 * http://192.168.15.9/servletSite/response.do?cmd=2
		 * http://192.168.15.9/servletSite/response.do?cmd=3
		 * http://192.168.15.9/servletSite/response.do?cmd=
		 * http://192.168.15.9/servletSite/response.do
		 */
		
		String cmd = request.getParameter("cmd");
		if(cmd == null || cmd.equals("")) {
			/***************case1*****************/
			out.println("<h1>�ٽ� ��û�ϼ���</h1><hr>");
			out.println("<a href = './04.HttpServletResponse.html'>04.HttpServletResponse.html</a>");
			/***************case2****************/
			response.sendRedirect("04.HttpServletResponse.html");
			return;
		}
		if(cmd.equals("1")) {
			/*
			 * <<��������>>
			 * 	1.������� �����ڵ� 200
			 *  2.�������
			 *  3.����ٵ���Ÿ(html)����
			 */
			out.println("<h3> �������� </h3><hr>");
		}else if(cmd.equals("2")) {
			/*
			 * <<error����>>
			 *  1.������� 4xx,5xx
			 *  2.�������
			 *  3.����ٵ���Ÿ����(����������)
			 */
			response.sendError(403);
			//response.sendError(500);
		}else if(cmd.equals("3")) {
			/*
			 * <<redirect[����������]>>
			 *  1.������� 302
			 *  2.�������[Location:05-03.form1.html(redirection url) ������]
			 *  3.����ٵ���Ÿ ����(����������)
			 */
			//response.sendRedirect("05-03.form1.html");
			response.sendRedirect("lifecycleImage_counter.do");
			
		}else{
			
		}
		
	}

}
