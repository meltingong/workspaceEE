<%@page import="com.itwill.board.BoardException"%>
<%@page import="com.itwill.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Integer boardno = null;
Integer pageno = null;
try {
	boardno = Integer.valueOf(request.getParameter("boardno"));
	pageno = Integer.valueOf(request.getParameter("pageno"));
}catch(Exception ex){
	
}

boolean result = true;
String msg = "";
if(boardno == null){
	result = false;
	msg = "게시글 삭제에 실패하였습니다.";
} else {
	try{
		BoardService.getInstance().remove(boardno);
		result = true;
		msg = "게시글 삭제에 성공하였습니다.";
	} catch (BoardException e){
		result = false;
		msg = "삭제 실패 :"+ e.getMessage();
	}
}
%>
<script type="text/javascript">
<% if (result) {%>
alert('<%=msg%>');
location.href = 'board_list.jsp?pageno=<%=pageno%>';
<%} else {%>
alert('<%=msg%>');
location.href = 'board_list.jsp?pageno=<%=pageno%>';
<%}%>


</script>