<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.bean.Guest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>EL Collection(배열,List),Map 출력</h1><hr/>
<ul>
	<li>---------List(배열)---------------</li>
	<li>${guestList}</li>
	<li>${guestList[0]}</li>
	<li>${guestList[0].guest_no}</li>
	<li>${guestList[0].guest_name}</li>
	<li>${guestList[1]}</li>
	<li>${guestList[1].guest_no}</li>
	<li>${guestList[1].guest_name}</li>
	<li>${guestList[2]}</li>
	<li>${guestList[2].guest_no}</li>
	<li>${guestList[2].guest_name}</li>
	<li>-------------for문----------------</li>
	<%
	for(int i=0;i<3;i++){
		pageContext.setAttribute("i", i);
	%>
		<li>${guestList[i]}</li>
		<li>${guestList[i].guest_no}</li>
		<li>${guestList[i].guest_name}</li>
	<%}%>
	<li>-------------Map------------------</li>
	<li>${guestMap}</li>	
	<li>${guestMap['g1']}</li>	
	<li>${guestMap['g1'].guest_no}</li>	
	<li>${guestMap['g1'].guest_name}</li>	
	<li>${guestMap['g1'].guest_email}</li>	
	
	<li>${guestMap.g2}</li>	
	<li>${guestMap.g2.guest_no}</li>	
	<li>${guestMap.g2.guest_name}</li>	
	<li>${guestMap.g2.guest_email}</li>	
	
	<li>${guestMap.g3}</li>	
	<li>${guestMap.g3.guest_no}</li>	
	<li>${guestMap.g3.guest_name}</li>	
	<li>${guestMap.g3.guest_email}</li>	
	
</ul>
</body>
</html>













