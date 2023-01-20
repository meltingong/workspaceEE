<%@page import="com.itwill.address.Address"%>
<%@page import="com.itwill.address.AddressService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
GET방식요청인경우에는 address_main.jsp로 redirection
 
  0.요청객체인코딩설정 
  1.파라메타받기(no) 
  2.AddressService객체생성 
  3.받은파라메타로 AddressService.selectByNo()메쏘드실행 
  4.반환받은 Address객체를 사용해서 클라이언트로 응답(수정폼 보여주기)
 */
 
 
%>    




    
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
</head>
<body>


<h1>[박경호 님 주소록상세보기]</h1><hr>
<div>
	<a href='address_main.jsp'>[메인]</a>
	<a href='address_insert_form.jsp'>[주소록쓰기폼]</a>
	<a href='address_list.jsp'>[주소록리스트]</a>
	
	<form action="address_update_form.jsp" method="post" style="display: inline;">
		<input type="hidden" name="no" value="11">
		<input type="submit" value="박경호님 주소록수정폼[POST]">	
	</form> 
	
	<form action='address_delete_action.jsp' method='post' style='display:inline;'>
		<input type='hidden' name='no' value='11'>
		<input type='submit' value='박경호님삭제[POST]'>
	</form>
</div>
<p>
	번호:11<br>
	이름:박경호<br>
	전화:123-4568<br>
	주소:경기도 구리시<br>
</p>
</body>
</html>

