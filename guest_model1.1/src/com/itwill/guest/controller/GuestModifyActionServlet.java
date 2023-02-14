package com.itwill.guest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestService;

/**
 * Servlet implementation class GuestWriteFormSevlet
 */
@WebServlet("/guest_modify_action.do")
public class GuestModifyActionServlet extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forwardPath = "/WEB-INF/views/guest_modify_action.jsp";

		RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
		rd.forward(request, response);
		
		
	}

}
