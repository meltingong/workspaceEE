<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.order.OrderService"%>
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
	function order_delete_all_action(){
		document.order_delete_all_form.action='order_delete_all_action.jsp';
		document.order_delete_all_form.method='POST';
		document.order_delete_all_form.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
<form name="order_delete_all_form" style="margin: 0">
</form>	
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			




		
<div id="menu">
	<ul>
		<li id="logo"><a href="shop_main.jsp"></a></li>
		
			<li id="mypage" title="나의페이지" ><a href="user_view.jsp"></a></li>
			<li id="cart" title="장바구니"><span class="w3-badge w3-green w3-margin-right">3</span><a href="cart_view_select_update_qyt_all_check_delete_image.jsp"></a></li>
			
		
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
		<li><a href="cart_view.jsp">장바구니[전체주문]<span class="w3-badge w3-badge-menu w3-green cart_item_count">3</span></a></li>
		<li><a href="cart_view_select.jsp">장바구니[선택주문]<span class="w3-badge w3-badge-menu w3-green cart_item_count">3</span></a></li>
		<li><a href="cart_view_select_update_qty.jsp">장바구니[수량변경]<span class="w3-badge w3-badge-menu w3-green cart_item_count">3</span></a></li>
		<li><a href="cart_view_select_update_qyt_all_check_delete_image.jsp">장바구니[최종완성]<span class="w3-badge w3-badge-menu w3-green cart_item_count">3</span></a></li>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>쇼핑몰 -
											주문 목록</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post">
								<table align=center width=80%  border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문번호</font></td>
										<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문이름</font></td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문날짜</font></td>
										<td width=136 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문가격</font></td>
										<td width=80 height=25 bgcolor="E6ECDE" align=center class=t1><font></font></td>
									</tr>

									<!-- order start -->
									
									<tr>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1>18</td>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1>퍼그외 9 개</td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>2023/01/31</td>
										<td width=136 height=26 align=center bgcolor="ffffff" class=t1>4,400,000</td>
										<td width=80 height=26 align=center bgcolor="ffffff" class=t1><a
											href="order_detail.jsp?o_no=18" class=m1>주문상세</a></td>
									</tr>
									
									<tr>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1>9</td>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1>달마시안외 0 개</td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>2023/01/09</td>
										<td width=136 height=26 align=center bgcolor="ffffff" class=t1>500,000</td>
										<td width=80 height=26 align=center bgcolor="ffffff" class=t1><a
											href="order_detail.jsp?o_no=9" class=m1>주문상세</a></td>
									</tr>
									
									<tr>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1>8</td>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1>달마시안외 4 개</td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>2023/01/09</td>
										<td width=136 height=26 align=center bgcolor="ffffff" class=t1>3,350,000</td>
										<td width=80 height=26 align=center bgcolor="ffffff" class=t1><a
											href="order_detail.jsp?o_no=8" class=m1>주문상세</a></td>
									</tr>
									
									<!-- order end -->




								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp;
									<a href=product_list.jsp
										class=m1>계속 구경하기</a>
									<a href='javascript:order_delete_all_action();'
										class=m1>주문전체삭제</a>
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
			
	<p align="center">Copyright (&copy;) By Java Class 5. All
		rights reserved.</p>

			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>