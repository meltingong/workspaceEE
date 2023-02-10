package com.itwill.board;
/*
이름        널?       유형             
--------- -------- -------------- 
BOARDNO   NOT NULL NUMBER         
TITLE     NOT NULL VARCHAR2(100)  
USERID             VARCHAR2(100)  
CONTENT   NOT NULL VARCHAR2(2000) 
REGDATE            DATE           
READCOUNT          NUMBER         
GROUPNO   NOT NULL NUMBER         
STEP      NOT NULL NUMBER         
DEPTH              NUMBER 
 */

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Board {
	private int boardNo;
	private String title;
	// FK (userinfo 참조)
	private String userId;
	private String content;
	private Date regDate;
	private int readCount;
	//글의 논리적인 순서번호를 관리하기 위한 필드 (3개)
	private int groupNo;
	private int step;
	private int depth;
	// List<BoardComment> 
	private List<BoardComment> boardCommentList;
	

	public Board() {
		this.boardCommentList = new ArrayList<BoardComment>();
	}
	
	public Board(int boardNo, String title, String userId, String content, Date regDate, int readCount, int groupNo,
			int step, int depth) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.userId = userId;
		this.content = content;
		this.regDate = regDate;
		this.readCount = readCount;
		this.groupNo = groupNo;
		this.step = step;
		this.depth = depth;
		this.boardCommentList = new ArrayList<BoardComment>();
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}
	public List<BoardComment> getBoardCommentList() {
		return boardCommentList;
	}

	public void setBoardCommentList(List<BoardComment> boardCommentList) {
		this.boardCommentList = boardCommentList;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", userId=" + userId + ", content=" + content
				+ ", regDate=" + regDate + ", readCount=" + readCount + ", groupNo=" + groupNo + ", step=" + step
				+ ", depth=" + depth + ", boardCommentList=" + boardCommentList + "]\n";
	}

	
}
