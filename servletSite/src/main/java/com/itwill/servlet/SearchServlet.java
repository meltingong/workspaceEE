package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search.do")
public class SearchServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		/*
		 * Ŭ���̾�Ʈ ��û URL
		 * http://192.168.15.9/servletSite/search.do?searchkeyword=java
		 * http://192.168.15.9/servletSite/search.do?searchkeyword=
		 * http://192.168.15.9/servletSite/search.do
		 */
		
		/*
		 * 1.��û��ü������ؼ� ��û�� ���۵Ǵ� ������Ʈ���� �ִ� �Ķ��Ÿ�ޱ�
		 *    - �Ķ��Ÿ�̸��� input element�� name�Ӽ�����ġ
		 *       <input type="text" name="searchkeyword">
		 *    - search.do?searchkeyword=java   
		 */
		
		String searchkeyword = request.getParameter("searchkeyword");
		if(searchkeyword == null || searchkeyword.equals("")) {
			/*
			 * searchkeyword�� emtyString�� ��� ==> search.do?searchkeyword=
			 * searchkeyword�� null�� ��� 		 ==> search.do
			 */
			out.println("�˻�� �Է����� ���� ��� ����ִ� ���� ����� �����ϰ� �����帳�ϴ�.<br>");
			out.println("<a href = '05-00.search_form.html'>�˻�������</a>");
			return;
		}
		
		/*
		 * 2. �˻��������� --> Service��ü ���
		 */
		
		/*
		 * 3. Ŭ���̾�Ʈ�� �˻��������(HTML)
		 */
		out.println("<h1>"+ searchkeyword +"�˻����</h1>");
		out.println("<ol>");
		int searchResultNo = (int)(Math.random()*10);
		for(int i =0; i < searchResultNo; i++) {
			out.println("<li>"+ searchkeyword+" �˻����</li>");
		}
		out.println("</ol>");
		out.println("<a href=\"05-00.search_form.html\">�˻�������</a>");
	}

}