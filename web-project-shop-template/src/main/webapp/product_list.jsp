
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	







	


<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<script type="text/javascript">
function add_cart_popup_window(f){
	if (true) {
		alert('로그인 하세요');
		location.href = 'user_login_form.jsp';
	} else {
		var left = Math.ceil(( window.screen.width)/5);
		var top = Math.ceil(( window.screen.height)/3); 
		console.log(left);
		console.log(top);
		var cartWin = window.open("about:blank","cartForm","width=260,height=130,top="+top+",left="+left+",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
		f.action = 'cart_add_action_popup_window.jsp';
		f.target = 'cartForm';
		f.method = 'POST';
		f.submit();
	}
}

</script> 
<style type="text/css" media="screen">
</style>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			




		
<div id="menu">
	<ul>
		<li id="logo"><a href="shop_main.jsp"></a></li>
		
			<li id="mypage" title="나의페이지" ><a href="user_login_form.jsp" ></a></li>
			<li id="cart" title="장바구니"><span class="w3-badge-no-login w3-green-no-login w3-margin-right">0 </span><a href="user_login_form.jsp" title="장바구니"></a></li>
			
		
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
	
	     	<li><a href="user_login_form.jsp">로그인</a></li>
			<li><a href="user_write_form.jsp">회원가입</a></li>
			<li><a href="user_write_form_popup.jsp">회원가입[팝업]</a></li>
			<li><a href=""></a></li>
			<li><a href="javascript:login_message();">장바구니</a></li>
	
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
											상품리스트</b></td>
								</tr>
							</table>

							<div id="f">
								<table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="BBBBBB">
									
									<!--상품시작 -->
									
									<tr>
									
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=1"><img width="88px" height="65px"
												src="image/bigle.png" border="0"></a><br />
												
											<br /> <b>견종:비글</b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="1">
												<input type="hidden" name="cart_qty" value="1">
												<img src='image/cart20.png' style="cursor:pointer;" onclick="add_cart_popup_window(this.parentElement);" align="top"/>
											</form><br> <font
											color="#FF0000">가격:550,000원
										</font></td>
										
									
								   <!--상품 끝 -->
								   
									<!--상품시작 -->
									
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=2"><img width="88px" height="65px"
												src="image/dalma.jpg" border="0"></a><br />
												
											<br /> <b>견종:달마시안</b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="2">
												<input type="hidden" name="cart_qty" value="1">
												<img src='image/cart20.png' style="cursor:pointer;" onclick="add_cart_popup_window(this.parentElement);" align="top"/>
											</form><br> <font
											color="#FF0000">가격:500,000원
										</font></td>
										
									
								   <!--상품 끝 -->
								   
									<!--상품시작 -->
									
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=3"><img width="88px" height="65px"
												src="image/pug.jpg" border="0"></a><br />
												
											<br /> <b>견종:퍼그</b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="3">
												<input type="hidden" name="cart_qty" value="1">
												<img src='image/cart20.png' style="cursor:pointer;" onclick="add_cart_popup_window(this.parentElement);" align="top"/>
											</form><br> <font
											color="#FF0000">가격:400,000원
										</font></td>
										
									
								   <!--상품 끝 -->
								   
									<!--상품시작 -->
									
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=4"><img width="88px" height="65px"
												src="image/pekiniz.png" border="0"></a><br />
												
											<br /> <b>견종:페키니즈</b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="4">
												<input type="hidden" name="cart_qty" value="1">
												<img src='image/cart20.png' style="cursor:pointer;" onclick="add_cart_popup_window(this.parentElement);" align="top"/>
											</form><br> <font
											color="#FF0000">가격:450,000원
										</font></td>
									
									</tr>
										
									
								   <!--상품 끝 -->
								   
									<!--상품시작 -->
									
									<tr>
									
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=5"><img width="88px" height="65px"
												src="image/pomeranian.jpg" border="0"></a><br />
												
											<br /> <b>견종:포메라니안</b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="5">
												<input type="hidden" name="cart_qty" value="1">
												<img src='image/cart20.png' style="cursor:pointer;" onclick="add_cart_popup_window(this.parentElement);" align="top"/>
											</form><br> <font
											color="#FF0000">가격:800,000원
										</font></td>
										
									
								   <!--상품 끝 -->
								   
									<!--상품시작 -->
									
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=6"><img width="88px" height="65px"
												src="image/shaipei.jpg" border="0"></a><br />
												
											<br /> <b>견종:샤페이</b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="6">
												<input type="hidden" name="cart_qty" value="1">
												<img src='image/cart20.png' style="cursor:pointer;" onclick="add_cart_popup_window(this.parentElement);" align="top"/>
											</form><br> <font
											color="#FF0000">가격:700,000원
										</font></td>
										
									
								   <!--상품 끝 -->
								   
									<!--상품시작 -->
									
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=7"><img width="88px" height="65px"
												src="image/dachshund.jpg" border="0"></a><br />
												
											<br /> <b>견종:닥스훈트</b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="7">
												<input type="hidden" name="cart_qty" value="1">
												<img src='image/cart20.png' style="cursor:pointer;" onclick="add_cart_popup_window(this.parentElement);" align="top"/>
											</form><br> <font
											color="#FF0000">가격:800,000원
										</font></td>
										
									
								   <!--상품 끝 -->
								   
									<!--상품시작 -->
									
										<td align="center" width="25%"  bgcolor="ffffff"><a
											href="product_detail.jsp?p_no=8"><img width="88px" height="65px"
												src="image/samoyed.jpg" border="0"></a><br />
												
											<br /> <b>견종:사모예드</b>
											<form style="display: inline;">
												<input type="hidden" name="p_no" value="8">
												<input type="hidden" name="cart_qty" value="1">
												<img src='image/cart20.png' style="cursor:pointer;" onclick="add_cart_popup_window(this.parentElement);" align="top"/>
											</form><br> <font
											color="#FF0000">가격:800,000원
										</font></td>
									
									</tr>
										
									
								   <!--상품 끝 -->
								   	
								</table>
							</div> <br /></td>
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