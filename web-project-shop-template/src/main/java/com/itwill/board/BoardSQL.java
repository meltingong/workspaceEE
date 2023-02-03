package com.itwill.board;

public class BoardSQL {
	/*
	insert into board (boardno, title, writer, content, groupno, step) values(board_sequence.nextval, ?, ?, ?,board_sequence.currval, 1);
	 */
	public static final String BOARD_INSERT=
			"insert into board (boardno, title, writer, content, groupno, step) values(board_sequence.nextval, ?, ?, ?,board_sequence.currval, 1)";
	/*
	 update board set step = step + 1 where step > ? and groupno = ?
	 insert into board(boardno, title, writer, content,groupno, step, depth) values(board_sequence.nextVal, ?, ?, ?,?, ?, ?)
	 */
	public static final String BOARD_UPDATE_STEP_REPLY=
			"update board set step = step + 1 where step > ? and groupno = ?";
	public static final String BOARD_INSERT_REPLY=
			"insert into board(boardno, title, writer, content,groupno, step, depth) values(board_sequence.nextVal, ?, ?, ?,?, ?, ?)";
	/*
	 select * from(
	 				select rownum idx,
	 					   sorted_board.* from(
	 					   						select boardno, title, 
	 											       writer,regdate, 
	 												   readcount,groupno, 
	 												   step, depth 
	 					  						 	   from board 
	 					  						 	   order by groupno desc,step asc
	 					  					  ) sorted_board
	 			   ) rownum_board
	 where idx >= ? and idx <= ?
	 */
	public static final String BOARD_SELECT_LIST_BY_ROWNUM_RANGE=
			"SELECT * FROM ( "
							+ "SELECT rownum idx, s.* FROM( "
														+ "SELECT boardno, title, writer,regdate,"
																+ "readcount,groupno, step, depth "
															+ " FROM board ORDER BY groupno DESC, step ASC "
														 + ") s"
					  +" ) "
			+ "WHERE idx >= ? AND idx <= ?";
	/*
	select count(*) cnt from board where groupno = ? and depth >= ? and step >= ? order by step,depth asc
	 */
	public static final String BOARD_SELECT_REPLY_COUNT_BY_GROUPNO_DEPTH_STEP=
			"select count(*) cnt from board where groupno = ? and depth >= ? and step >= ? order by step,depth asc";
	/*
	 delete board where boardno = ?
	 */
	public static final String BOARD_DELETE_BY_BOARDNO=
			"delete board where boardno = ?";
	
	/*
	update board  set title = ?, content = ? ,writer = ? where boardno = ?
	 */
	public static final String BOARD_UDATE_BY_BOARDNO=
			"update board  set title = ?, content = ? ,writer = ? where boardno = ?";
	/*
	select boardno, title, writer, content,regdate, readcount,groupno, step, depth from board where boardno = ?
	 */
	public static final String BOARD_SELECT_BY_BOARDNO=
			"select boardno, title, writer, content,regdate, readcount,groupno, step, depth from board where boardno = ?";
	/*
	update board set readcount = readcount + 1 where boardno = ?
	 */
	public static final String BOARD_UPDATE_READ_COUNT_BY_BOARDNO=
			"update board set readcount = readcount + 1 where boardno = ?";
	
	/*
	select count(*) from board
	 */
	public static final String BOARD_SELECT_COUNT_TOT_RECORD=
			"select count(*) from board";
}
