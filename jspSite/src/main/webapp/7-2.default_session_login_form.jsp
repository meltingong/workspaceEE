<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 인증</title>
</head>

<body>

<hr/>
<!-- 
form tag
 - 요청시 전송되는 데이타를 묶어주는 단위
 - form 안에 있는 데이타들은 요청시 쿼리스트링으로 만들어져서 서버로 전송된다.
    ex> id=guard&pass=1234
 - action:요청할 URL(서블릿URL)
 - method:요청방법(GET or POST)
 -->
<h3 align="center">◆◆◆ 회원 로그인[session] ◆◆◆</h3>
<form  method="post" style="width: 300px;margin:0 auto 0 auto">
	아이디&nbsp;&nbsp;&nbsp; <input type="text" name="id"><br/>
	패쓰워드 <input type="password" name="pass"><br/><br/>
	<!-- 
		<< submit button >>
			- form안에 존재해야하며
			- submit 버튼클릭시에 자기가 속해있는 폼의 데이타모두를 쿼리스트링형태로변경해서 
			- form method속성에 기술된방식[POST]으로 action속성의URI로 요청한다.
		 	
		POST방식의 데이타전송
		  - form에입력된 데이타를 query string으로만든다.[id=guard&pass=1234]
		  - 요청라인,요청헤더,요청바디전송시에 query string(form data)을전송한다
	
		ex> http://localhost/servletSite/4.login_post_result.jsp
			 
	 -->
	<input type="submit" value="로그인">
	<input type="reset" value="취소">
</form>
</body>
</html>

