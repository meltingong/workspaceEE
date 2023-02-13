<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
 * 0.요청객체encoding설정
 * 1.파라메타받기
 * 2.GuestService객체생성
 * 3.GuestService객체 selectByNo() 메쏘드호출
 * 4.Guest  출력
 */
 String guest_noStr = request.getParameter("guest_no");
 if(guest_noStr==null || guest_noStr.equals("")){
	 response.sendRedirect(request.getContextPath());
	 return;
 }
 Guest guest=null;
 try{
 	GuestService guestService=new GuestService();
 	guest = guestService.findByNo(Integer.parseInt(guest_noStr));
 	if(guest==null){
 		throw new NumberFormatException("guest가 null");
 	}
 }catch(NumberFormatException e){
	 e.printStackTrace();
	 /**********case1(redirect)*************
	 response.sendRedirect("guest_list.jsp");
	 *****************************/
	 /**********case2(scrip)*************/
	 out.println("<script>");
	 out.println("alert('존재하지않는 게시물입니다.');");
	 out.println("location.href='guest_list.do';");
	 out.println("</script>");
	 return;
 }catch(Exception e){
	 e.printStackTrace();
	 response.sendRedirect("guest_error.jsp");
 }
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>방명록 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/guest.css">

<script src="js/guest.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
								
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp"/>
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper content start -->
		<div id="wrapper">




			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>방명록 관리
											- 방명록 상세보기</b></td>
								</tr>
							</table> <!-- view Form  -->
							<form name="f" method="post">
								<input type="hidden" name="guest_no" value="<%=guest.getGuest_no()%>" />
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">번호</td>
										<td width=490 bgcolor="ffffff" align="left"
											style="padding-left: 10px"><%=guest.getGuest_no()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
										<td width=490 bgcolor="ffffff" align="left"
											style="padding-left: 10px"><%=guest.getGuest_name()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">날짜</td>
										<td width=490 bgcolor="ffffff" align="left"
											style="padding-left: 10px"><%=guest.getGuest_date()%></td>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">홈페이지</td>
										<td width=490 bgcolor="ffffff" align="left"
											style="padding-left: 10px"><%=guest.getGuest_homepage()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" align="left"
											style="padding-left: 10px"><%=guest.getGuest_title() %></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="110">내용</td>
										<td width=490 bgcolor="ffffff" align="left"
											style="padding-left: 10px"><%=guest.getGuest_content()
																			.replace("<","&lt;")
																			.replace(">","&gt;")
																			.replace("\n","<br>")%></td>
									</tr>
								</table>
							</form> <br />
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<input type="button" value="수정" onclick="guestModifyForm();"> &nbsp; 
										<input type="button" value="삭제" onclick="guestRemove();"> &nbsp; 
										<input type="button" value="목록" onclick="guestList()"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>


		</div>
		<!-- wrapper content end-->
		<!-- footer start-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>	
			<!-- include_common_bottom.jsp end-->
		</div>
		<!-- footer end -->
	</div>
	<!--container end-->
</body>
</html>
