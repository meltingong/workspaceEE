package com.itwill.board;

import java.util.List;

public class BoardCommentService {

	private BoardCommentDao boardCommentDao;
	
	public BoardCommentService() throws Exception{
		this.boardCommentDao = new BoardCommentDao();
	}
	/*
	 * 댓글 쓰기
	 */
	public int create(BoardComment boardComment) throws Exception{
		return boardCommentDao.create(boardComment);
	}
	/*
	 * 댓글 보기
	 */
	public List<BoardComment> findBoardCommentList(int boardNo) throws Exception{
		return boardCommentDao.findBoardCommentList(boardNo);
	}
	/*
	 * 댓글 수정
	 */
	public int update(BoardComment boardComment) throws Exception{
		return boardCommentDao.update(boardComment);
	}
	/*
	 * 댓글 삭제
	 */
	public int remove(int commentNo) throws Exception{
		return boardCommentDao.remove(commentNo);
	}
	
}
