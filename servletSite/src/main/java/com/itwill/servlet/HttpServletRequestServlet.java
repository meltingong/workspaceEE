package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HttpServletRequestServlet
 */
@WebServlet("/request.do")
public class HttpServletRequestServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String method = request.getMethod();
		String requestURL = request.getRequestURL().toString();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String remoteAddress = request.getRemoteAddr();
		
		//클라이언트요청URL ==>
		//http://localhost/servletSite/request.do?name=kim&phone=1234&address=seoul
		String queryString = request.getQueryString();
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		System.out.println("************************"+remoteAddress+"님이 전송한 정보**********************");
		System.out.println("queryString : " + queryString);
		System.out.println("name 파라메타 값: " + name);
		System.out.println("phone 파라메타 값: " + phone);
		System.out.println("address 파라메타 값: " + address);
		System.out.println("*******************************************************************************");
		
		out.println("<h1>HttpServletRequest객체</h1><hr>");
		out.println("<ol>");
		out.println("<li>요청메소드:"+method+"</li>");
		out.println("<li>요청URL:"+requestURL+"</li>");
		out.println("<li>요청URI:"+requestURI+"</li>");
		out.println("<li>contextPath:"+contextPath+"</li>");
		out.println("<li>remoteAddress:"+remoteAddress+"</li>");
		out.println("</ol>");
		
		
		
	}

}
