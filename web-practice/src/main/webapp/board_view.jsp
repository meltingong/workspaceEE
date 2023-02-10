<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.board.BoardCommentService"%>
<%@page import="com.itwill.board.BoardComment"%>
<%@page import="com.itwill.board.Board"%>
<%@page import="com.itwill.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
<%
/*
세션의 아이디와 게시판 작성자 아이디가 일치하면 수정, 삭제 버튼 생성
일치하지 않으면 수정, 삭제 버튼 X
*/

UserService userService = new UserService();
User user = userService.findUser(sUserId);


Integer boardno = null;
int pageno = 1;
try {
	boardno = Integer.parseInt(request.getParameter("boardno"));
	pageno = Integer.parseInt(request.getParameter("pageno"));
} catch (Exception e) {

}
// boardno null 이면 게시판리스트로 이동
if (boardno == null) {
	//목록으로이동
	response.sendRedirect("board_list.jsp?pageno=" + pageno);
	return;
}
// boardno 로 board객체 찾아 생성
Board board = BoardService.getInstance().findBoard(boardno);
if (board == null) {
	response.sendRedirect("board_list.jsp?pageno=" + pageno);
	return;
}
// 조회수 증가
BoardService.getInstance().updateHitCount(boardno);
// 댓글 리스트
BoardCommentService boardCommentService = new BoardCommentService();
List<BoardComment> boardCommentList = boardCommentService.findBoardCommentList(boardno);
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
	function boardCreate(){
		f.action = "board_write.jsp";
		f.submit();
	}
	function boardReplyCreate(){
		document.f.action = "board_reply_write.jsp";
		document.f.method = "POST";
		document.f.submit();
	}

	function boardUpdate() {
		document.f.action = "board_modify.jsp";
		document.f.submit();
	}
	function boardRemove(){
		if(confirm("정말 삭제하시겠습니까?")){
			document.f.action = "board_remove_action.jsp";
			document.f.submit();
		}
	}
	function boardList(){
		f.action = "board_list.jsp?pageno="+<%=pageno%>;
		f.submit();
	}
	function writeComment(){
		let commentform = document.getElementById('commentform');
		commentform.submit();
	}
	function updateComment(f){
		alert('댓글 수정이 완료되었습니다.');
		let commenteditform = document.getElementById(f);
		commenteditform.submit();
	}
	function deleteComment(commentNo, boardNo, pageNo){
		let result = confirm(commentNo + "번 댓글을 삭제합니다.");
		if(result){
			location.href = 'board_comment_delete_action.jsp?commentno='+commentNo
					+'&boardno='+boardNo+'&pageno='+pageNo;
		}
	}
	function toggleCommentStatus(boardNo, edit) {
		document.getElementById("commentview" + boardNo).style.display = 
		edit ? 'none' : 'block';
		document.getElementById("commentedit" + boardNo).style.display = 
		edit ? 'block' : 'none';
	}
	function cancelUpdateComment(){
		alert('댓글 수정이 취소되었습니다.');
		location.href = 'board_view.jsp';
	}
	
	
</script>
</head>
<body bgcolor='#FFFFFF' text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
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
								<tr>
									<td bgcolor="#FFFFFF" height="22">
									<img alt="" src="image/boardview_top.png" width=100% height='200px'>
									</td>
								</tr>
							</table> <br> 
							<!-- view Form start-->
							<form name="f" method="post" style="padding-left: 200px; padding-right: 200px; ">
								<input type="hidden" name="boardno" value="<%=board.getBoardNo()%>">
								<input type="hidden" name="pageno" value="<%=pageno%>">
								<table border='solid 1px' cellpadding='5px' cellspacing='1' width='400' bgcolor='#FFFFFF' style=" border-color: #FFFFFF">
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">작성자</td>
										<td width=300 bgcolor="#FFFFFF" style="padding-left: 10px" align="left">
										<%=board.getUserId() %></td>
									</tr>

									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">제 목</td>
										<td width=300 bgcolor="#FFFFFF" style="padding-left: 10px" align="left">
										<%=board.getTitle()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#000000" style='color:white' height="22">내 용</td>
										<td width=300 bgcolor="#FFFFFF" height="180px" style="padding-left: 10px" align="left">
										<%=board.getContent().replace("\n","<br/>")%><br />
										</td>
									</tr>
								</table>
							</form> <br>
							<!-- view Form end -->
							<table width=590 border=0 cellpadding=0 cellspacing=0 style= 'height: 200px'>
								<tr>
									<td align=center height=80>
										<input type="button" value="글쓰기" onClick="boardCreate()"> &nbsp;&nbsp; 
										<input type="button" value="답글쓰기" onClick="boardReplyCreate()"> &nbsp;&nbsp; 
										<%if(sUserId.equals(board.getUserId())){ %>
										<input type="button" value="수 정" onClick="boardUpdate()"> &nbsp;&nbsp;
										<input type="button" value="삭 제" onClick="boardRemove()"> &nbsp;&nbsp; 
										<%} %>
										<input type="button" value="게시판 리스트" onClick="boardList()"></td>
								</tr>
							</table>
							<form id="commentform" action="board_comment_write_action.jsp" method="post" >
								<input type="hidden" name="boardno" value="<%=board.getBoardNo()%>" /> 
								<input type="hidden" name="pageno" value="<%=pageno%>" />
								<table border="0" cellpadding="10" cellspacing="1">
									<tr>
										<td bgcolor="ffffff" align="left">
										<textarea name="content" rows="5" style="width: 100%; padding-left: 10px; padding-top: 10px" placeholder=" 댓글을 작성해주세요."></textarea></td>
										<td bgcolor="ffffff" width="30px" style="padding-left: 50px;">
										<input type="button" value="댓글등록" onClick="writeComment();"></td>
									</tr>
								</table>
							</form>			
							<%
							 if (boardCommentList.size() == 0) {
							 %>
							<div id="nodata"  style="text-align: center; color: #62B1B8;  ">
								<b><br>작성된 댓글이 없습니다.</b><br><br><br>
							</div> 
							<%
							 } else {
							 %>
							<table style="padding-left: 10px; width: 100%" background="gray" border="0" cellpadding="0" cellspacing="1">
								<%
								//for (BoardComment boardComment : board.getBoardCommentList()) {
								for (BoardComment boardComment : boardCommentList) {
								%>
								<tr>
									<td bgcolor="ffffff" >
										<div
											style=" background-color: #000000; padding: 0px; margin: 0px"
											id="commentview<%=boardComment.getCommentNo()%>">
											<table>
												<tr>
												<%-- 	
												<td style="border: 1px solid; width: 50px;font-size:1pt;padding:3px"><%=bcomment.getWriter()%><br />
														<%=bcomment.getRegDate()%></td>
												 --%>
													<td bgcolor="#000000" style="color:white; width: 75px;padding:3px">
													<img style="vertical-align:top" width="25px" height="25px" src='image/comment.png'>
													<p style="display: inline-block;margin: 0px;font-size:12px;padding-left: 10px"><%=boardComment.getUserId()%><br><%=boardComment.getC_regDate()%></p></td> 		
													<td bgcolor="#FFFFFF"style="width: 400px; padding-left: 10px; margin: ; text-align: left"><%=boardComment.getC_content().replace("\r\n", "<br />")%>
													</td>

													<%if(sUserId.equals(boardComment.getUserId())){ %>
													<td style="width: 40px; font-size:12px; align-content: center">
														<input type="button" value="수정" onclick="toggleCommentStatus(<%=boardComment.getCommentNo()%>, true);" />
														<input type="button" value="삭제" onclick="deleteComment(<%=boardComment.getCommentNo()%>,<%=board.getBoardNo()%>,<%=pageno%>)" /></td>
													<%}else{ %>
													<td style="width: 48px; font-size:12px; align-content: center"></td>
													<%} %>
												</tr>
											</table>
										</div>

										<div id='commentedit<%=boardComment.getCommentNo()%>'style="background-color: #000000; padding: 0px; margin: 0px; display: none">
											<table>
												<tr>
													
													<%-- <td style="border: 1px solid; width: 50px;font-size:1pt;padding:3px""><%=bcomment.getWriter()%><br />
														<%=bcomment.getRegDate()%></td>
													 --%>
													<td bgcolor="#000000" style="color:white; width: 75px; padding:0px">
													<img style="vertical-align:top" width="25px" height="25px" src='image/comment.png'>
													<p style="display: inline-block;margin: 0px;padding: 0px"><%=boardComment.getUserId()%><br><%=boardComment.getC_regDate()%></p></td> 			
													<td style="width: 400px; padding-left: 10px; margin: 0px;">
														<form id="commenteditform<%=boardComment.getCommentNo()%>"
															action="board_comment_update_action.jsp" method="post" style=" padding: 0px; margin: 0px">
															<input type="hidden" name="boardno" value="<%=board.getBoardNo()%>" /> 
															<input type="hidden" name="pageno" value="<%=pageno%>" /> 
															<input type="hidden" name="commentno" value="<%=boardComment.getCommentNo()%>" />
															<textarea name="content" rows="3"
																style="width: 100%; padding-left: 10px; "><%=boardComment.getC_content()%></textarea>
														</form>
													</td>
													<td bgcolor="#000000" style="color:white; width: 40px; padding-left: 15px; align-content: center">
													<input type="button" value="수정" onclick="updateComment('commenteditform<%=boardComment.getCommentNo()%>');" />
													<input type="button" value="취소" onclick="toggleCommentStatus(<%=boardComment.getCommentNo()%>, false);" /></td>
												</tr>
											</table>

										</div>
									</td>
								</tr>
								<%
								}
								%>
							</table> <!-- ------------ --> 
							<%
							 }
							 %>
							</td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
	</div>
		<br/>
	<!--container end-->
	<div id="footer">
	<!-- include_common_bottom.jsp start-->
	<jsp:include page="include_common_bottom.jsp" />
	<!-- include_common_bottom.jsp end-->
</div>
</body>
</html>