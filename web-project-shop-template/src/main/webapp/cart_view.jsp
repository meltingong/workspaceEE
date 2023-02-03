<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>쇼핑몰 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">

<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function cart_delete() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'cart_delete_action.jsp';
		document.cart_view_form.submit();
	}
	function cart_view_form_order_submit() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.buyType.value = 'cart';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="cart_view_form" style="margin: 0">
		<input type="hidden" name="buyType">
	</form>
	<!-- container start-->

	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->






			<div id="menu">
				<ul>
					<li id="logo"><a href="shop_main.jsp"></a></li>

					<li id="mypage" title="나의페이지"><a href="user_view.jsp"></a></li>
					<li id="cart" title="장바구니"><span
						class="w3-badge w3-green w3-margin-right">3</span><a
						href="cart_view_select_update_qyt_all_check_delete_image.jsp"></a></li>


				</ul>
			</div>
			<h1>
				<a href=""></a>
			</h1>

			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->






			<script type="text/javascript">
				function login_message() {
					alert('로그인하세요');
					location.href = 'user_login_form.jsp';
				}
			</script>
			<p>
				<strong>메 뉴</strong>
			</p>
			<ul>

				<li><a href="user_view.jsp">김경호1님</a></li>
				<li><a href="user_logout_action.jsp">로그아웃</a></li>
				<li></li>
				<li><a href="cart_view.jsp">장바구니[전체주문]<span
						class="w3-badge w3-badge-menu w3-green cart_item_count">3</span></a></li>
				<li><a href="cart_view_select.jsp">장바구니[선택주문]<span
						class="w3-badge w3-badge-menu w3-green cart_item_count">3</span></a></li>
				<li><a href="cart_view_select_update_qty.jsp">장바구니[수량변경]<span
						class="w3-badge w3-badge-menu w3-green cart_item_count">3</span></a></li>
				<li><a
					href="cart_view_select_update_qyt_all_check_delete_image.jsp">장바구니[최종완성]<span
						class="w3-badge w3-badge-menu w3-green cart_item_count">3</span></a></li>
				<li><a href=""></a></li>
				<li><a href="order_list.jsp">주문목록</a></li>
				<li><a href="order_list_orderitem1.jsp">주문+아이템 목록1</a></li>
				<li><a href="order_list_orderitem2.jsp">주문+아이템 목록2</a></li>


				<li><a href="product_list.jsp">상품리스트</a></li>
				<li><a href=""></a></li>
				<li><a href="board_list.jsp">게시판리스트</a></li>
				<li><a href="board_write.jsp">게시판쓰기</a></li>

			</ul>

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
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td height="22">&nbsp;&nbsp;<b>쇼핑몰 - 장바구니 보기</b></td>
								</tr>
							</table> <!--form--> <!-- 
							<form name="f" method="post">
							 -->
							<div id='f'>
								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=60 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>선택</font></td>
										<td width=40 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>이미지</font></td>
										<td width=210 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>강아지 이름</font></td>
										<td width=112 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>수 량</font></td>
										<td width=146 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>가 격</font></td>
										<td width=50 height=25 align="center" bgcolor="E6ECDE"
											class=t1><font>비 고</font></td>
									</tr>

									<!-- cart item start -->

									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1></td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1><img
											src='image/samoyed.jpg' width="34" height="28" /></td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1><a
											href='product_detail.jsp?p_no=8'>사모예드</a></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>1</td>
										<td width=146 height=26 align=center bgcolor="ffffff" class=t1>800,000</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>
											<form action="cart_delete_item_action.jsp" method="post">
												<input type="hidden" name="cart_no" value="42"> <input
													type="submit" value="삭제">
											</form>
										</td>
									</tr>

									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1></td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1><img
											src='image/shaipei.jpg' width="34" height="28" /></td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1><a
											href='product_detail.jsp?p_no=6'>샤페이</a></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>1</td>
										<td width=146 height=26 align=center bgcolor="ffffff" class=t1>700,000</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>
											<form action="cart_delete_item_action.jsp" method="post">
												<input type="hidden" name="cart_no" value="43"> <input
													type="submit" value="삭제">
											</form>
										</td>
									</tr>

									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1></td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1><img
											src='image/pomeranian.jpg' width="34" height="28" /></td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1><a
											href='product_detail.jsp?p_no=5'>포메라니안</a></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>1</td>
										<td width=146 height=26 align=center bgcolor="ffffff" class=t1>800,000</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>
											<form action="cart_delete_item_action.jsp" method="post">
												<input type="hidden" name="cart_no" value="44"> <input
													type="submit" value="삭제">
											</form>
										</td>
									</tr>

									<!-- cart item end -->
									<tr>
										<td width=640 colspan=6 height=26 class=t1 bgcolor="ffffff">
											<p align=right>
												<br /> <span id="tot_order_price" style="color: red">총주문금액
													: 2,300,000원</span>
											</p>
										</td>
									</tr>
								</table>
							</div> <!-- 
							</form> 
							 --> <br />
							<table style="padding-left: 10px" border="0" cellpadding="0"
								cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; <a href="product_list.jsp"
										class=m1>계속 구경하기</a>&nbsp;&nbsp; <a
										href="javascript:cart_view_form_order_submit();" class=m1>총
											<span style="font-weight: bold;" id="cart_item_select_count">3</span>개
											주문하기[주문폼]
									</a> <a href="javascript:cart_delete();" class=m1>장바구니 비우기</a>&nbsp;&nbsp;

									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->

			<p align="center">Copyright (&copy;) By Java Class 5. All rights
				reserved.</p>

			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>