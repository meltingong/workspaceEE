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
			out.println("<h1>다시 요청하세요</h1><hr>");
			out.println("<a href = './04.HttpServletResponse.html'>04.HttpServletResponse.html</a>");
			return;
		}
		if(cmd.equals("1")) {
			out.println("<h3> 정상응답 </h3><hr>");
		}else if(cmd.equals("2")) {
			response.sendError(403);
			//response.sendError(500);
		}else if(cmd.equals("3")) {
			
		}else{
			
		}
		
	}

}
