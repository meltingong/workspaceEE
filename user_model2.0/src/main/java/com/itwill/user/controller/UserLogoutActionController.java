package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.itwill.summer.mvc.Controller;

public class UserLogoutActionController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		/****************login_check*******************/
		//String sUserId = 
		//if(sUserId == null) {
			
			forwardPath="redirect:user_main.do";
		//}
		/*********************************************/
		
		return forwardPath;
	}

}
