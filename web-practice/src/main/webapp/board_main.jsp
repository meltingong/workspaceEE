<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Tiffany&Co 게시판</title>
<link rel="stylesheet" href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<style type="text/css"></style>
<!-- mouse effect start -->
	<jsp:include page="include_mouseffect.jsp"/>
	<!-- mouse effect end -->
</head>
<body>
	<!-- container start -->
	<div id='container'>
		<!-- header start -->
		<div id='header'>
			<!-- include_common_top.jsp start -->
			<jsp:include page="include_common_top.jsp"/>
			<!-- include_common_top.jsp end -->
		</div>
		<!-- header end -->
	<!-- navigation start -->
	<div id='navigation'>
			<!-- include_common_left.jsp start -->
			<jsp:include page="include_common_board_menu.jsp"/>
			<!-- include_common_left.jsp end -->
	</div>
	<!-- navigation end -->
	<!-- wrapper start -->
	<div id='wrapper'>
		<!-- content start -->
		<div id="content">
		<a href=""><img src='image/board_main2.png' width='100%' height='800px' ></a>
		</div>
		<!-- content end -->
	</div>
	</div>
	<!-- container end -->
	<!-- wrapper end -->
	<div id='footer'>
			<!-- include_common_bottom.jsp start -->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end -->
	</div>
</body>
</html>