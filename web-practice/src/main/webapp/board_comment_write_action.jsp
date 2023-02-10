<%@page import="com.itwill.board.BoardCommentService"%>
<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.BoardComment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
	
<%
BoardComment boardComment = new BoardComment();
boardComment.setC_content(request.getParameter("content"));
boardComment.setUserId(sUserId);

int boardno = Integer.parseInt(request.getParameter("boardno"));
boardComment.setBoardNo(boardno);

BoardCommentService boardCommentService = new BoardCommentService();
boardCommentService.create(boardComment);

int pageno = Integer.parseInt(request.getParameter("pageno"));
response.sendRedirect("board_view.jsp?boardno="+boardno+"&pageno="+pageno);


%>