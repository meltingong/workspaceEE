package com.itwill.summer.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * - 모든컨트롤러클래스가 구현해야하는 규칙(interface)
 * - Controller interface를 구현한 클래스의 객체는 DispatcherServlet이 
 *    handleRequest() 메쏘드를호출해서 업무실행
 * - Controller interface 구현한객체는 forwardPath를 반환   
 */
public interface Controller {
	public String handleRequest(HttpServletRequest request,
								HttpServletResponse response);
}
