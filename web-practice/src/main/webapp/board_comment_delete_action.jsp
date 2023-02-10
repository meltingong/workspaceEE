<%@page import="com.itwill.board.BoardCommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String commentNoStr = request.getParameter("commentno");
int commentNo = Integer.parseInt(commentNoStr);

// 댓글 번호에 해당하는 댓글 삭제
BoardCommentService boardCommentService = new BoardCommentService();
boardCommentService.remove(commentNo);

int boardno = Integer.parseInt(request.getParameter("boardno"));
int pageno = Integer.parseInt(request.getParameter("pageno"));

response.sendRedirect("board_view.jsp?boardno="+boardno+"&pageno="+pageno);


%>