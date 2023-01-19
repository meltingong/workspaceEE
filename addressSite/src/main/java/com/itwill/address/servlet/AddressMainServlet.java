package com.itwill.address.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddressMainServlet
 */
@WebServlet("/address_main.do")
public class AddressMainServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>Insert title here</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>주소록관리메인</h1><hr/>");
		out.println("<p>접속IP["+request.getRemoteAddr()+"]</p>");
		out.println("<ul>");
		out.println("	<li><a href='address_list.do'>주소록리스트</a></li>");
		out.println("	<li><a href='address_insert_form.do'>주소록쓰기폼</a></li>");
		out.println("</ul>");
		out.println("</body>");
		out.println("</html>");
		
	}

	

}
