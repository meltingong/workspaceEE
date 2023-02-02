<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("A.file_upload_form.jsp");
		return;
	}
	/*
	file upload component사용
	public MultipartRequest(javax.servlet.http.HttpServletRequest request,
            java.lang.String saveDirectory,
            int maxPostSize,
            java.lang.String encoding)
     throws java.io.IOException
	*/
	String saveDirectory = application.getRealPath("/WEB-INF/upload");
	int maxPostSize = 1024*1024*100;
	String encoding = "UTF-8";
	/*
	- DefaultFileRenamePolicy : 똑같은 이름을가진파일이 존재한다면 파일명(숫자) 1,2,3..를 붙여서 저장해주는 클래스
	- FileRenamePolicy        : 똑같은 이름을가진파일이 존재한다면 사용자가 만든이름을 적용시킬수있게해주는 클래스
	*/
	DefaultFileRenamePolicy defaultFileRenamePolicy = new DefaultFileRenamePolicy();
	MultipartRequest multipartRequest = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,defaultFileRenamePolicy);
	
	
%>
<h1>Upload Data</h1>
<hr/>
<br/>
<br/>
<br/>
<li>application.getRealPath(""): <%=application.getRealPath("")%></li>
<li>name:<%=multipartRequest.getParameter("name") %></li>
<li>fileone:<%=multipartRequest.getFilesystemName("fileone") %></li>
<li>filetwo:<%=multipartRequest.getFilesystemName("filetwo") %></li>
