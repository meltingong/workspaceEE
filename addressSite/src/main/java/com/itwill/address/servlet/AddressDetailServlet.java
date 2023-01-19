package com.itwill.address.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.address.Address;
import com.itwill.address.AddressService;

/**
 * Servlet implementation class AddressDetailServlet
 */
@WebServlet("/address_detail.do")
public class AddressDetailServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			/*
			 * 요청URL
			 *   http://localhost/addressSite/address_detail.do?no=1
			 *   http://localhost/addressSite/address_detail.do?no=2
			 *   http://localhost/addressSite/address_detail.do?no=3
			 *   http://localhost/addressSite/address_detail.do?no=4
			 *   http://localhost/addressSite/address_detail.do?no=5
			 */
			/*
			 * 0.요청객체encoding설정
			 * 1.파라메타받기
			 * 2.AddressService객체생성
			 * 3.AddressService객체 selectByNo(1) 메쏘드호출
			 * 4.Address객체 출력
			 */
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String noStr=request.getParameter("no");
			/*
			 null ==> http://localhost/addressSite/address_detail.do
			 ""   ==> http://localhost/addressSite/address_detail.do?no=
			 */
			if(noStr == null || noStr.equals("")) {
				response.sendRedirect("address_list.do");
			}
			AddressService addressService = new AddressService();
			Address address = addressService.findByNo(Integer.parseInt(noStr));
		
	
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset='UTF-8'>");
			out.println("<title>Insert title here</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>["+address.getName()+"님 주소록상세보기]</h1><hr>");
			out.println("<div>");
			out.println("	<a href='address_main.do'>[메인]</a>");
			out.println("	<a href='address_insert_form.do'>[주소록쓰기폼]</a>");
			out.println("	<a href='address_list.do'>[주소록리스트]</a>");
			out.println("	<form action='address_update_form.do' method='post' style='display:inline;'>");
			out.println("		<input type='hidden'   name='no' value='"+address.getNo()+"'>");
			out.println("		<input type='submit' value='"+address.getName()+"님 주소록수정폼[POST]'>");
			out.println("	</form>");
			out.println("	<form action='address_delete_action.do' method='post' style='display:inline;'>");
			out.println("		<input type='hidden'   name='no' value='"+address.getNo()+"'>");
			out.println("		<input type='submit' value='"+address.getName()+"님삭제[POST]'>");
			out.println("	</form>");
			out.println("</div>");
			out.println("<p>");
			out.println("	번호:"+address.getNo()+"<br>");
			out.println("	이름:"+address.getName()+"<br>");
			out.println("	전화:"+address.getPhone()+"<br>");
			out.println("	주소:"+address.getAddress()+"<br>");
			out.println("</p>");
			out.println("</body>");
			out.println("</html>");
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
