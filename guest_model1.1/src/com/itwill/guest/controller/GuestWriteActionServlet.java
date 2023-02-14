package com.itwill.guest.controller;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestService;

/**
 * Servlet implementation class GuestWriteActionServlet
 */
@WebServlet("/guest_write_action.do")
public class GuestWriteActionServlet extends HttpServlet {
	private GuestService guestService;
	public GuestWriteActionServlet() throws Exception {
		guestService = new GuestService();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath="";
		
		try {
		if(request.getMethod().equalsIgnoreCase("GET")){
			//response.sendRedirect("guest_main.do");
			forwardPath="redirect:guest_main.do";
		}else {
			String guest_name=request.getParameter("guest_name");
			String guest_email=request.getParameter("guest_email");
			String guest_homepage=request.getParameter("guest_homepage");
			String guest_title=request.getParameter("guest_title");
			String guest_content=request.getParameter("guest_content");
			Guest insertGuest=
					new Guest(0,guest_name,null,guest_email,guest_homepage,guest_title,guest_content);
		
			int insertRowCount=guestService.insert(insertGuest);
			forwardPath = "redirect:guest_list.do";
			}
		}catch (Exception e) {
			e.printStackTrace();
			forwardPath = "forward:/WEB-INF/views/guest_error.jsp";
				
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
