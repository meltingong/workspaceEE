
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
	function changeNumber(desc, formId) {
		console.log(formId);
		var form = document.getElementById(formId);
		if (desc == '+') {
			form.cart_qty.value = parseInt(form.cart_qty.value) + 1;

		} else if (desc == '-') {
			if (form.cart_qty.value - 1 >= 0) {
				form.cart_qty.value = parseInt(form.cart_qty.value) - 1;
			}
		}

		form.method = 'POST';
		form.action = 'cart_update_item_action.jsp';
		form.submit();
	}
	/*
	cart item1개삭제하기
	 */
	function cart_delete_item_action(formId) {
		if(window.confirm('해당상품을 장바구니에서 삭제하시겠습니까?')){
			var form = document.getElementById(formId);
			form.method = 'POST';
			form.action = 'cart_delete_item_action.jsp';
			form.submit();
		}
		
	}
	/*
	cart 전체삭제(비우기)
	 */
	function cart_delete() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'cart_delete_action.jsp';
		document.cart_view_form.submit();
	}
	function cart_view_form_submit() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.buyType.value = 'cart';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	
	function cart_view_form_select_submit() {
		var cart_item_no_check_list = document
				.getElementsByName("cart_item_no_check");
		var isChecked = false;
		for (var i = 0; i < cart_item_no_check_list.length; i++) {
			if (cart_item_no_check_list.item(i).checked === true) {
				isChecked = true;
				break;
			}
		}
		if (!isChecked) {
			alert('제품을선택해주세요');

			return;
		}
		document.cart_view_form.buyType.value = 'cart_select';
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	function cart_item_all_select_checkbox_deselect(){
		document.getElementById('all_select_checkbox').checked=false;
	}
	/*
	cart 아이템카운트갱신,cart_view_form 갱신
	*/
	function cart_item_select_count(){
			var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
			var cart_item_check_selected_count = 0;
			document.cart_view_form.innerHTML ='';
			document.cart_view_form.innerHTML +="<input type='hidden' name='buyType'>";
			var tot_order_price=0;
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				if (cart_item_no_check_list.item(i).checked === true) {
					document.cart_view_form.innerHTML += "<input type='hidden' name='cart_item_no' value='"+ cart_item_no_check_list.item(i).value + "'>";
					var updateFormId='cart_update_form_'+ cart_item_no_check_list.item(i).value;
					var cart_qty=document.getElementById(updateFormId).cart_qty.value;
					var cart_product_unit_price=document.getElementById(updateFormId).cart_product_unit_price.value;
					tot_order_price+=cart_qty*cart_product_unit_price;
					cart_item_check_selected_count++;
				}
			}
			document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
			document.getElementById('tot_order_price').innerHTML = tot_order_price.toLocaleString();
			
	}
	/*
	cart 아이템전체선택해제
	*/
	function cart_item_all_select(e){
		var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
		if(e.target.checked){
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				cart_item_no_check_list.item(i).checked=true;
			}
		}else{
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				cart_item_no_check_list.item(i).checked=false;
			}
		}
	}
</script>
</head>
<body onload="cart_item_select_count();" bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="cart_view_form" style="margin:0">
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
											class=t1><input type="checkbox" id="all_select_checkbox" checked="checked" onchange="cart_item_all_select(event);cart_item_select_count();"></td>
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
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1>
										 <input type="checkbox" name="cart_item_no_check" onchange="cart_item_all_select_checkbox_deselect();cart_item_select_count();" value="42" checked="checked">
										</td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1>
											<img src='image/samoyed.jpg' width="34" height="28" />
										</td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1>
											<a href='product_detail.jsp?p_no=8'>사모예드</a>
										</td>

										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>
											<form action="cart_update_action.jsp" method="post"
												id="cart_update_form_42">
												<input type="hidden" name="cart_no"
													value="42"> <input
													type="button" value="-"
													onclick="changeNumber('-','cart_update_form_42');"/>
												<input type="text" readonly="readonly" size="2"
													style="text-align: center; width: 15%" name="cart_qty"
													value="1"> <input
													type="button" value="+"
													onclick="changeNumber('+','cart_update_form_42');"/>
												<input type="hidden" name="cart_product_unit_price" value="800000"/>	
											</form>
										</td>

										<td width=146 height=26 align=center bgcolor="ffffff" class=t1>800,000</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>

											
											<form id="cart_delete_item_form_42">
												<input type="hidden" name="cart_no"
													value="42"> <a
													href="javascript:cart_delete_item_action('cart_delete_item_form_42');">
													<svg xmlns="http://www.w3.org/2000/svg" width="14"
														height="14" viewBox="0 0 28 28" class="icon--close">
													<g fill="none" fill-rule="evenodd"> <path
														d="M0 0H28V28H0z"></path> <g fill="#9B9BA0"
														transform="translate(6 6)" class="icon--close__group">
													<rect width="2" height="18" x="7" y="-1" rx="1"
														transform="rotate(-135 8 8)"></rect> <rect width="2"
														height="18" x="7" y="-1" rx="1"
														transform="rotate(-45 8 8)"></rect> </g> </g> </svg>
												</a>
											</form>

										</td>
									</tr>
									
									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1>
										 <input type="checkbox" name="cart_item_no_check" onchange="cart_item_all_select_checkbox_deselect();cart_item_select_count();" value="43" checked="checked">
										</td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1>
											<img src='image/shaipei.jpg' width="34" height="28" />
										</td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1>
											<a href='product_detail.jsp?p_no=6'>샤페이</a>
										</td>

										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>
											<form action="cart_update_action.jsp" method="post"
												id="cart_update_form_43">
												<input type="hidden" name="cart_no"
													value="43"> <input
													type="button" value="-"
													onclick="changeNumber('-','cart_update_form_43');"/>
												<input type="text" readonly="readonly" size="2"
													style="text-align: center; width: 15%" name="cart_qty"
													value="1"> <input
													type="button" value="+"
													onclick="changeNumber('+','cart_update_form_43');"/>
												<input type="hidden" name="cart_product_unit_price" value="700000"/>	
											</form>
										</td>

										<td width=146 height=26 align=center bgcolor="ffffff" class=t1>700,000</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>

											
											<form id="cart_delete_item_form_43">
												<input type="hidden" name="cart_no"
													value="43"> <a
													href="javascript:cart_delete_item_action('cart_delete_item_form_43');">
													<svg xmlns="http://www.w3.org/2000/svg" width="14"
														height="14" viewBox="0 0 28 28" class="icon--close">
													<g fill="none" fill-rule="evenodd"> <path
														d="M0 0H28V28H0z"></path> <g fill="#9B9BA0"
														transform="translate(6 6)" class="icon--close__group">
													<rect width="2" height="18" x="7" y="-1" rx="1"
														transform="rotate(-135 8 8)"></rect> <rect width="2"
														height="18" x="7" y="-1" rx="1"
														transform="rotate(-45 8 8)"></rect> </g> </g> </svg>
												</a>
											</form>

										</td>
									</tr>
									
									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1>
										 <input type="checkbox" name="cart_item_no_check" onchange="cart_item_all_select_checkbox_deselect();cart_item_select_count();" value="44" checked="checked">
										</td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1>
											<img src='image/pomeranian.jpg' width="34" height="28" />
										</td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1>
											<a href='product_detail.jsp?p_no=5'>포메라니안</a>
										</td>

										<td width=112 height=26 align=center bgcolor="ffffff" class=t1>
											<form action="cart_update_action.jsp" method="post"
												id="cart_update_form_44">
												<input type="hidden" name="cart_no"
													value="44"> <input
													type="button" value="-"
													onclick="changeNumber('-','cart_update_form_44');"/>
												<input type="text" readonly="readonly" size="2"
													style="text-align: center; width: 15%" name="cart_qty"
													value="1"> <input
													type="button" value="+"
													onclick="changeNumber('+','cart_update_form_44');"/>
												<input type="hidden" name="cart_product_unit_price" value="800000"/>	
											</form>
										</td>

										<td width=146 height=26 align=center bgcolor="ffffff" class=t1>800,000</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>

											
											<form id="cart_delete_item_form_44">
												<input type="hidden" name="cart_no"
													value="44"> <a
													href="javascript:cart_delete_item_action('cart_delete_item_form_44');">
													<svg xmlns="http://www.w3.org/2000/svg" width="14"
														height="14" viewBox="0 0 28 28" class="icon--close">
													<g fill="none" fill-rule="evenodd"> <path
														d="M0 0H28V28H0z"></path> <g fill="#9B9BA0"
														transform="translate(6 6)" class="icon--close__group">
													<rect width="2" height="18" x="7" y="-1" rx="1"
														transform="rotate(-135 8 8)"></rect> <rect width="2"
														height="18" x="7" y="-1" rx="1"
														transform="rotate(-45 8 8)"></rect> </g> </g> </svg>
												</a>
											</form>

										</td>
									</tr>
									
									<!-- cart item end -->



									<tr>
										<td width=640 colspan=6 height=26 class=t1 bgcolor="ffffff">
											<p align=right>
												<br /> 
												<font color='red'>총주문금액 : <span id="tot_order_price">2,300,000</span> 원</font>
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
										class=m1>계속 구경하기</a>&nbsp;&nbsp;  <a href="javascript:cart_view_form_select_submit();" class=m1>
										 	총 <span style="font-weight: bold;" id="cart_item_select_count"></span>개 주문하기[주문폼]
										 	</a>&nbsp;&nbsp;
											<a href="javascript:cart_delete();" class=m1>장바구니 비우기</a>&nbsp;&nbsp;
											
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