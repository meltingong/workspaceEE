package com.itwill.board.test;

import com.itwill.board.Board;
import com.itwill.board.BoardService;

public class BoardServiceTestMain {

	public static void main(String[] args) throws Exception{
		BoardService boardService = new BoardService();
		/*
		Board newBoard = new Board(0,"서비스","서비스","서비스",null,0,0,1,0);
		System.out.println(boardService.create(newBoard));
		Board replyBoard = new Board(10,"서비스","서비스","서비스",null,0,10,1,0);
		System.out.println(boardService.createReply(replyBoard));
		System.out.println(boardService.findBoard(6));
		System.out.println(boardService.findBoardList(1));
		*/
		System.out.println(boardService.findSearchBoardList(1, "반지"));
		Board updateBoard = new Board(11,"서비스dd","서비스dd","서비스dd",null,0,11,1,0);
		System.out.println(boardService.update(updateBoard));
		boardService.remove(13);

	}

}
