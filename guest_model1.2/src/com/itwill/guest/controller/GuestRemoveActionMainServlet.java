package com.itwill.guest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.GuestService;

/**
 * Servlet implementation class GuestRemoveActionMainServlet
 */
@WebServlet("/guest_remove_action.do")
public class GuestRemoveActionMainServlet extends HttpServlet {
	private GuestService guestService;
	public GuestRemoveActionMainServlet() throws Exception {
		guestService = new GuestService();
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath = "";
		try {
		if(request.getMethod().equalsIgnoreCase("GET")){
			forwardPath="redirect:guest_main.do";
		 }else {
			 String guest_noStr = request.getParameter("guest_no");
			 int deleteRowCount=guestService.delete(Integer.parseInt(guest_noStr));
			forwardPath="redirect:guest_list.do";
		 }
		}catch(Exception e) {
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
