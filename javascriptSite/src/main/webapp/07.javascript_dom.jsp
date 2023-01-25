<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function access_form() {

	}
	function access_div() {

	}
	var count = 0;
	function access_img() {

	}
	function form_display() {

	}
</script>

</head>
<body>
	<h1 onmouseover="form_display();">javascript dom[document object
		model]</h1>
	<hr>
	<form action="" name='f' id='f'>
		아이디:<input type="text" name="id" id="id"><br> 이 름:<input
			type="text" name="irum" id="irum"><br>
	</form>
	<div id="div1">div1 content</div>
	<div>
		<img id="img1" width="100" height="100" src='penguin1.gif' /> <span
			id="span1">span1 content</span>
	</div>

	<div>
		<input type="button" value="access form" onclick="access_form();">
		<input type="button" value="access div" onclick="access_div();">
		<input type="button" value="access img" onclick="access_img();">
		<input type="button" value="form display" onclick="form_display();">
	</div>

</body>
</html>