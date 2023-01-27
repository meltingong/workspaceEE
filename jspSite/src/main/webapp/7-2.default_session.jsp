<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         session="true"
         %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>기본객체[session(HttpSession)]</h1>
<hr/>
<ol>
	<li> &lt;%@ page session="true"%&gt; (HttpSession session=request.getSession();)</li>
	<li> &lt;%@ page session="false"%&gt;(session ref사용불가)</li>
</ol>
<% 
/*
     <<요청시 JESSIONID쿠키존재안할때>>
         1.JESSIONID쿠키존재여부판단후 JESSIONID쿠키존재하지않으면
            세션아이디 발행후 HttpSession 객체를 생성한후 세션아이디를설정반환
         2.HttpSession객체사용  
         3.JESSIONID이름의 session쿠키객체를 생성한후 응답객체에 추가 
     
      <<요청시 JESSIONID쿠키존재할때>> 
         1.JESSIONID쿠키존재여부판단후 JESSIONID쿠키존재하면
           	JSESSIONID쿠키의 값(세션아이디)을 사용해서 서버에존재하는
            HttpSession객체중에서  세션아이값과 일치하는 HttpSession객체반환(세션바인딩) 
         2.HttpSession객체사용
*/            
%>
</body>
</html>
