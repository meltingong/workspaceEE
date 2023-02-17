package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.summer.mvc.Controller;

public class UserWriteFormController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) {
		
		return "forward:/WEB-INF/views/user_write_form.jsp";
	}

}
