package com.itwill.summer.mvc;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet {
   private Map<String,Controller> handlerMapping;
   
   @Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String configFile = config.getInitParameter("configFile");
		String siteRootRealPath = this.getServletContext().getRealPath("/");
		String configFilePath = siteRootRealPath+configFile;
		
		try {
			InputStream fis = new FileInputStream(configFilePath);
			Properties controllerMappingProperties = new Properties();
			controllerMappingProperties.load(fis);
			
			Set commandKeySet = controllerMappingProperties.keySet();
			Iterator<String> commandKeyIterator = commandKeySet.iterator();
			while(commandKeyIterator.hasNext()) {
				String command = commandKeyIterator.next();
				String controllerClassName = controllerMappingProperties.getProperty(command);
				
				Class controllerClass = Class.forName(controllerClassName);
				Controller controllerObject = (Controller)controllerClass.newInstance();
				handlerMapping.put(command, controllerObject);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1.DispatcherServlet이 클라이언트의 요청URI를 사용해서 요청분석
		 */
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		/*
		 * 2-1.DispatcherServlet이 클라이언트요청에따른 업무실행할 Controller객체얻기
		 * 	<< handlerMapping객체로부터 요청command를 처리할 Controller객체 얻기 >>
		 */
		Controller controller = handlerMapping.get(command);
		/*
		 * 2-2.DispatcherServlet이 Controller객체의 handleRequest메쏘드 실행
		 * 2-3.DispatcherServlet이 Controller객체의 handleRequest메쏘드 실행반환값인 forwardPath를 받는다.
		 */
		String forwardPath = controller.handleRequest(request, response);
		String[] pathArray = forwardPath.split(":");
		String forwardOrRedirect = pathArray[0];
		String path = pathArray[1];
		if(forwardOrRedirect.equals("redirect")) {
			response.sendRedirect(path);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		}
	}
}
