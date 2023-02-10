package com.itwill.board;
// 게시판과 관련된 사용자 정의 예외 클래스
public class BoardException extends Exception{

	public BoardException() {
		this("게시판 관련 에러가 발생했습니다.");
	}
	public BoardException(String errorMsg) {
		super(errorMsg);
	}
	public BoardException(String errorMsg, Throwable cause) {
		super(errorMsg, cause);
	}

}
