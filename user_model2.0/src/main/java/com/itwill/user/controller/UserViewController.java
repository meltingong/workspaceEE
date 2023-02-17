package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.summer.mvc.Controller;
import com.itwill.user.User;
import com.itwill.user.UserService;

public class UserViewController implements Controller{
	private UserService userService;
	public UserViewController() throws Exception {
		userService = new UserService();
	}
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		HttpSession session = request.getSession();
		String sUserId = (String)session.getAttribute("sUserId");
		/****************login_check*******************/
		if(sUserId == null) {
			forwardPath = "redirect:user_login_form.do";
		}
		/*********************************************/
		/*
		1. UserService객체생성
		2. 세션의 sUserId를 사용해서 UserService.findUser()메쏘드호출
		3. 반환된 User객체출력
		*/
		try {
			User user = userService.findUser(sUserId);
			request.setAttribute("user", user);
			forwardPath = "forward:/WEB-INF/views/user_view.jsp";
		}catch (Exception e) {
			e.printStackTrace();
			forwardPath ="redirect:user_error.do";
		}
		return forwardPath;
	}

}
