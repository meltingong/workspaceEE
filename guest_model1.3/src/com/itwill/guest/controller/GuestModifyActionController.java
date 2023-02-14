package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestService;
import com.itwill.summer.mvc.Controller;

public class GuestModifyActionController implements Controller {
	private GuestService guestService;
	public GuestModifyActionController() {
		guestService = new GuestService();
	}
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		try {
			if (request.getMethod().equalsIgnoreCase("GET")) {
				forwardPath="redirect:guest_main.do";
			}else {
				String guest_noStr = request.getParameter("guest_no");
				String guest_name = request.getParameter("guest_name");
				String guest_email = request.getParameter("guest_email");
				String guest_homepage = request.getParameter("guest_homepage");
				String guest_title = request.getParameter("guest_title");
				String guest_content = request.getParameter("guest_content");
				Guest updateGuest = 
						new Guest(Integer.parseInt(guest_noStr),
									guest_name, null, guest_email, 
									guest_homepage, guest_title,guest_content);
				int updateRowCount = guestService.update(updateGuest);
				forwardPath="redirect:guest_view.do?guest_no="+guest_noStr;
			}
		}catch (Exception e) {
			e.printStackTrace();
			forwardPath="forward:/WEB-INF/views/guest_error.jsp";
		}
		return forwardPath;
	}

}
