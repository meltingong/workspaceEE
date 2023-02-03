<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String sUserId=(String)session.getAttribute("sUserId");
%>	
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
	<%
		if(sUserId==null){
	%>
	     	<li><a href="user_login_form.jsp">로그인</a></li>
			<li><a href="user_write_form.jsp">회원가입</a></li>
			<li><a href="user_write_form_popup.jsp">회원가입[팝업]</a></li>
			<li><a href=""></a></li>
			<li><a href="javascript:login_message();">장바구니</a></li>
	<%
		}else{ 
			User sUser=new UserService().findUser(sUserId);
		    CartService cartService=new CartService();
		  	int cart_item_count = cartService.getCartItemByUserId(sUserId).size();
	%>	
		<li><a href="user_view.jsp"><%=sUser.getName()+"님"%></a></li>
		<li><a href="user_logout_action.jsp">로그아웃</a></li>
		<li></li>
		<li><a href="cart_view.jsp">장바구니[전체주문]<span class="w3-badge w3-badge-menu w3-green cart_item_count"><%=cart_item_count%></span></a></li>
		<li><a href="cart_view_select.jsp">장바구니[선택주문]<span class="w3-badge w3-badge-menu w3-green cart_item_count"><%=cart_item_count%></span></a></li>
		<li><a href="cart_view_select_update_qty.jsp">장바구니[수량변경]<span class="w3-badge w3-badge-menu w3-green cart_item_count"><%=cart_item_count%></span></a></li>
		<li><a href="cart_view_select_update_qyt_all_check_delete_image.jsp">장바구니[최종완성]<span class="w3-badge w3-badge-menu w3-green cart_item_count"><%=cart_item_count%></span></a></li>
		<li><a href=""></a></li>
		<li><a href="order_list.jsp">주문목록</a></li>
		<li><a href="order_list_orderitem1.jsp">주문+아이템 목록1</a></li>
		<li><a href="order_list_orderitem2.jsp">주문+아이템 목록2</a></li>
		
	<%} %>
		<li><a href="product_list.jsp">상품리스트</a></li>
		<li><a href=""></a></li>
		<li><a href="board_list.jsp">게시판리스트</a></li>
		<li><a href="board_write.jsp">게시판쓰기</a></li>
		
</ul>
