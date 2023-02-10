<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>  
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("shop_main.jsp");
		return;
	}
	UserService userService=new UserService();
	User user=userService.findUser(sUserId);
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
	function userModifyAction() {
		if (f.password.value == "") {
			alert("비밀번호를 입력하십시요.");
			f.password.focus();
			return false;
		}
		if (f.password2.value == "") {
			alert("비밀번호확인을 입력하십시요.");
			f.password2.focus();
			return false;
		}
		if (f.name.value == "") {
			alert("이름을 입력하십시요.");
			f.name.focus();
			return false;
		}
		if (f.email.value == "") {
			alert("이메일을 입력하십시요.");
			f.email.focus();
			return false;
		}
		if (f.phone.value == "") {
			alert("휴대폰 번호를 입력하십시요.");
			f.email.focus();
			return false;
		}if (f.address.value == "") {
			alert("주소를 입력하십시요.");
			f.email.focus();
			return false;
		}
		if (f.password.value != f.password2.value) {
			alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
			f.password.focus();
			f.password.select();
			return false;
		}
		document.f.action = "user_modify_action.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	
	function userModifyCancel() {
		document.f.action = 'user_view.jsp';
		document.f.submit();
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

				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px; height:200px; font-size: 30px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="#FFFFFF" height="50">&nbsp;&nbsp;<b>내 정보 수정</b></td>
								</tr>
							</table>  
							<!-- update Form  -->
							<form name="f" method="post" style="padding-left: 300px; padding-right: 300px; ">
								<table border="solid 1px"  cellpadding="10" cellspacing="0" width="400" bgcolor='#FFFFFF' style=" border-color: #FFFFFF">
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">아이디</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=user.getUserId()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">비밀번호</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="password" style="width: 100% ;height: 100%" name="password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">비밀번호 확인</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="password" style="width: 100% ;height: 100%" name="password2" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">이름</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 100% ;height: 100%" name="name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white'height="22">이메일</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 100% ;height: 100%" name="email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white'height="22">휴대폰 번호</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 100% ;height: 100%" name="phone" value="<%=user.getPhone()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">주소</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 100% ;height: 100%" name="address" value="<%=user.getAddress()%>"></td>
									</tr>
								</table>
							</form> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center height='150'>
									<input type="button" value="수정완료" onClick="userModifyAction();">  &nbsp;&nbsp;&nbsp; 
									<input type="button" value="취소" onClick="userModifyCancel()"></td>
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
