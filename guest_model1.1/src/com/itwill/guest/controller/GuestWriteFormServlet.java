package com.itwill.guest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GuestWriteFormSevlet
 */
@WebServlet("/guest_write_form.do")
public class GuestWriteFormServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forwardPath = "";
		forwardPath = "forward:/WEB-INF/views/guest_write_form.jsp";
		
		/************forward or redirect*************/
		/*
		 * forward ---> forward:/WEB-INF/views/guest_xxx.jsp
		 * redirect---> redirect:guest_xxx.do
		 */
		String[] pathArray = forwardPath.split(":");
		String forwardOrRedirect=pathArray[0];
		String path=pathArray[1];
		if(forwardOrRedirect.equals("redirect")) {
			//redirect
			response.sendRedirect(path);
		}else {
			//forwarding
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		}
		/*****************************************/
		
	}

}
