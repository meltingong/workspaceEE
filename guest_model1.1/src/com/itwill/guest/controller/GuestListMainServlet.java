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
@WebServlet("/guest_list.do")
public class GuestListMainServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forwardPath = "";
		try {
		GuestService guestService=new GuestService();
		List<Guest> guestList=guestService.findAll();
		forwardPath="/WEB-INF/views/guest_list.jsp";
		request.setAttribute("userList", guestList);
		}catch(Exception e) {
			e.printStackTrace();
			forwardPath="/WEB-INF/views/guest_error.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
		rd.forward(request, response);
		
	}

}
