package com.itwill.board;

import java.util.List;

import com.itwill.board.util.PageMaker;

public class BoardService {
	private static BoardService _instance;
	private BoardDao boardDao;
	
	public BoardService() throws Exception{
		boardDao = new BoardDao();
	}
	public static BoardService getInstance() throws Exception{
		if (_instance == null) {
			// 첫번째로 생성할 때 객체 생성
			_instance = new BoardService();
		}
		// 첫번째가 아니라면 만들어진 _instance 객체 반환
		return _instance;
	}
	
	/*
	 * 게시글 쓰기
	 */
	public int create(Board board) throws Exception{
		return boardDao.create(board);
	}
	/*
	 * 답글 쓰기
	 */
	public int createReply(Board board) throws Exception{
		return boardDao.createReply(board);
	}
	/*
	 * 게시글 1개 보기
	 */
	public Board findBoard(int boardNo) throws Exception{
		return boardDao.findBoard(boardNo);
	}
	/*
	 * 게시글 리스트 보기
	 */
	public BoardListPageMakerDto findBoardList(int currentPage) throws Exception{
		// 전체 글의 수
		int totalRecordCount = boardDao.getBoardCount();
		// paging 계산 (PageMaker)
		PageMaker pageMaker = new PageMaker(totalRecordCount, currentPage);
		// 게시글 데이터 얻기
		List<Board> boardList = boardDao.findBoardList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		BoardListPageMakerDto pageMakerBoardList = new BoardListPageMakerDto();
		pageMakerBoardList.itemList = boardList;
		pageMakerBoardList.pageMaker = pageMaker;
		return pageMakerBoardList;
	}
	/*
	 * 키워드로 검색된 게시글 리스트 보기
	 */
	public BoardListPageMakerDto findSearchBoardList(int currentPage, String keyword) throws Exception{
		// 전체 글의 수
		int totalRecordCount = boardDao.getBoardCount();
		// paging 계산 (PageMaker)
		PageMaker pageMaker = new PageMaker(totalRecordCount, currentPage);
		// 게시글 데이터 얻기
		List<Board> boardList = boardDao.findSearchBoardList(pageMaker.getPageBegin(), pageMaker.getPageEnd(),keyword);
		BoardListPageMakerDto pageMakerBoardList = new BoardListPageMakerDto();
		pageMakerBoardList.itemList = boardList;
		pageMakerBoardList.pageMaker = pageMaker;
		return pageMakerBoardList;
	}
	
	/*
	 * 게시글 수정
	 */
	public int update(Board board) throws Exception{
		return boardDao.update(board);
	}
	/*
	 * 게시글 삭제
	 */
	public int remove(int boardNo) throws Exception, BoardException{
		Board tempBoard = boardDao.findBoard(boardNo);
		boolean rExist = boardDao.countReply(tempBoard);
		if (rExist) {
			// 답글 존재
			throw new BoardException("답글이 있는 게시글은 삭제 불가능합니다.");
		} else {
			// 답글 존재 X
			return boardDao.remove(tempBoard.getBoardNo());
		}
		
	}
	/*
	 * 조회수 증가
	 */
	public void updateHitCount(int boardNo) throws Exception{
		boardDao.increaseReadCount(boardNo);
	}
	
}
