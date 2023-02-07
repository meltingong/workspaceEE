<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="include_product_sort_form" method="post" action="include_product_sort_action.jsp" >
				<!-- 
				 <input type=text name="cart_qty" value=1 size=4 class=TXTFLD>  
				-->
				<br><b>정렬</b>&nbsp;
				<select name="sort_option">
					<option value="select">선택
					<option value="sort_asc">가격 오름차순
					<option value="sort_desc">가격 내림차순
				</select> <br><br> 
				</form>
</body>
</html>