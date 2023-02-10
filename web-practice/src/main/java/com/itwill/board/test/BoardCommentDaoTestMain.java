package com.itwill.board.test;

import com.itwill.board.Board;
import com.itwill.board.BoardComment;
import com.itwill.board.BoardCommentDao;
import com.itwill.board.BoardDao;

public class BoardCommentDaoTestMain {

	public static void main(String[] args) throws Exception{
			
			
			BoardCommentDao boardCommentDao = new BoardCommentDao();
			BoardComment newBoardComment = new BoardComment(0,1,"guard1","댓글쓰기",null);
			System.out.println(boardCommentDao.create(newBoardComment));
			System.out.println(boardCommentDao.findBoardCommentList(1));
			System.out.println(boardCommentDao.countComment(2));
			System.out.println(boardCommentDao.update(new BoardComment(2,0,"guard2","댓글수정",null)));
			System.out.println(boardCommentDao.countComment(3));
		}



}
