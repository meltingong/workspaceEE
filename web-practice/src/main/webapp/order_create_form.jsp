<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>   
<%
	

	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("order_list.jsp");
		return;
	} 
	
	String buyType = request.getParameter("buyType");
	String p_noStr = request.getParameter("p_no");
	String p_qtyStr = request.getParameter("p_qty");
	String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");
	
	if(buyType==null)buyType="";
	if(p_noStr==null)p_noStr="";
	if(p_qtyStr==null)p_qtyStr="";
	if(cart_item_noStr_array==null)
		cart_item_noStr_array=new String[]{};
	
	CartService cartService = new CartService();
	UserService userService = new UserService();
	ProductService productService = new ProductService();
	Product product = new Product();
	
	List<Cart> cartItemList = new ArrayList<Cart>();
	User user = userService.findUser(sUserId);
	
	if(buyType.equals("cart")){
		cartItemList = cartService.getCartItemByUserId(sUserId);
	} else if(buyType.equals("cart_select")){
		for(String cart_item_noStr : cart_item_noStr_array){
			cartItemList.add(cartService.getCartItemByCartNo(Integer.parseInt(cart_item_noStr)));
		}
	} else if(buyType.equals("direct")){
		product = productService.productDetail(Integer.parseInt(p_noStr));
		cartItemList.add(new Cart(0,Integer.parseInt(p_qtyStr),sUserId,product));
	}
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tiffany&coding</title>
 
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel=stylesheet href="css/cart.css" type="text/css">

<style type="text/css" media="screen"></style>

<script type="text/javascript">

	function order_create_form_submit() {
		document.order_create_form.method = 'POST'
		document.order_create_form.action = 'order_create_action.jsp';     
		document.order_create_form.submit();
		
	}
	
	
	
	
	

	
</script>
<!-- mouse effect start -->
	<jsp:include page="include_mouseffect.jsp"/>
	<!-- mouse effect end -->
</head>



<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>

	<form name="order_create_form" method="post">
		<input type="hidden" name="buyType" value="<%=buyType%>"> 
		<input type="hidden" name="p_no" value="<%=p_noStr%>"> 
		<input type="hidden" name="p_qty" value="<%=p_qtyStr%>">
		
		<%
		for (String cart_item_noStr : cart_item_noStr_array) {
		%>
		<input type="hidden" name="cart_item_no" value="<%=cart_item_noStr%>">
		<%
		}
		%>
	</form>
	
	
	<!-- update form 
	<form name="address_update_form" method="post">
	<input type="hidden" name="address" value="user.getAddress()">
	</form> -->
	
	
	
	
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
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="height:100px ; font-size: 40px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td height="22"><b>ORDER / PAYMENT</b></td>
								</tr>
							</table> <!--form-->
							<form name="address_update_form" method="post">
								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left; margin-bottom:20px; font-size: 25px">구매자 정보</caption>
									<tr>
										<td width=290 height=25 align=center bgcolor="#000000" class=t1 style="color: white;">아이디</td>
										<td width=112 height=25 align=center bgcolor="#000000" class=t1 style="color: white;">이름</td>
										<td width=166 height=25 align=center bgcolor="#000000" class=t1 style="color: white;">이메일</td>
										<td width=50 height=25 align=center bgcolor="#000000" class=t1 style="color: white;">주소</td>
										
										
									</tr>
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1><%=user.getUserId()%></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=user.getName()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=user.getEmail()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=user.getAddress()%></td>
										
										
									</tr>
							
								
   
								<br />

								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left; margin-top:100px; margin-bottom:20px; font-size: 25px">주문 제품 목록</caption>
									<tr style="border: 0.1px solid">
										<td width=290 height=25 bgcolor="#000000" align=center class=t1 style="color: white;">제품명</td>
										<td width=112 height=25 bgcolor="#000000" align=center class=t1 style="color: white;">수량</td>
										<td width=166 height=25 bgcolor="#000000" align=center class=t1 style="color: white;">가격</td>
										<td width=50 height=25 bgcolor="#000000" align=center class=t1 style="color: white;">색상</td>
										<td width=50 height=25 bgcolor="#000000" align=center class=t1 style="color: white;">비고</td>
									</tr>
									<%
									int tot_price = 0;
									for (Cart cart : cartItemList) {
										tot_price += cart.getCart_qty() * cart.getProduct().getP_price();
									%>
									<!-- cart item start -->
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1>
											<a
											href='product_detail.jsp?p_no=<%=cart.getProduct().getP_no()%>'><%=cart.getProduct().getP_name()%></a>
										</td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getCart_qty()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1>
											₩<%=new DecimalFormat("#,###").format(cart.getCart_qty() * cart.getProduct().getP_price())%>
										</td>
										<td width=166 height 26 align=center bgcolor="ffffff" class=t1><%=cart.getProduct().getP_option() %>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
									</tr>
									<!-- cart item end -->
									<%}%>
									<tr>
										<td width=640 colspan=5 height=26 bgcolor="ffffff" class=t1>
											<p align=right style="margin-top: 100px; font-size: 20px">
												<font color=#FF0000>총 주문 금액 : <%=new DecimalFormat("#,###").format(tot_price)%>원
												</font>
											</p>
										</td>
									</tr>
								</table>
							</form>
							
							<br />
							<table  style=" height: 100px;" border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center><a href="javascript:order_create_form_submit();" class=m1>결제하기</a>
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
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>