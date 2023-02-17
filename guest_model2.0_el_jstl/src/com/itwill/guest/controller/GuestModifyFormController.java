package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestService;
import com.itwill.summer.mvc.Controller;

public class GuestModifyFormController implements Controller {
	private GuestService guestService;
	public GuestModifyFormController() {
		guestService=new GuestService();
	}
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		try {
			if(request.getMethod().equalsIgnoreCase("GET")){
				//response.sendRedirect("guest_main.do");
				forwardPath="redirect:guest_main.do";
			}else {
				String guest_noStr=request.getParameter("guest_no");
				Guest guest=
						guestService.findByNo(Integer.parseInt(guest_noStr));
				request.setAttribute("guest",guest);
				forwardPath = "forward:/WEB-INF/views/guest_modify_form.jsp";
			}
		}catch (Exception e) {
			e.printStackTrace();
			forwardPath="forward:/WEB-INF/views/guest_error.jsp";
		}
		return forwardPath;
	}

}
