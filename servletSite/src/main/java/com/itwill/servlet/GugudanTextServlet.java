package com.itwill.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GugudanTextServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		for(int i = 1; i <= 9; i++) {
			for(int j = 2; j <=9; j++) {
				if(j==9) {
				out.printf("%d*%d =%d\n",j,i,j*i);
				}else {
					out.printf("%d*%d =%d\t",j,i,j*i);
				}
			}
		}
	}

}
