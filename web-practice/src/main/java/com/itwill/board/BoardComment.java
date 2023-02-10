package com.itwill.board;
/*
이름        널?       유형            
--------- -------- ------------- 
COMMENTNO NOT NULL NUMBER        
BOARDNO            NUMBER        
USERID             VARCHAR2(100) 
C_CONTENT NOT NULL VARCHAR2(500) 
C_REGDATE          DATE    
 */

import java.util.Date;

public class BoardComment {

	private int commentNo;
	// FK(board 참조)
	private int boardNo;
	// FK(userinfo 참조)
	private String userId;
	private String c_content;
	private Date c_regDate;
	
	
	public BoardComment() {
		// TODO Auto-generated constructor stub
	}


	public BoardComment(int commentNo, int boardNo, String userId, String c_content, Date c_regDate) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.userId = userId;
		this.c_content = c_content;
		this.c_regDate = c_regDate;
	}


	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getC_content() {
		return c_content;
	}


	public void setC_content(String c_content) {
		this.c_content = c_content;
	}


	public Date getC_regDate() {
		return c_regDate;
	}


	public void setC_regDate(Date c_regDate) {
		this.c_regDate = c_regDate;
	}


	@Override
	public String toString() {
		return "BoardComment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", userId=" + userId + ", c_content="
				+ c_content + ", c_regDate=" + c_regDate + "]\n";
	}
	
	
	
	
}
