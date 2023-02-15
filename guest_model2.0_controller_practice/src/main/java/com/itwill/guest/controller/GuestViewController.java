package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestService;
import com.itwill.summer.Controller;

/*
 * - 클라이언트요청한개를 처리하는 비즈니스로직을 담고있는 객체
 * - DispatcherServlet객체가 호출하는 handleRequest메쏘드를가짐
 * - handleRequest메쏘드가호출되면 DispatcherServlet객체에 forwardPath를 반환해줌
 */
public class GuestViewController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		/* 0. 파라메타받기
		 * 1. UserService객체를 사용해서Guest객체 얻기
		 * 2. request scope객체에 담기[setAttribute()]
		 * 3. forwardPath반환
		 */
		forwardPath = "forward:/WEB-INF/views/guest_view.jsp";
		return forwardPath;
	}
}
