<%@page import="com.itwill.shop.user.User"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.board.BoardCommentService"%>
<%@page import="com.itwill.board.BoardComment"%>
<%@page import="com.itwill.board.util.PageMaker"%>
<%@page import="com.itwill.board.Board"%>
<%@page import="com.itwill.board.BoardListPageMakerDto"%>
<%@page import="com.itwill.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
public String getTitleString(Board board) {
	StringBuilder title = new StringBuilder(128);
	String t = board.getTitle();
	if (t.length() > 15) {
		t = String.format("%s...", t.substring(0, 15));
	}
	// 답글 공백 삽입
	for (int i = 0; i < board.getDepth(); i++) {
		title.append("&nbsp;&nbsp;");
	}
	// 답글 화살표 이미지 삽입
	if (board.getDepth() > 0) {
		title.append("<img border='0' src='image/re.gif'/>");
	}
	title.append(t.replace(" ", "&nbsp;"));
	return title.toString();
}
%>
<%
/*
게시판 검색버튼 클릭 시 
게시판 리스트에서 검색된 내용 보여주기
*/
String boardsearchkeyword = request.getParameter("boardsearchkeyword");
BoardService boardService = new BoardService();

if(boardsearchkeyword == null || boardsearchkeyword.equals("")){
	response.sendRedirect("board_list.jsp");
	return;
}

BoardCommentService boardCommentService = new BoardCommentService();

// pageno 없거나 공백일 경우 1페이지 보여주기
String pageno = request.getParameter("pageno");
if(pageno == null || pageno.equals("")){
	pageno = "1";
}

// 검색된 게시글 조회
BoardListPageMakerDto boardListPage = BoardService.getInstance().findSearchBoardList((Integer.parseInt(pageno)), boardsearchkeyword);
//
String sUserId = (String)session.getAttribute("sUserId");
User sUser = (User)session.getAttribute("sUser");
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<title>Tiffany&Co 게시판</title>
<script type="text/javascript">
	//로그인 상태에서 게시글 쓰기 
	function boardCreate(){
		location.href = "board_write.jsp";
	}
	// 로그인 전 게시글 쓰기 버튼누르기 
	function boardCreatebfLogin(){
		alert('로그인 후 글쓰기가 가능합니다.');
		location.href = "user_login_form.jsp";
	}
	// 로그인 전 게시글 제목 클릭
	function boardViewbfLogin(){
		alert('로그인 후 글 보기가 가능합니다.');
		location.href = "user_login_form.jsp";
	}
	// 게시판 키워드 검색버튼, 이동
	function boardsearch(){
		boardsearchform.action = 'board_search_list.jsp';
		boardsearchform.method = 'POST';
		boardsearchform.submit();
	}

	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<!-- container start -->
<div id='container'>
	<!-- header start -->
	<div id='header'>
		<!-- include_common_top.jsp start-->
		<jsp:include page="include_common_top.jsp" />
		<!-- include_common_top.jsp end-->
	</div>
	<!-- header end -->
	<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<!-- include_common_left.jsp end-->
		</div>
	<!-- navigation end-->
	<!-- wrapper start -->
	<div id='wrapper'>
		<!-- boardlist info start -->
		<div id='boardlist_info'>
			<ul>
			<li id="boardlist_top" title="게시판상단">자유게시판 <span id='board_info'>문의사항을 자유롭게 작성해주세요.</span></li>
			<!-- 글쓰기 아이콘 -->
			<%if(sUserId == null){ %>
			<li id="boardwrite" title="게시판글쓰기" >
				<img src="image/boardwrite_icon.png" style="cursor: pointer;margin-right: 100px; margin-top: 15px; float: right" onclick="boardCreatebfLogin();"> </li>
			<%} else { %>
			<li id="boardwrite" title="게시판글쓰기" >
				<img src="image/boardwrite_icon.png" style="cursor: pointer;margin-right: 100px; margin-top: 15px; float: right" onclick="boardCreate();"> </li>
			<%} %>
			</ul>
		</div>
		<!-- boardlist info end -->
		
	
		<!-- content start -->
		<!-- include_content.jsp start -->
		<div id='content'>
			<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
						<table style='padding-left:10px; padding-right: 10px' border=0 cellpadding=10px cellspacing=0>
							<tr>
											<!-- &nbsp;&nbsp; <b>게시판 리스트</b> -->
								<td bgcolor='#FFFFFF' height='20'><img alt="" src="image/boardlist_top.png" width=100% height='200px'></td>
							</tr>
							<tr bgcolor='#FFFFFF'>
								<td height='20' class='t1' align='right' valign='botton'>
								총&nbsp;<font color='#62B1B8'><%=boardListPage.pageMaker.getTotCount() %></font>
								건&nbsp;&nbsp;|&nbsp;&nbsp;현재 페이지(&nbsp;<font color='#62B1B8'><%=boardListPage.pageMaker.getCurPage() %></font>
								/ <font color=#000000'><%=boardListPage.pageMaker.getTotPage() %></font>
								)&nbsp;&nbsp;
								</td>
							</tr>
						</table> <br><br>
						<!-- boardsearch start -->
						<ul style="list-style: none; height: 70px; padding-right: 500px" >
							<li style="float: right"><img src='image/mainsearchbtn.png' style="cursor: pointer;margin-left: 10px;margin-top: 15px"  onclick="boardsearch();"></li>
							<li id='boardsearch' title='게시판검색' style="float: right" >
							 	<form id='boardsearchform' method='post'>
							 		<input type='text' name='boardsearchkeyword'  style="border: solid 1px grey; width:600px; height:30px; padding-left: 10px; border-radius: 10px" >
									<input type="hidden" name='searchbtn' value='' >
							 	</form>
							</li>
						</ul>
						<!-- boardsearch end -->
						<!-- list start -->
						<form name='f' method='POST' action='' style="padding-left: 200px; padding-right: 200px; ">
							<table id='boardlist' border='solid 1px' cellpadding='5px' cellspacing='1' width='400' bgcolor='#FFFFFF' style=" border-color: #FFFFFF">
								<tr id='boardlist_tr'>
									<td width=200 align=center bgcolor="#000000" style='color:white'>제 목</td>
									<td width=60 align=center bgcolor="#000000" style='color:white'>작성자</td>
									<td width=80 align=center bgcolor="#000000" style='color:white'>작성일</td>
									<td width=60 align=center bgcolor="#000000" style='color:white'>조회수</td>
								</tr>
								<%
								for(Board board : boardListPage.itemList) {
								%>
								<tr>
									<td width=280 bgcolor='#FFFFFF' style='padding-left: 10px' align='left'>
									<%if(sUserId == null){ %>
										<a href='javascript:boardViewbfLogin();'>
										<%=this.getTitleString(board) %>
										</a>
									<%} else { %>	
										<a href='board_view.jsp?boardno=<%=board.getBoardNo() %>&pageno=<%=boardListPage.pageMaker.getCurPage()%>'>
										<%=this.getTitleString(board) %>
										</a>
									<%} %>	
									
									<%if(boardCommentService.findBoardCommentList(board.getBoardNo()).size() > 0){ %>
									<img src='image/boardcomment.png'>
									<%} %>
									</td>
									<td width=120 bgcolor='#FFFFFF' align='center'>
									<%=board.getUserId() %>
									</td>
									<td width=120 bgcolor='#FFFFFF' align='center'>
									<%=board.getRegDate().toString().substring(0, 10) %>
									</td>
									<td width=70 bgcolor='#FFFFFF' align='center'>
									<%=board.getReadCount() %>
									</td>
								</tr>
								<%
								}
								%>
							</table>
							<!-- list end -->
						</form><br>
						<!-- paging start -->
						<table id='boardlist_paging' border="0" cellpadding="0" cellspacing="1" width="590">
							<tr>
								<td align='center'>
								<% if(boardListPage.pageMaker.getCurBlock() > 1){ %>
									<a href='board_list.jsp?pageno=<%=boardListPage.pageMaker.getBlockBegin()-PageMaker.BLOCK_SCALE%>'>◀◀</a>&nbsp;&nbsp;
								<%}%>
								<% if(boardListPage.pageMaker.getPrevPage() > 0){ %>	
									<a href='board_list.jsp?pageno=<%=boardListPage.pageMaker.getPrevPage()%>'>◀</a>&nbsp;&nbsp;
								<%}%>
								<% for(int i=boardListPage.pageMaker.getBlockBegin(); i<=boardListPage.pageMaker.getBlockEnd(); i++){ 
										if(boardListPage.pageMaker.getCurPage() == i){
								%>
								<font color='#62B1B8'><strong><%=i %></strong></font>&nbsp;
								<%} else{ %>
								<a href='board_list.jsp?pageno=<%=i %>'><strong><%=i %></strong></a>&nbsp;
								<%
									 }
								 }%>	
								 	<%if(boardListPage.pageMaker.getNextPage() <= boardListPage.pageMaker.getTotPage()) {%>
									<a href='board_list.jsp?pageno=<%=boardListPage.pageMaker.getNextPage()%>'>▶</a>&nbsp;&nbsp;
									<%} %>
									<%if(boardListPage.pageMaker.getTotBlock() > boardListPage.pageMaker.getCurBlock()) {%>
									<a href='board_list.jsp?pageno=<%=boardListPage.pageMaker.getBlockBegin()+PageMaker.BLOCK_SCALE%>'>▶▶</a>&nbsp;&nbsp;
									<%} %>
								</td>
							</tr>
						</table>
						<!-- paging end -->
				</tr>
			</table>
		</div>
		<!-- include_content.jsp end -->
		<!-- content end -->
	</div>
	<!-- wrapper end -->
	<div id='footer'>
		<!-- include_common_bottom.jsp start-->
		<jsp:include page="include_common_bottom.jsp" />
		<!-- include_common_bottom.jsp end-->
	</div>
</div>
<!-- container end -->
</body>
</html>