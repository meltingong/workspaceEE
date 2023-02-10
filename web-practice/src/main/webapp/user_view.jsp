<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>     
<%
	UserService userService=new UserService();
	User user = userService.findUser(sUserId);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Tiffany&coding</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<script type="text/javascript">

	function userOrderList(){
		document.f.action = "order_list.jsp";
		document.f.method = "POST";
		document.f.submit();
	}
	
	function userModify() {
		document.f.action = "user_modify_form.jsp";
		document.f.method = "POST";
		document.f.submit();
	}
	function userRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			document.f.action = "user_remove_action.jsp";
			document.f.method='POST';
			document.f.submit();
		}
	}
</script>
<!-- mouse effect start -->
	<jsp:include page="include_mouseffect.jsp"/>
	<!-- mouse effect end -->
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
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0 style="">
					<tr>
						<td>
							<!--contents--> <br />
							<table style="height:200px; font-size: 30px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="#FFFFFF" height="50">&nbsp;&nbsp;<b>내 정보</b></td>
								</tr>
							</table> 
							<!-- view Form  -->
							<form name="f" method="post" style="padding-left: 300px; padding-right: 300px; ">
								<table border="solid 1px"  cellpadding="10" cellspacing="0" width="400" bgcolor='#FFFFFF' style=" border-color: #FFFFFF">
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">아이디</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getUserId()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">이름</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getName()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">이메일</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getEmail()%>
										</td>
									</tr>
										<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">휴대폰 번호</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getPhone()%>
										</td>
									</tr>
										<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">주소</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10">
											<%=user.getAddress()%>
										</td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center height="150">
									<input type="button" value="주문내역" onClick="userOrderList()">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  
									<input type="button" value="내정보수정" onClick="userModify()">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  
									<input type="button" value="탈퇴" onClick="userRemove()">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
