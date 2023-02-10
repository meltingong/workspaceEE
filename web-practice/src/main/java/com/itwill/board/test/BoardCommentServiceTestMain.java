package com.itwill.board.test;

import com.itwill.board.Board;
import com.itwill.board.BoardComment;
import com.itwill.board.BoardCommentService;
import com.itwill.board.BoardService;

public class BoardCommentServiceTestMain {

	public static void main(String[] args) throws Exception{
		BoardCommentService boardCommentService = new BoardCommentService();
		
		BoardComment newBoardComment = new BoardComment(0, 3, "guard3", "서비스내용", null);
		System.out.println(boardCommentService.create(newBoardComment));
		System.out.println(boardCommentService.findBoardCommentList(3));
		BoardComment updateBoardComment = new BoardComment(4, 0, "guard3", "서비스수정수정", null);
		System.out.println(boardCommentService.update(updateBoardComment));
		boardCommentService.remove(1);

	}


}
