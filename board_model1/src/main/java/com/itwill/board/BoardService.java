package com.itwill.board;

import java.util.List;

import com.itwill.board.util.PageMaker;

public class BoardService {
	private static BoardService _instance;
	
	private BoardDao boardDao;
	private  BoardService() throws Exception{
		boardDao=new BoardDao();
	}
	public static BoardService getInstance() throws Exception{
		if(_instance==null) {
			_instance=new BoardService();
		}
		return _instance;
	}
	/*
	 * 게시물삭제
	 */
	public int remove(int boardno) throws Exception,BoardException{
		Board tempBoard=boardDao.findBoard(boardno);
		boolean rExist=boardDao.countReplay(tempBoard);
		System.out.println("답글존재여부:"+rExist);
		if(boardDao.countReplay(tempBoard)){
			//답글존재
			throw new BoardException("답글이 있는 게시글은 삭제앙돼요!!");
		}else{
			//답글안존재
			return boardDao.remove(tempBoard.getBoardNo());
		}
		//return getBoardDao().remove(boardno);
	}
	/*
	 * 게시물생성
	 */
	public int create(Board board)throws Exception{
		return  boardDao.create(board);
	}
	/*
	 * 답글쓰기
	 */
	public int createReplay(Board board) throws Exception{
		return boardDao.createReply(board);
	}
	/*
	 * 게시물 1개
	 */
	public Board findBoard(int boardNo)throws Exception{
		Board board=boardDao.findBoard(boardNo);
		return board;
	}
	public void updateHitCount(int boardNo) throws Exception{
		boardDao.increaseReadCount(boardNo);
	}
	/*
	 * 게시물리스트
	 */
	public BoardListPageMakerDto findBoardList(int currentPage) throws Exception{
		//1.전체글의 갯수
		int totalRecordCount = boardDao.getBoardCount();
		
		//2.paging계산(PageMaker 유틸클래스)
		PageMaker pageMaker=new PageMaker(totalRecordCount,currentPage);
	
		//3.게시물데이타 얻기
		List<Board> boardList=
				boardDao.findBoardList(pageMaker.getPageBegin(),
											pageMaker.getPageEnd());
		
		BoardListPageMakerDto pageMakerBoardList=new BoardListPageMakerDto();
		pageMakerBoardList.itemList=boardList;
		pageMakerBoardList.pageMaker=pageMaker;
		return pageMakerBoardList;
	}
	
	/*
	 * 게시물수정
	 */
	public int update(Board board) throws Exception {
		return boardDao.update(board);
	}
	
}
