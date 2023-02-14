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
 * Servlet implementation class GuestViewServlet
 */
@WebServlet("/guest_view.do")
public class GuestViewServlet extends HttpServlet {
	private GuestService guestService;

	public GuestViewServlet() throws Exception {
		guestService = new GuestService();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forwardPath = "";
		try {
			String guest_noStr = request.getParameter("guest_no");
			if (guest_noStr == null || guest_noStr.equals("")) {
				//response.sendRedirect("guest_main.do");
				forwardPath="redirect:guest_main.do";
			}else {
				Guest guest = guestService.findByNo(Integer.parseInt(guest_noStr));
				request.setAttribute("guest", guest);
				forwardPath = "forward:/WEB-INF/views/guest_view.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath = "forward:/WEB-INF/views/guest_error.jsp";
		}

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




