package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//#1. javax.servlet.http.HttpServlet Ŭ������ ��� �޾ƾ��Ѵ�.
public class HelloTextServlet extends HttpServlet {
	//#2. HttpServlet service �޼ҵ带 �������̵� �ؾ��Ѵ�.(��û�� ����)
	@Override
	protected void service(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
				//#2-1.  Ŭ���̾�Ʈ�� ������ ����Ÿ�� Ÿ��(����)����
				response.setContentType("text/plain;charset=UTF-8");
				//#2-2.  Ŭ���̾�Ʈ������Ÿ�� �����ϱ����� ��½�Ʈ�� ����
				PrintWriter out = response.getWriter();
				//#2-3. Ŭ���̾�Ʈ�� ����Ÿ(text) ����
				
				int no = (int)(Math.random()*50);
				
				for(int i = 0; i < no; i++) {
					
					out.println("Hello text[dynamic resource] "+(i+1)+"!!!");
				}
				return;
				
				
	}
}
