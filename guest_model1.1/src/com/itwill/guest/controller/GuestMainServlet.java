package com.itwill.guest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GuestMainServlet
 */
@WebServlet("/guest_main.do")
public class GuestMainServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath = "forward:/WEB-INF/views/guest_main.jsp";
		/*
		 * forward  ==> forward:/WEB-INF/views/guest_xxx.jsp
		 * redirect ==> redirect:guest_xxx.do
		 */
		String[] pathArray = forwardPath.split(":");
		String forwardOrRedirect = pathArray[0];
		String path = pathArray[1];
		
		if(forwardOrRedirect.equals("redirect")) {
			//redirect
			response.sendRedirect(path);
		}else {
			//forward
			
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		}
	}
}
