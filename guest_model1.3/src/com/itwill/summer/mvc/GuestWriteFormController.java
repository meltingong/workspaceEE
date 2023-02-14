package com.itwill.summer.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestWriteFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		forwardPath = "forward:/WEB-INF/views/guest_write_form.jsp";
		return forwardPath;
	}

}
