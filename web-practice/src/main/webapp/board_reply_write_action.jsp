<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
<%
Board board = new Board();
board.setBoardNo(Integer.parseInt(request.getParameter("boardno")));

board.setTitle(request.getParameter("title"));
board.setUserId(sUserId);
board.setContent(request.getParameter("content"));

BoardService.getInstance().createReply(board);

String pageno = "1";
if(request.getParameter("pageno") != null){
	pageno = request.getParameter("pageno");
}
response.sendRedirect("board_list.jsp?pageno="+pageno);



%>