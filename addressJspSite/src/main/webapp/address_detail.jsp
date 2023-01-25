<%@page import="com.itwill.address.Address"%>
<%@page import="com.itwill.address.AddressService"%>
<%@page import = "java.lang.Integer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
 * 요청URL
 *   http://localhost/addressSite/address_detail.do?no=1
 *   http://localhost/addressSite/address_detail.do?no=2
 *   http://localhost/addressSite/address_detail.do?no=3
 *   http://localhost/addressSite/address_detail.do?no=4
 *   http://localhost/addressSite/address_detail.do?no=5
 */
/*
 * 0.요청객체encoding설정
 * 1.파라메타받기
 * 2.AddressService객체생성
 * 3.AddressService객체 selectByNo(1) 메쏘드호출
 * 4.Address객체 출력
 */
 
 request.setCharacterEncoding("UTF-8");
	String noStr = request.getParameter("no");
	if(noStr==null || noStr.equals("")) {
		response.sendRedirect("address_list.jsp");
		return;
	}
	AddressService addressService = new AddressService();
	Address address = addressService.findByNo(Integer.parseInt(noStr));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>주소록 상세보기</title>
</head>
<body>
<h1>[<%=address.getName()%>님 주소록 상세보기]</h1><hr>
<div>
	<a href='address_main.jsp'>[메인]</a>
	<a href='address_insert_form.jsp'>[주소록 쓰기 폼]</a>
	<a href='address_list.jsp'>[주소록 리스트]</a>
	
	<form action="address_update_form.jsp" method="post" style="display:inline;">
		<input type="hidden" name="no" value="<%=address.getNo()%>">
		<input type="submit" value="<%=address.getName()%>님 주소록 수정 폼 [POST]">	
	</form> 
	
	<form action='address_delete_action.jsp' method='post' style='display:inline;'>
		<input type='hidden' name='no' value='<%=address.getNo()%>'>
		<input type='submit' value='<%=address.getName()%>님 삭제 [POST]'>
	</form>
</div>
<p>
	번호 : <%=address.getNo()%><br>
	이름 : <%=address.getName()%><br>
	전화 : <%=address.getPhone()%><br>
	주소 : <%=address.getAddress()%><br>
</p>
</body>
</html>