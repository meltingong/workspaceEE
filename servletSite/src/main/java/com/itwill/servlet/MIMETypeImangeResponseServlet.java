package com.itwill.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.stream.ImageInputStream;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MIMETypeImangeResponseServlet
 */
@WebServlet("/responseimage.do")
public class MIMETypeImangeResponseServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 응답객체MIME타입설정
		 */
		response.setContentType("image/jpeg");
		//response.setContentType("image/gif");
		/*
		 * 2. 브라우져와 연결된 출력스트림
		 */
		OutputStream out = response.getOutputStream();
		ServletContext context = this.getServletContext();
		String imageFilePath = context.getRealPath("/images/album.jpg");
		FileInputStream imageFileIn = new FileInputStream(imageFilePath);
		
		while(true) {
			int readByte = imageFileIn.read();
			if(readByte == -1) break;
			out.write(readByte);
		}
		imageFileIn.close();
		out.close();
	}

}
