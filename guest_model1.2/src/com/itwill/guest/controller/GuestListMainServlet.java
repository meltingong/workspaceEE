package com.itwill.guest.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestService;

/**
 * Servlet implementation class GuestListMainServlet
 */
//@WebServlet("/guest_list.do")
public class GuestListMainServlet extends HttpServlet {
	private GuestService guestService;
	public GuestListMainServlet() throws Exception {
		guestService = new GuestService();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath = "";
		try {
		List<Guest> guestList=guestService.findAll();
		forwardPath="forward:/WEB-INF/views/guest_list.jsp";
		request.setAttribute("userList", guestList);
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
