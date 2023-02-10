
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	boolean isDuplicate = false;
	String msg = "";
	String userId = request.getParameter("userId");
	int checked=0;
	
	if (userId == null || userId.equals("")){
		// 최초로 팝업창 띄울 때
		userId = "";
		msg = "";
		isDuplicate = true;
		
	} else {
		User user = new User();
		user.setUserId(userId);
		UserService userService = new UserService();
		
		isDuplicate = userService.isDuplicateId(userId);
		checked =userService.createUserIdDetail(user);
		if(isDuplicate){
			msg = "중복된 아이디입니다.";
		}
		else{
			msg = "사용 가능한 아이디입니다.";
			
		}
		if(checked==2) {
			msg="아이디는 영문+숫자 4~10자 이하여야 합니다.";
			
		}
		
		
	}
	
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<title>아이디 중복 체크</title>

<style type="text/css">
#wrap {
	width: 100%;
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}

#cancelBtn {
	visibility: visible;
}

#useBtn {
	visibility: visible;
}
</style>

<script type="text/javascript">

// 아이디 중복체크
function idCheck() {
	var userId = document.getElementById("userId").value;
	if (userId == null || userId == '') {
		alert('아이디를 입력하세요.');
		return;
	}
	document.getElementById('checkForm').action = 'user_id_check_form.jsp';
	document.getElementById('checkForm').method = 'POST';
	document.getElementById('checkForm').submit();
}

// 사용하기 클릭 시 부모창으로 값 전달 
function sendCheckValue() {
	// 중복체크 결과인 idCheck 값을 전달한다.
	// 회원가입 화면의 ID입력란에 값을 전달
	opener.document.f.userId.value = window.document.getElementById('userId').value;
	window.close();
}
</script>

</head>
<body>
	<div id="wrap">
		<br> <b><font size="3" color="gray">아이디 중복 확인</font></b>
		<p></p>
		<hr size="0.5" style="margin: 0 0 0 0"  >
		<div id="chk" style="margin-top: 30px">
		<p></p>
		<p></p>
			<form id="checkForm" style="display: inline;">
				<input type="text" name="userId" id="userId" width="30px" value="<%=userId%>"> 
				<input type="button" value="중복확인" onclick="idCheck()" style="font-size: 7pt">
			</form>
			<p></p>
			<p></p>
			<p></p>
			<%if(!isDuplicate && checked!=2){ %>
				<div id="msg" style="font-size: 8pt;margin:20px;text-align: center;color:black;font-weight: bold"><%=msg %></div>
				<input id="useBtn" type="button" value="사용"  style="font-size: 8pt" onclick="sendCheckValue()">
			<%}else{ %>
				<div id="msg" style="font-size: 8pt;margin:20px;text-align: center;color:red;font-weight: bold"><%=msg %></div>
				<input id="useBtn"  type="button" disabled="disabled" value="사용"  style="font-size: 10pt;" onclick="sendCheckValue()" >
			<%} %>
			
				&nbsp;&nbsp;&nbsp;
				<input id="cancelBtn" type="button" value="취소"  style="font-size: 10pt" onclick="window.close();"> 
		</div>
	</div>
</body>
</html>