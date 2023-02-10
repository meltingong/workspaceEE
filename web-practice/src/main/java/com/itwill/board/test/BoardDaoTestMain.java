package com.itwill.board.test;

import com.itwill.board.Board;
import com.itwill.board.BoardDao;

public class BoardDaoTestMain {

	public static void main(String[] args) throws Exception{
		
		BoardDao boardDao = new BoardDao();
		Board newBoard = new Board(0,"제목","test1","내용",null,0,0,1,0);
		System.out.println(boardDao.create(newBoard));
		//System.out.println(boardDao.createReply(new Board(4,"제목2","guard2","내용2",null,0,4,1,0)));
		System.out.println(boardDao.findBoard(1));
		System.out.println(boardDao.findBoardList(1,10));
		System.out.println(boardDao.findSearchBoardList(1,10,"반지"));
		System.out.println(boardDao.countReply(newBoard));
		System.out.println(boardDao.update(new Board(1,"변경",null,"변경",null,0,0,1,0)));
		boardDao.increaseReadCount(4);
		System.out.println(boardDao.getBoardCount());
	}

}
