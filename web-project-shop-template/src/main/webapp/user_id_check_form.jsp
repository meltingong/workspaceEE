<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>

<style type="text/css">
#wrap {
	width: 250px;
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
		
		
	}

	// 사용하기 클릭 시 부모창으로 값 전달 
	function sendCheckValue() {
		// 중복체크 결과인 idCheck 값을 전달한다.
		// 회원가입 화면의 ID입력란에 값을 전달
		
	}
</script>

</head>
<body>
	<div id="wrap">
		<br> <b><font size="3" color="gray">아이디 중복체크</font></b>
		<hr size="0.5" style="margin: 0 0 0 0"  >
		<div id="chk" style="margin-top: 10px">
			<form id="checkForm" style="display: inline;">
				<input type="text" name="userId" id="userId" value=""> <input
					type="button" value="중복확인"  style="font-size: 7pt">
			</form>
			
				<div id="msg" style="font-size: 7pt;margin:7px;text-align: left;color:red;font-weight: bold"></div>
				<input id="useBtn"  type="button" disabled="disabled" value="사용"  style="font-size: 7pt;" onclick="sendCheckValue()" >
			
				<input id="cancelBtn" type="button" value="취소"  style="font-size: 7pt" onclick="window.close();"> 
		</div>
	</div>
</body>
</html>