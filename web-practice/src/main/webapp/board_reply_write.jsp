<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
<%
if(request.getParameter("boardno") == null){
	response.sendRedirect("board_list.jsp");
	return;
}

UserService userService = new UserService();
User user = userService.findUser(sUserId);

int boardno = Integer.parseInt(request.getParameter("boardno"));
Board board = BoardService.getInstance().findBoard(boardno);
if(board == null){
	response.sendRedirect("board_list.jsp");
	return;
}
String pageno = "1";
if(request.getParameter("pageno") != null){
	pageno = request.getParameter("pageno");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<script type="text/javascript">
	function boardReplyCreate() {
		if (f.title.value == "") {
			alert("제목을 입력하세요.");
			f.title.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요.");
			f.content.focus();
			return false;
		}
		f.action = "board_reply_write_action.jsp";
		f.method='POST';
		f.submit();
	}

	function boardList() {
		f.action = "board_list.jsp";
		f.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
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
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
							</table> <br> 
							<!-- write Form  -->
							<form name="f" method="post" style="padding-left: 200px; padding-right: 200px; ">
								<input type="hidden" name="pageno"  value="<%=pageno%>" />
		        				<input type="hidden" name="boardno" value="<%=board.getBoardNo()%>"/>

								<table border='solid 1px' cellpadding='5px' cellspacing='1' width='400' bgcolor='#FFFFFF' style=" border-color: #FFFFFF">
									<tr>
										<td width=100 align=center bgcolor=#000000 style='color:white' height="22">제 목</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input value="[RE]<%=board.getTitle()%>"  type="text" style="width: 100% ;height: 100%" name="title">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">작성자</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=user.getUserId() %></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">내 용</td>
										<td width=300 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<textarea name="content" class="textarea" style="width: 100%" rows="14">>><%=board.getContent().replace("\n",">>").trim()%></textarea>
										</td>
									</tr>


								</table>
							</form> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0 style= 'height: 200px'>
								<tr>
									<td align=center>
									<input type="button" value="답글 쓰기 완료" onClick="boardReplyCreate()"> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;    
									<input type="button" value="취 소" onClick="boardList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
		<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
	
	</div>
	<!--container end-->
	<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
</body>
</html>