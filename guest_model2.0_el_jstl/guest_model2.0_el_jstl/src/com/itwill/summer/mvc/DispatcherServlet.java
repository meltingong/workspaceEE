package com.itwill.summer.mvc;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
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
	    <init-param>
	      <param-name>configFile</param-name>
	      <param-value>/WEB-INF/guest_controller_mapping.properties</param-value>
	    </init-param>
	    <load-on-startup>0</load-on-startup>
    </servlet>
 */

public class DispatcherServlet extends HttpServlet {
	/*
	 * Controller 객체를 저장할Map
	 */
	private Map<String, Controller> handlerMapping;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		handlerMapping=new HashMap<String, Controller>();
		/*
		<<web.xml에설정된 파일이름 파라메타값 가져오기>>
		<servlet>
		    <servlet-name>dispatcher</servlet-name>
		    <servlet-class>com.itwill.summer.mvc.DispatcherServlet</servlet-class>
		    <init-param>
		    	<param-name>configFile</param-name>
		    	<param-value>/WEB-INF/guest_controller_mapping.properties</param-value>
		    </init-param>
		    <load-on-startup>0</load-on-startup>
	  	</servlet>
		 */
		//String configFile = "/WEB-INF/guest_controller_mapping.properties";
		String configFile = config.getInitParameter("configFile");
		
		String siteRootRealPath = this.getServletContext().getRealPath("/");
		String configFilePath=siteRootRealPath+configFile;
		try {
			/*
			 설정파일(guest_controller_mapping.properties)을 읽어서 Properties객체생성
			 */
			InputStream fis=new FileInputStream(configFilePath);
			Properties controllerMappingProperties=new Properties();
			controllerMappingProperties.load(fis);
			
			/*
			 <<Properties객체>>
			 --------------------------------------------
			 |key(String)      |      value(String)     |
			 --------------------------------------------
			 |/guest_main.do   |com..GuestMainController|	
			  -------------------------------------------
			 |/guest_list.do   |com..GuestListController|		
			  -------------------------------------------
			 |/guest_view.do   |com..GuestViewController|		
			 --------------------------------------------	
			*/
			Set commandKeySet=controllerMappingProperties.keySet();
			Iterator<String> commandKeyIterator=  commandKeySet.iterator();
			System.out.println("---설정파일["+configFile+"]을이용해서 Controller객체생성---");
			while (commandKeyIterator.hasNext()) {
				String command = commandKeyIterator.next();
				String controllerClassName = controllerMappingProperties.getProperty(command);
				/*
				 * Controller클래스이름을 사용해서 Controller객체생성
				 *   1. Controller클래스 이름을 사용해서 클래스를 메모리에로딩
				 *   2. 메모리에로딩된 클래스의 기본생성자를 호출해서 객체생성
				 */
				Class controllerClass=Class.forName(controllerClassName);
				Controller controllerObject=(Controller)controllerClass.newInstance();
				handlerMapping.put(command, controllerObject);
				System.out.println(command+"="+controllerObject);
			}
			System.out.println("-------------------------------------------------------------------------");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		/*
		 << Map<String, Controller> handlerMapping>>
		 ------------------------------------------------
		 |key(String)      |      value(Controller객체) |
		 ------------------------------------------------
		 |/guest_main.do   |com..GuestMainController객체|	
		  -----------------------------------------------
		 |/guest_list.do   |com..GuestListController객체|		
		  -----------------------------------------------
		 |/guest_view.do   |com..GuestViewController객체|		
		 ------------------------------------------------
		 */
		/*********************************직접생성*********************
		handlerMapping.put("/guest_main.do", new GuestMainController());
		handlerMapping.put("/guest_list.do", new GuestListController());
		handlerMapping.put("/guest_view.do", new GuestViewController());
		handlerMapping.put("/guest_write_form.do", new GuestWriteFormController());
		handlerMapping.put("/guest_write_action.do", new GuestWriteActionController());
		handlerMapping.put("/guest_modify_form.do", new GuestModifyFormController());
		handlerMapping.put("/guest_modify_action.do", new GuestModifyActionController());
		handlerMapping.put("/guest_remove_action.do", new GuestRemoveActionController());
		handlerMapping.put("/guest_error.do", new GuestErrorController());
		System.out.println(">> init:"+handlerMapping);
		****************************************************************/
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
		 * 2-1.DispatcherServlet이 클라이언트요청에따른 업무실행할 Controller객체얻기
		 * 	<< handlerMapping객체로부터 요청command를 처리할Controller객체얻기 >>
		 */
		
		Controller controller=handlerMapping.get(command);
		/*
		 * 2-2.DispatcherServlet이 Controller객체의 handleRequest메쏘드 실행
		 * 2-3.DispatcherServlet이 Controller객체의 handleRequest메쏘드 실행반환값인 forwardPath를 받는다.
		 */
		String forwardPath=controller.handleRequest(request, response);
		/*
		 * 3.DispatcherServlet이 forwardPath를 사용해서 forward 혹은 redirect를 한다.
		 */
		/************forward or redirect*************/
		/*
		 * forward ---> forward:/WEB-INF/views/guest_xxx.jsp
		 * redirect---> redirect:guest_xxx.do
		 */
		String[] pathArray = forwardPath.split(":");
		/*
		  << pathArray >>
		  |----0---|-----------------1------------|
		  |forward |/WEB-INF/views/guest_main.jsp |
		  |--------|------------------------------|
		  
		  |----0---|-------1-----|
		  |redirect|guest_main.do|
		  |--------|-------------|
		 */
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
