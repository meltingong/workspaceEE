<%@page import="com.itwill.board.BoardCommentService"%>
<%@page import="com.itwill.board.BoardComment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardComment boardComment = new BoardComment();
boardComment.setCommentNo(Integer.parseInt(request.getParameter("commentno")));
boardComment.setC_content(request.getParameter("content"));

BoardCommentService boardCommentService = new BoardCommentService();
boardCommentService.update(boardComment);

int boardno = Integer.parseInt(request.getParameter("boardno"));
int pageno = Integer.parseInt(request.getParameter("pageno"));

response.sendRedirect("board_view.jsp?boardno="+boardno+"&pageno="+pageno);


%>
