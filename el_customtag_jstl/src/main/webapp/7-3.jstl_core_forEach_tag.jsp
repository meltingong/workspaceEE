<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.bean.Guest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Guest g1=new Guest(1,"KIM","2020","guard1@gmail.com","http://www.naver.com","타이틀1","콘텐트1");
	Guest g2=new Guest(2,"SIM","2021","guard2@gmail.com","http://www.oaver.com","타이틀2","콘텐트2");
	Guest g3=new Guest(3,"DIM","2022","guard3@gmail.com","http://www.paver.com","타이틀3","콘텐트3");
	
	ArrayList<Guest> guestList=new ArrayList<Guest>();
	guestList.add(g1);
	guestList.add(g2);
	guestList.add(g3);
	
	HashMap<String,Guest> guestMap=new HashMap<String,Guest>();
	guestMap.put("g1", g1);
	guestMap.put("g2", g2);
	guestMap.put("g3", g3);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL core forEach tag</h1>
	<hr>
	<pre>
&lt;c:foreach items="&dollar;{guestList}" var="guest" varStatus="status"&gt;

	◆ var 		:forEach문안에서 사용할 EL 변수명	[var="guest"]
	◆ items 	:Collection 객체(List, Map)속성이름	[items="&dollar;{guestList}"] 
	◆ begin 	:반복 시작 index                 	[begin="0"]
	◆ end 		:반복 종료 마지막 index          	[end="10"]
	◆ step  	:반복할 때마다 건너뛸 index 개수 	[step="2"]
	◆ varStatus 	:반복 상태를 알 수 있는 변수명     	[varStatus="status"]
		→ &dollar;{status.current} 현재 for문의 해당하는 번호의 객체 var과동일
		→ &dollar;{status.index} 0부터의 순서
		→ &dollar;{status.count} 1부터의 순서
		→ &dollar;{status.first} 첫 번째인지 여부
		→ &dollar;{status.last} 마지막인지 여부
		→ &dollar;{status.begin} for문의 시작 번호
		→ &dollar;{status.end} for문의 끝 번호
		→ &dollar;{status.step} for문의 증가값
&lt;/c:forEach&gt;
	</pre>
	
	<ul>
		<li>-------ArrayList[배열]-------</li>
		<%
			for(Guest guest:guestList){ 
				pageContext.setAttribute("guest", guest);
		%>
			
			<li>${guest}</li>
			
		<%}%>
		<li>###############################</li>
		<c:forEach items="${guestList}" var="guest">
			<li>[${guest.guest_no}] ${guest.guest_name},${guest.guest_email}</li>
		</c:forEach>
		<li>---------------Map--------------</li>
		<c:forEach items="${guestMap}" var="guestEntry">
		<!-- Map.Entry 객체는 getKey(),getValue()메쏘드를가짐 -->
			<li>${guestEntry.key} = ${guestEntry.value}-->
			${guestEntry.value.guest_no},${guestEntry.value.guest_name}
			</li>
		</c:forEach>
		
	</ul>
</body>
</html>








