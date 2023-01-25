<!-- 
	1.자동생성되는 서블릿파일(*.java)이생성되는위치
		-> C:\2022-11-JAVA-DEVELOPER\workspaceEE\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\jspSite\org\apache\jsp
	2.자동생성되는 서블릿파일의 이름
		-> _1_hello_jsp.java
 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%for(int i=0;i<10;i++){%>
		<h1>Hello JSP(change)<% out.print(i); %></h1><hr>
	<% }%>
	<hr/>
	<br>
<%@include file = "5-6.directive_included_file.jspf" %>
</body>
</html>
