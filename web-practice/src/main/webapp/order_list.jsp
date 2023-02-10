<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.order.OrderItem"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
<%
	

	OrderService orderService = new OrderService();
	List<Order> orderList = orderService.orderWithOrderItemList(sUserId);
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tiffany&coding</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel=stylesheet href="css/cart.css" type="text/css">
 
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	function order_delete_all_action(){
		document.order_delete_all_form.action='order_delete_all_action.jsp';
		document.order_delete_all_form.method='POST';
		document.order_delete_all_form.submit();
	}
</script>
<!-- mouse effect start -->
	<jsp:include page="include_mouseffect.jsp"/>
	<!-- mouse effect end -->
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
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0 style="padding-left: 150px; padding-right: 150px">
					<tr>
						<td><br />
							<table style="height:100px ; font-size: 40px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="ffffff" height="22">&nbsp;&nbsp;<b>
											ORDER LIST</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post">
								<table align=center width=80%  border="0" cellpadding="0"
									cellspacing="1">
									<!-- order start -->
									<%
									for (Order order : orderList) {
										List<OrderItem> ordeItemList=order.getOrderItem();
										
									%>
									<tr>
										<td colspan="6" height=24 align=left bgcolor="#000000" class=t1 style="color: white;">
											<span style="font-style: bold;">&nbsp;2023/01/31</span>&nbsp;&nbsp;&nbsp;
											<span style="">주문번호 <%=order.getO_no()%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
											<a href='order_detail.jsp?o_no=<%=order.getO_no()%>' ><span style="color: #81d8d0">[ 상세보기 ]</span></a>
										</td>
									</tr>
									<tr>
										<td colspan="6" height=4 align=left class=t1 >
										</td>
									</tr>
									<tr>
										<td width="5%"></td>
										<td width="95%" colspan="8" bgcolor="ffffff" class=t1>
											<!--  -->
											<table align="left" border="0" 
												cellspacing="1" bgcolor="ffffff">
												<tr >
													<%
													int orderItemSize = ordeItemList.size();
													int remainSize=8-orderItemSize;
													for(int j=0;j<orderItemSize;j++){
														OrderItem orderItem=ordeItemList.get(j);
														Product product=orderItem.getProduct();
													%>
													<!--상품시작 -->
													<td align="center" style="padding: 30px;width: 55px" bgcolor="ffffff"><a style="padding: 0px"
														href="product_detail.jsp?p_no=<%=product.getP_no()%>"><img width="100px"
															height="100px" src="image/<%=product.getP_image() %>" border="0" style="padding-top: 5px"></a> <br>
														<span style="font-size: 6pt"><b><%=product.getP_name()%></b> <br> ₩<%=new DecimalFormat("#,###").format(orderItem.getOi_qty()*product.getP_price())%> <%=orderItem.getOi_qty()%>개</span>
													</td>
													<!--상품 끝 -->
													<%} %>
													<%
													for(int j=0;j<remainSize;j++){
													%>
													<!--상품시작 -->
													<td align="center" style="padding: 0px;width: 55px" bgcolor="ffffff">
													</td>
													<!--상품 끝 -->
													<%
													}	
													%>
													
													</tr>
											</table>
										</td>
									<tr>
										<td colspan="5" width=145 height=10 align=center
											bgcolor="ffffff" class=t1></td>
									</tr>
									<!-- order end -->
									<%
									}
									%>
									<!-- order end -->
								</table>
							</form> <br />
							<table style=" height: 200px;" border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>
									<a href=product_list.jsp class=m1>계속 구경하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href='javascript:order_delete_all_action();'	class=m1>주문 전체 삭제</a>
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
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>