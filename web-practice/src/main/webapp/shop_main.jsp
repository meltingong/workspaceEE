<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Tiffany&Coding</title>
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
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
			<jsp:include page="include_common_left.jsp"/>
			<!-- include_common_left.jsp end -->
	</div>
	<!-- navigation end -->
	<!-- wrapper start -->
	<div id='wrapper'>
		<!-- content start -->
		<div id="content">
		<!-- mainbanner start -->
			<div id='mainbanner_container'>
				<div id='mainbanner_content'>
				<a href='shop_main.jsp'><img src="image/shopmain.png" width=100% height='auto'></a>
				</div>
			</div>
		<!-- mainbanner end -->
		<!-- category list start -->
		<div id="category_body">
			<div id="category_container">
				<div id="category_content">
					<ul id="category_wrapper">
						<li id="ca_all" title="전체" style="margin-right: 30px; margin-left:30px"" >
							<a href="product_list.jsp"><img src="image/shop_category_all.png" class="ca_image" width='100%' height='100%'></a>
						<div class="categorytext">ALL</div>
						</li>
						<li id="ca_ring" title="반지" style="margin-right: 30px">
							<a href="product_list.jsp?type_no=1"><img src="image/shop_category_ring.png" class="ca_image" width='100%' height='100%'></a>
						<div class="categorytext">RING</div>
						</li>
						<li id="ca_necklaces" title="목걸이" style="margin-right: 30px">
							<a href="product_list.jsp?type_no=2"><img src="image/shop_category_necklaces.png" class="ca_image" width='100%' height='100%'></a>
						<div class="categorytext">NECKLACES</div>
						</li>
						<li id="ca_earings" title="귀걸이" style="margin-right: 30px">
							<a href="product_list.jsp?type_no=4"><img src="image/shop_category_earings.png" class="ca_image" width='100%' height='100%'></a>
						<div class="categorytext">EARINGS</div>
						</li>
						<li id="ca_braclet" title="팔찌" >
							<a href="product_list.jsp?type_no=3"><img src="image/shop_category_braclet.png" class="ca_image" width='100%' height='100%'></a>
						<div class="categorytext">BRACLET</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- category list end -->
			<!-- mainbanner_bottom start -->
			<div id='mainbanner_bottom_container'>
				<div id='mainbanner_bottom_content'>
				<a href=''><img src="image/shopmain_bottom.png" width=100% height='auto'></a>
				</div>
			</div>
			<!-- mainbanner_bottom end -->
		<a href=""></a>
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