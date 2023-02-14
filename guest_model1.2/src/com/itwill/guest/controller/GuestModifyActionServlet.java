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
	private GuestService guestService;
	public GuestModifyActionServlet() throws Exception {
		guestService = new GuestService();
	}
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forwardPath = "";
		try {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			//response.sendRedirect("guest_main.do");
			forwardPath="redirect:guest_main.do";
		}else {
				String guest_noStr = request.getParameter("guest_no");
				String guest_name = request.getParameter("guest_name");
				String guest_email = request.getParameter("guest_email");
				String guest_homepage = request.getParameter("guest_homepage");
				String guest_title = request.getParameter("guest_title");
				String guest_content = request.getParameter("guest_content");
				Guest updateGuest = new Guest(Integer.parseInt(guest_noStr), guest_name, null, guest_email, guest_homepage, guest_title,
						guest_content);
		
				int updateRowCount = guestService.update(updateGuest);
				//response.sendRedirect("guest_view.do?guest_no=" + guest_noStr);
				forwardPath="redirect:guest_view.do?guest_no="+guest_noStr;
				//forwardPath="forward:guest_view.do"; 이것도 가능하지만 하지x
			}
		}catch (Exception e) {
			e.printStackTrace();
			forwardPath="forward:/WEB-INF/views/guest_error.jsp";
		}
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
