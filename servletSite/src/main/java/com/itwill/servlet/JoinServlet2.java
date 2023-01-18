package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinServlet2
 */
@WebServlet("/join2.do")
public class JoinServlet2 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("05-03.form2.html");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");

		/*
		 * 1.�Ķ��Ÿ�ޱ�
		 */
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String gender = request.getParameter("gender");
		String job = request.getParameter("job");
		String[] hobbies = request.getParameterValues("hobby");
		
		
		/*
		 * 2.Service��ü ���Ը޽��ȣ��
		 */

		/*
		 * 3.Ŭ���̾�Ʈ�� ���� ���
		 */
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Insert title here</title>");
		out.println("<style type='text/css'>");
		out.println("table{");
		out.println("width: 500px;");
		out.println("margin: 10px auto 0px auto;");
		out.println("}");
		out.println("td, tr, th {");
		out.println("	border: 1px solid black;");
		out.println("}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		if(!repass.equals(pass)) {
			out.println("<h3>" + id + "�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�</h3><hr>");
			out.println("<a href = '05-03.form2.html'>�ٽ� ȸ������</a>");
			return;
		}
		out.println("	<h3 align='center'>�����������</h3>");
		out.println("<table width='50%'>");
		out.println("		<tr>");
		out.println("			<th width='30%'>�׸�</th>");
		out.println("			<th width='50%'>�Է°�</th>");
		out.println("			<th width='20%' >���</th>");
		out.println("		</tr>");
		out.println("		<tr>");
		out.println("			<td>���̵�</td>");
		out.println("			<td>"+id+"</td>");
		if(hobbies != null) {
			out.println("			<td rowspan="+ hobbies.length+6 +"></td>");
		}else {
			out.println("			<td rowspan='7'></td>");
		}
		out.println("		</tr>");
		out.println("		<tr>");
		out.println("			<td>�о�����</td>");
		out.println("			<td>"+pass+"/td>");
		out.println("		</tr>");
		out.println("		<tr>");
		out.println("			<td>�̸�</td>");
		out.println("			<td>"+name+"</td>");
		out.println("		</tr>");
		out.println("		<tr>");
		out.println("			<td>�ּ�</td>");
		out.println("			<td>"+addr+"</td>");
		out.println("		</tr>");
		out.println("		<tr>");
		out.println("			<td>����</td>");
		out.println("			<td>"+gender+"</td>");
		out.println("		</tr>");
		out.println("		<tr>");
		out.println("			<td>����</td>");
		out.println("			<td>"+job+"</td>");
		out.println("		</tr>");
		out.println("		<tr>");	
		if(hobbies!=null) {
			out.println("			<td rowspan="+hobbies.length+">���</td>");
			for(String hobby : hobbies) {
				out.println("<td>"+hobby+"</td>");
				out.println("		</tr>");
			}
		}else {
			out.println("			<td rowspan='1'>���</td>");
			out.println("<td>��̾���</td>");
		}
		out.println("	</table>");
		out.println("</body>");
		out.println("</html>");

		
	}

}
