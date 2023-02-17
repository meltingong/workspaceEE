package com.itwill.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.summer.mvc.Controller;
import com.itwill.user.User;
import com.itwill.user.UserService;

public class UserModifyActionController implements Controller {
	private UserService userService;
	public UserModifyActionController() throws Exception {
		userService = new UserService();
	}
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String forwardPath = "";
		/**************** login_check *******************/
		String sUserId = (String)session.getAttribute("sUserId");
		if(sUserId == null) {
			forwardPath="redirect:user_login_form.do";
		}
		/*********************************************/
		/*
		0.login 여부체크
		1.GET방식이면 redirect:user_main.do forwardPath반환
		2.요청객체인코딩설정
		3.파라메타받기(password,name,email)
		4.세션의 sUserId와 파라메타(password,name,email) 로 User객체생성후  UserService.update 메쏘드호출
		5.성공: redirect:user_view.do forwardPath반환
		  실패: forward:/WEB-INF/views/user_error.jsp  forwardPath반환
		*/
		if(request.getMethod().equalsIgnoreCase("GET")) {
			forwardPath="redirect:user_main.do";
		}else {
			try {
				String password = request.getParameter("password");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				
				User user = new User(sUserId,password,name,email);
				userService.update(user);
				forwardPath = "redirect:user_view.do";
			}catch (Exception e) {
				e.printStackTrace();
				forwardPath="forward:/WEB-INF/views/user_error.jsp";
			}
		}
		return forwardPath;
	}

}
