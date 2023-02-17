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
	 * Controller 객체를 저장할 Map
	 */
	private Map<String,Controller> handlerMapping;
	
	
	@Override
		public void init(ServletConfig config) throws ServletException {
			super.init(config);
			handlerMapping = new HashMap<String,Controller>();
			
			//String configFile = "/WEB-INF/guest_controller_mapping.properties";
			String configFile = config.getInitParameter("configFile");
			
			String siteRootRealPath = this.getServletContext().getRealPath("/");
			String configFilePath = siteRootRealPath+configFile;
			
			try {
				/*
				 설정파일(guest_controller_mapping.properties)을 읽어서 Properties객체생성
				 */
				InputStream fis = new FileInputStream(configFilePath);
				Properties controllerMappingProperties = new Properties();
				controllerMappingProperties.load(fis);
				System.out.println(">>:"+controllerMappingProperties);
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
				Set commandKeySet = controllerMappingProperties.keySet();
				Iterator<String> commandKeyIterator = commandKeySet.iterator();
				System.out.println("---------설정파일["+configFile+"]을 이용해서 handlerMapping객체 생성--------");
				while(commandKeyIterator.hasNext()) {
					String command = commandKeyIterator.next();
					String controllerClassName = controllerMappingProperties.getProperty(command);
					/*
					 * Controller 클래스이름을 사용해서 Controller객체 생성
					 * 	1. Controller클래스 이름을 사용해서 클래스를 메모리에 로딩
					 * 	2. 메모리에 로딩된 클래스의 기본생성자를 호출해서 객체 생성
					 */
					Class controllerClass = Class.forName(controllerClassName);
					Controller controllerObject =(Controller)controllerClass.newInstance(); //기본생성자 호출
					handlerMapping.put(command, controllerObject);
					System.out.println(command+"="+controllerObject);
					
				}
				System.out.println("--------------------------------------------------------");
			} catch (Exception e) {
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
			/********************직접생성***************************
			handlerMapping.put("/guest_main.do", new GuestMainController());
			handlerMapping.put("/guest_list.do", new GuestListController());
			handlerMapping.put("/guest_view.do", new GuestViewController());
			handlerMapping.put("/guest_write_form.do", new GuestWriteFormController());
			handlerMapping.put("/guest_write_action.do", new GuestWriteActionController());
			handlerMapping.put("/guest_modify_form.do", new GuestModifyFormController());
			handlerMapping.put("/guest_modify_action.do", new GuestModifyActionController());
			handlerMapping.put("/guest_remove_action.do", new GuestRemoveActionController());
			handlerMapping.put("/guest_error.do", new GuestErrorController());
			System.out.println(">>init:" + handlerMapping);
			***********************************************************/
		} 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
	
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command = requestURI.substring(contextPath.length());
	
		
		Controller controller=handlerMapping.get(command);
		
	
		String forwardPath=controller.handleRequest(request, response);
	
		String[] pathArray = forwardPath.split(":");
	
		String forwardOrRedirect=pathArray[0];
		String path=pathArray[1];
		if(forwardOrRedirect.equals("redirect")) {
			response.sendRedirect(path);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		}
	
		
		
	}
	

}
