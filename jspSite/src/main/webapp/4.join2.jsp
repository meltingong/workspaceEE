<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
<style type='text/css'>
table{
	width: 500px;
	margin: 10px auto 0px auto;
}
td, tr, th {
	border: 1px solid black;
}
</style>
</head>
<body>
	<h3 align='center'>가입정보결과</h3>

	<table width='50%'>
		<tr>
			<th width='30%'>항목</th>
			<th width='50%'>입력값</th>
			<th width='20%' >비고</th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>guard884</td>
			<td rowspan="10"></td>
		</tr>
		<tr>
			<td>패쓰워드</td>
			<td>1234</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>김경호</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>역삼동</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>남</td>
		</tr>
		<tr>
			<td>직업</td>
			<td>회사원</td>
		</tr>
		<tr>
			<td rowspan='3'>취미</td>
			<td>낮잠</td>
		</tr>
		<tr>
			<td>운동</td>
		</tr>
		<tr>
			<td>기타</td>
		</tr>
	</table>

</body>
</html>
