<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 

int cart_item_count=0;
	String sUserId=(String)session.getAttribute("sUserId");
	if(sUserId!=null){
		CartService cartService=new CartService();
		cart_item_count = cartService.getCartItemByUserId(sUserId).size();
	}

-->
<script type="text/javascript">
function mainsearch(){
	alert("상품 검색");
	mainsearchform.action = "shop_main.jsp";
	mainsearchform.method='POST';
	mainsearchform.submit();
}
</script>

<div id="menu">
	<ul>
		<li id="toboard" title="게시판" ><a href="board_list.jsp" ><img src="image/shopmain_board.png" ></a></li>
		<li id="mainsearch" title="검색">
		<form id="mainsearchform" method="post">
			<input type='text' style="border: solid 1px grey; width:200px; height:30px; padding: 0" name='mainsearchkeyword' >
			<input id='mainsearchbtn' type="button" onClick="mainSearch()">
		</form>
		</li>
		<li id="mypage" title="나의페이지" ><a href="user_login_form.jsp" ><img src="image/shopmain_user.png" ></a></li>
		<li id="cart" title="장바구니"><a href="cart_view_select_update_qyt_all_check_delete_image.jsp" title="장바구니"><img src="image/shopmain_cart.png" ></a></li>
	</ul>
</div>

<div id="mainlogo">
	<ul>
		<li id='logo' title='메인로고'><a href="shop_main.jsp" id='maintext'><img src="image/tiffany_logo.png" width="auto" height="100px"></a></li>
	</ul>
</div>