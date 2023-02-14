package com.itwill.summer.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 1. 클라이언트(웹브라우져)의 모든요청을 받는 서블릿작성(front Controller)
 * 2. 확장자가 *.do인 모든클라이언트의 요청이 서블릿을 실행하도록 web.xml에 url pattern mapping
   << web.xml >>
    <servlet>
		<servlet-name>dispatcher</servlet-name>
		<servlet-class>com.itwill.summer.mvc.DispatcherServlet</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>dispatcher</servlet-name>
		<url-pattern>*.do</url-pattern>
	</servlet-mapping>
 */

public class DispatcherServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
