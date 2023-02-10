<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.order.OrderItem"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
<%
String o_noStr=request.getParameter("o_no");
if(o_noStr==null|| o_noStr.equals("")){
	response.sendRedirect("order_list.jsp");
	return;
}
OrderService orderService = new OrderService();
CartService cartService = new CartService();
UserService userService = new UserService();
ProductService productService = new ProductService();
Product product = new Product();

User user = userService.findUser(sUserId);
Order order = orderService.orderWithOrderItem(Integer.parseInt(o_noStr));
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel=stylesheet href="css/cart.css" type="text/css">
 
<style type="text/css" media="screen">
/*
form > table tr td{
	border: 0.1px solid black;
}
*/
</style>
<script type="text/javascript">
	
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
						<td><br />
							<table style="height:100px ; font-size: 40px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="ffffff" height="22">&nbsp;&nbsp;<b>
											ORDER DETAIL</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post" action="order_delete_action.jsp">
								<input type="hidden" name="o_no" value="<%=order.getO_no()%>">
								<table align="center" width="80%"  border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB" >
									<caption style="text-align: left; margin-bottom:20px; font-size: 25px">주문 상세정보</caption>
									<tr>
										<td width=290 height=25 bgcolor="#000000" align=center class=t1 style="color: white;"><font
											>주문번호</font></td>
										<td width=112 height=25 bgcolor="#000000" align=center class=t1 style="color: white;"><font
											>주문일</font></td>
										<td width=166 height=25 bgcolor="#000000" align=center class=t1 style="color: white;"><font
											>주문자</font></td>
										<td width=50 height=25 bgcolor="#000000" align=center class=t1 style="color: white;"><font
											>주소</font></td>
											<td width=50 height=25 bgcolor="#000000" align=center class=t1 style="color: white;"><font
											>비고</font></td>
									</tr>
									
									
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1><%=order.getO_no()%></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=order.getO_date()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=order.getUserid()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=user.getAddress()%></td>
										
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>
												<input type="submit" value="주문 취소">
										</td>
									</tr>
								</table>
									
								<br/>	
								<table align=center  width=80% border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB" >
									<caption style="text-align: left; margin-top:100px; margin-bottom:20px; font-size: 25px">주문제품 목록</caption>
									<tr style="border: 0.1px solid">
										<td width=290 height=25 align=center bgcolor="#000000" class=t1 style="color: white;">제품명</td>
										<td width=112 height=25 align=center bgcolor="#000000" class=t1 style="color: white;">수 량</td>
										<td width=166 height=25  align=center bgcolor="#000000" class=t1 style="color: white;">가 격</td>
										<td width=50 height=25  align=center bgcolor="#000000" class=t1 style="color: white;">색상</td>
									</tr>
									
									<!-- orer item start -->
									<%
									int tot_price=0;
																for(OrderItem orderItem:order.getOrderItem()) {
																tot_price+=orderItem.getOi_qty()*orderItem.getProduct().getP_price();
									%>
									<tr>
										<td width=290 height=26 align=center  bgcolor="ffffff" class=t1>
										<a href='product_detail.jsp?p_no=<%=orderItem.getProduct().getP_no()%>'>
										<%=orderItem.getProduct().getP_name()%></a>
										</td>
										
										<td width=112 height=26 align=center  bgcolor="ffffff" class=t1>
										<%=orderItem.getOi_qty()%>
										</td>
										
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1>
										<%=new DecimalFormat("#,###").format(orderItem.getOi_qty()*orderItem.getProduct().getP_price())%>
										</td>
										<td width=50 height=26 align=center class=t1 bgcolor="ffffff"><%=orderItem.getProduct().getP_option() %></td>
									</tr>
									<%}%>
									<!-- cart item end -->
									<tr>
										<td width=640 colspan=4 height=26  bgcolor="ffffff" class=t1>
										
											<p align=right style="margin-top: 100px; font-size: 20px">
												<font color=#FF0000>총 주문 금액 :₩<%=new DecimalFormat("#,###").format(tot_price)%> 원
												</font>
											</p>
										</td>
									</tr>
								</table>
							</form> <br />
							<table style=" height: 200px;"border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center> 
										<a href=order_list.jsp class=m1>주문목록</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href=product_list.jsp class=m1>계속 쇼핑하기</a>

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
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>