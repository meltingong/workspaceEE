<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sUserId = (String)session.getAttribute("sUserId");
User sUser = (User)session.getAttribute("sUser");

%>
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
	mainsearchform.action = "product_search_action.jsp";
	mainsearchform.method='GET';
	mainsearchform.submit();
}

function logincheck(){
	alert('로그인 후 이용바랍니다.');
	location.href='user_login_form.jsp';
}

</script>

<div id="menu">
	<ul>
		<!-- 게시판 아이콘 -->	
		<li id="toboard" title="게시판" ><a href="board_list.jsp" ><img src="image/shopmain_board.png" ></a></li>
		<!-- 로그아웃 상태:로그인 아이콘, 로그인 후:로그아웃 아이콘 -->	
		<!-- 로그인 아이콘 -->	
		<%if(sUserId == null){ %>
		<li id="login" title="로그인" ><a href="user_login_form.jsp" ><img src="image/login_icon.png" style="margin-top: 2px; "></a></li>
		<%} else { %>
		<!-- 로그아웃 아이콘 -->	
		<li id="logout" title="로그아웃" ><a href="user_logout_action.jsp" ><img src="image/logout_icon.png" style="margin-top: 2px; "></a></li>
		<%} %>
		
		<!-- 로그아웃 상태 : 로그인 하세요 팝업, 로그인창으로 이동 -->
		<!-- 마이페이지 아이콘 -->
		<%if(sUserId == null){ %>
		<li id="mypagebflogin" title="나의페이지" >
			<a href="javascript:logincheck();" ><img src="image/shopmain_user.png" ></a></li>
		<%} else { %>
		<li id="mypage" title="나의페이지" >
		<a href="user_view.jsp" ><img src="image/shopmain_user.png" ></a></li>
		<%} %>
		
		<!-- 로그아웃 상태 : 로그인 하세요 팝업, 로그인창으로 이동 -->
		<!-- 장바구니 아이콘 -->
		<%if(sUserId == null){ %>
		<li id="cart" title="장바구니"><a href="javascript:logincheck();" title="장바구니">
			<img src="image/shopmain_cart.png" ></a></li>
		<%} else { %>
		<li id="cart" title="장바구니"><a href="cart_view_select_update_qyt_all_check_delete_image.jsp" title="장바구니">
			<img src="image/shopmain_cart.png" ></a></li>
		<%} %>
		
		<!-- 검색 아이콘 -->
		<li><img src='image/mainsearchbtn.png' style="cursor: pointer;margin-left: 10px;margin-top: 10px; margin-right: 40px" onclick="mainsearch();" /></li>
		<li id="mainsearch" title="검색">
			<form id="mainsearchform" method="post">
				<input type='text' style="border: solid 1px grey; width: 200px; height: 30px; padding-left: 10px; border-radius: 10px" name='mainsearchkeyword' onKeypress="javascript:if(event.keyCode==13) {mainsearch();}"/> 
				<input type="hidden" name='searchbtn' value=''>
			</form>

		</li>
	</ul>
</div>

<div id="mainlogo">
	<ul>
		<li id='logo' title='메인로고'><a href="shop_main.jsp" id='maintext'><img src="image/tiffany_logo.png" width="auto" height="100px"></a></li>
	</ul>
</div>