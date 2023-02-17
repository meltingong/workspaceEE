package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.itwill.summer.mvc.Controller;

public class UserLogoutActionController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		HttpSession session = request.getSession();
		/****************login_check*******************/
		String sUserId = (String)session.getAttribute("sUserId");
		if(sUserId == null) {
			forwardPath="redirect:user_login_form.do";
		}else {
			session.invalidate();
			forwardPath="redirect:user_main.do";
		}
		/*********************************************/
		
		return forwardPath;
	}

}
