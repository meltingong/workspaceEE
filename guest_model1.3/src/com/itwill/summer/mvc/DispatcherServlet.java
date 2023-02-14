package com.itwill.summer.mvc;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestService;

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
	private GuestService guestService;
	public DispatcherServlet() throws Exception{
		guestService=new GuestService();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		/*
		<<요청 url(command)>>
		/guest_main.do  		
		/guest_list.do			
		/guest_view.do			
		/guest_write_form.do	
		/guest_write_action.do	
		/guest_modify_form.do	
		/guest_modify_action.do	
		/guest_remove_action.do	
		 */
		
		/*
		 * 1.DispatcherServlet이 클라이언트의 요청URI를 사용해서 요청분석
		 */
		
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		/*
		 * 2.DispatcherServlet이 클라이언트요청에따른 비지니스실행[Service객체사용]
		 */
		String forwardPath="";
		if(command.equals("/guest_main.do")) {
			/******************guest_main.do****************/
			forwardPath="forward:/WEB-INF/views/guest_main.jsp";
			/**********************************************/
		}else if(command.equals("/guest_list.do")) {
			/******************guest_list.do****************/
			try {
				List<Guest> guestList = guestService.findAll();
				forwardPath="forward:/WEB-INF/views/guest_list.jsp";
				request.setAttribute("userList", guestList);
			}catch (Exception e) {
				e.printStackTrace();
				forwardPath="forward:/WEB-INF/views/guest_error.jsp";
			}
			/**********************************************/
		}else if(command.equals("/guest_view.do")) {
			/******************guest_view.do****************/
			try {
				String guest_noStr = request.getParameter("guest_no");
				if (guest_noStr == null || guest_noStr.equals("")) {
					forwardPath="redirect:guest_main.do";
				}else {
					Guest guest = guestService.findByNo(Integer.parseInt(guest_noStr));
					request.setAttribute("guest", guest);
					forwardPath = "forward:/WEB-INF/views/guest_view.jsp";
				}
			} catch (Exception e) {
				e.printStackTrace();
				forwardPath = "forward:/WEB-INF/views/guest_error.jsp";
			}
			/**********************************************/
		}else if(command.equals("/guest_write_form.do")) {
			/******************guest_write_form.do****************/
			forwardPath = "forward:/WEB-INF/views/guest_write_form.jsp";
			/*****************************************************/
		}else if(command.equals("/guest_write_action.do")) {
			/******************guest_write_action.do****************/
			try {
				if(request.getMethod().equalsIgnoreCase("GET")){
					//response.sendRedirect("guest_main.do");
					forwardPath="redirect:guest_main.do";
				}else {
					String guest_name=request.getParameter("guest_name");
					String guest_email=request.getParameter("guest_email");
					String guest_homepage=request.getParameter("guest_homepage");
					String guest_title=request.getParameter("guest_title");
					String guest_content=request.getParameter("guest_content");
					Guest insertGuest=
					new Guest(0,guest_name,null,guest_email,guest_homepage,guest_title,guest_content);
					int insertRowCount=guestService.insert(insertGuest);
					forwardPath="redirect:guest_list.do";
				}
			}catch (Exception e) {
				e.printStackTrace();
				forwardPath="forward:/WEB-INF/views/guest_error.jsp";
			}
			/*****************************************************/
		}else if(command.equals("/guest_modify_form.do")) {
			/******************guest_modify_form.do****************/
			try {
				
				if(request.getMethod().equalsIgnoreCase("GET")){
					//response.sendRedirect("guest_main.do");
					forwardPath="redirect:guest_main.do";
				}else {
					String guest_noStr=request.getParameter("guest_no");
					Guest guest=
							guestService.findByNo(Integer.parseInt(guest_noStr));
					request.setAttribute("guest",guest);
					forwardPath = "forward:/WEB-INF/views/guest_modify_form.jsp";
				}
			}catch (Exception e) {
				e.printStackTrace();
				forwardPath="forward:/WEB-INF/views/guest_error.jsp";
			}
			/*****************************************************/
		}else if(command.equals("/guest_modify_action.do")) {
			/******************guest_modify_action.do****************/
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
			/*********************************************************/
		}else if(command.equals("/guest_remove_action.do")) {
			/******************guest_remove_action.do****************/
			try {
				if (request.getMethod().equalsIgnoreCase("GET")) {
					forwardPath="redirect:guest_main.do";
				}else {
					String guest_noStr = request.getParameter("guest_no");
					int deleteRowCount = guestService.delete(Integer.parseInt(guest_noStr));
					forwardPath="redirect:guest_list.do";
				}
			}catch (Exception e) {
				e.printStackTrace();
				forwardPath="forward:/WEB-INF/views/guest_error.jsp";
			}
			/*********************************************************/
		}else{
			forwardPath="forward:/WEB-INF/views/guest_error.jsp";
		}
		
		/*
		 * 3.DispatcherServlet이 forwardPath를 사용해서 forward 혹은 redirect를 한다.
		 */
		
		
		/************forward or redirect*************/
		/*
		 * forward ---> forward:/WEB-INF/views/guest_xxx.jsp
		 * redirect---> redirect:guest_xxx.do
		 */
		String[] pathArray = forwardPath.split(":");
		String forwardOrRedirect=pathArray[0];
		String path=pathArray[1];
		if(forwardOrRedirect.equals("redirect")) {
			//redirect
			response.sendRedirect(path);
		}else {
			//forwarding
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		}
		/*****************************************/
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
