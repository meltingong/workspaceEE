<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
<%
if(request.getMethod().equalsIgnoreCase("get")){
	response.sendRedirect("board_list.jsp");
	return;
}

Board board = new Board();
board.setTitle(request.getParameter("title"));
board.setUserId(sUserId);
board.setContent(request.getParameter("content"));

BoardService boardService = new BoardService();
boardService.create(board);

response.sendRedirect("board_list.jsp");


%>