<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


%>    
<!DOCTYPE html>
<html>
<head>
<title>Tiffany&Co 회원가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function userCreate() {
		if (document.f.userId.value == "") {
			alert("사용자 아이디를 입력하십시요.");
			f.userId.focus();
			return false;
		}
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
			alert("이메일 주소를 입력하십시요.");
			f.email.focus();
			return false;
		}
		if (f.password.value != f.password2.value) {
			alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
			f.password.focus();
			f.password.select();
			return false;
		}
		
		if(!(document.f.password.value.length>=4 && document.f.password.value.length<=10)){
			alert("비밀번호는 4~10자여야합니다.");
			f.password.value.select();
			return;
		}
	
		for(let i=0;i<document.f.password.value.length;i++){
			if(!((document.f.password.value.charAt(i)>='0' && document.f.password.value.charAt(i)<='9')||
				(document.f.password.value.charAt(i)>='a' && document.f.password.value.charAt(i)<='z'))){
				alert("비밀번호는 영문+숫자 4~10자여야합니다.");
				document.f.password.value.select();
				return;
			}							
		}		
		
		alert("회원가입을 축하드립니다!");
		f.action = "user_write_action.jsp";
		f.method='POST';
		f.submit();
	}

	function shopMain() {
		f.action = "shop_main.jsp";
		f.submit();
	}
	
	/*
	아이디중복체크
	*/
	function openIdCheck(){
		var left = Math.ceil(( window.screen.width)/5);
		var top = Math.ceil(( window.screen.height)/5); 
		let idCheckWindow = window.open("user_id_check_form.jsp","checkForm","width=430,height=200,top="+top+",left="+left+",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
	}
	
	
</script>
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
				<table width=0 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table border=0 cellpadding=0 cellspacing=0 style="height:200px; font-size: 30px">
								<tr>
									<td bgcolor="#FFFFFF" height="50">&nbsp;&nbsp;<b>회원가입</b></td>
								</tr>
							</table> 
							<!-- write Form  -->
							<form name="f" method="post" style="padding-left: 200px; padding-right: 200px">
								<table border="solid 1px"  cellpadding="10" cellspacing="0" width="400" bgcolor='#FFFFFF' style=" border-color: #FFFFFF">
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">아이디</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input onclick='openIdCheck();' type="text" style="width:300px" name="userId" value="" readonly="readonly">&nbsp;&nbsp;
											<input onclick='openIdCheck();' type="button" value="아이디 중복 확인">&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">비밀번호</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="password" style="width: 100% ;height: 100%" name="password" value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">비밀번호 확인</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="password" style="width: 100% ;height: 100%" name="password2" value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">이름</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 100% ;height: 100%" name="name" value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">이메일</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 100% ;height: 100%" name="email" value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">휴대폰 번호</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 100% ;height: 100%" name="phone" value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">주소</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 100% ;height: 100%" name="address" value="">
										</td>
									</tr>
								</table>
							</form> <br />

							<table border=0 cellpadding=0 cellspacing=1 style=" margin-bottom: 100px;">
								<tr>
									<td align=center height="150">
									<input type="button" value="회원가입" onclick="userCreate();"> &nbsp;&nbsp;&nbsp; 
									<input type="button" value="취소" onClick="shopMain()"></td>
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
