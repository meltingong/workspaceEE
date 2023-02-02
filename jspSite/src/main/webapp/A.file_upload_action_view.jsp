<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <h1> upload date view</h1> <hr>
<xmp>
<%
	InputStream in = request.getInputStream();
	while(true){
		int readByte = in.read();
		if(readByte == -1)break;
		out.write(readByte);
	}
	out.flush();
	
%>
</xmp>