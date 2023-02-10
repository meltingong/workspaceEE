package com.itwill.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.common.DataSourceFactory;
import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductSQL;


public class BoardDao {
	private DataSource dataSource;
	

	public BoardDao() throws Exception{
		dataSource=DataSourceFactory.getDataSource();
	}
	
	/*
	 * 게시글 추가
	 */
	public int create(Board board) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "insert into board (boardno, title, userid, content, groupno, step,depth)"
					+ " values(board_boardno_seq.nextval,?,?,?,board_boardno_seq.currval,1,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getUserId());
			pstmt.setString(3, board.getContent());

			int result = pstmt.executeUpdate();
			return result;
		} finally {
			pstmt.close();
			con.close();
		}
	}
	/*
	 * 답글 추가
	 */
	public int createReply(Board board) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			// 답글 작성할 원글의 정보 조회
			Board tempBoard = this.findBoard(board.getBoardNo());
			// 영향 받는 기존 글들의 논리적인 순서 번호 변경
			con = dataSource.getConnection();
			String sql = "update board set step = step+1 where step>? and groupno=?";
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, board.getStep());
			pstmt.setInt(2, board.getGroupNo());
			pstmt.executeUpdate();
			pstmt.close();
			
			// 답글 추가
			sql = "insert into board (boardno, title, userid, content, groupno, step,depth) "
					+ " values(board_boardno_seq.nextval,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getUserId());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, tempBoard.getGroupNo());
			pstmt.setInt(5, tempBoard.getStep()+1);
			pstmt.setInt(6, tempBoard.getDepth()+1);
			count = pstmt.executeUpdate();
			
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return count;
	}
	/*
	 * 게시글 번호(boardno)로 해당 게시글 보기 
	 */
	public Board findBoard(int boardNo) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		try {
			con = dataSource.getConnection();
			StringBuffer sql = new StringBuffer(300);
			sql.append("select * from board");
			sql.append(" where boardno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setUserId(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setRegDate(rs.getDate(5));
				board.setReadCount(rs.getInt(6));
				board.setGroupNo(rs.getInt(7));
				board.setStep(rs.getInt(8));
				board.setDepth(rs.getInt(9));
			}
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return board;
	}
	
	/*
	 * 게시글 리스트 보기 (게시글 시작번호, 게시글 끝번호)
	 */
	public List<Board> findBoardList(int start, int last) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> boardList = new ArrayList<Board>();
		try {
			con = dataSource.getConnection();
			StringBuffer sql = new StringBuffer(500);
			sql.append("select * from");
			sql.append(" (select rownum idx, s.* from");
			sql.append(" (select boardno, title, userid, regdate, readcount, groupno, step, depth from board");
			sql.append(" order by groupno desc, step asc) s )");
			sql.append(" where idx>=? and idx <=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, last);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board();
				board.setBoardNo(rs.getInt(2));
				board.setTitle(rs.getString(3));
				board.setUserId(rs.getString(4));
				board.setRegDate(rs.getDate(5));
				board.setReadCount(rs.getInt(6));
				board.setGroupNo(rs.getInt(7));
				board.setStep(rs.getInt(8));
				board.setDepth(rs.getInt(9));
				boardList.add(board);
			}

		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception ex) {
				}
		}
		return boardList;
	}
	/*
	 * 답글 존재 여부 확인
	 */
	public boolean countReply(Board board) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Boolean isExist = false;
		int cnt = 0;
		try {
			con = dataSource.getConnection();
			StringBuffer sql = new StringBuffer(300);
			sql.append("select count(*) cnt from board");
			sql.append(" where groupno=? and step>=? and depth>=?");
			sql.append(" order by step asc, depth asc");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, board.getGroupNo());
			pstmt.setInt(2, board.getStep());
			pstmt.setInt(3, board.getDepth());
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
			if (cnt > 1) {
				isExist = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return isExist;
	}
	/*
	 * 게시글 삭제
	 */
	public int remove(int boardNo) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			String sql = "delete board where boardno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return count;
	}
	/*
	 * 게시글 내용 수정
	 */
	public int update(Board board) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			String sql = "update board set title=?,content=? where boardno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getBoardNo());
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return count;
	}
	/*
	 * 게시글 조회수 1 증가
	 */
	public void increaseReadCount(int number) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "update board set readcount=readcount+1 where boardno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
	}
	/*
	 * 게시글 총 개수 조회
	 */
	public int getBoardCount() throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			String sql = "select count(*) cnt from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) 
				count = rs.getInt("cnt");
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return count;
	}
	/*
	 * 게시판 title 키워드로 검색
	 */
	public List<Board> findSearchBoardList(int start, int last, String keyword) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> boardList = new ArrayList<Board>();
		try {
			con = dataSource.getConnection();
			StringBuffer sql = new StringBuffer(500);
			sql.append("select * from");
			sql.append(" (select rownum idx, s.* from");
			sql.append(" (select boardno, title, userid, regdate, readcount, groupno, step, depth from board");
			sql.append("  where title like ?");
			sql.append(" order by groupno desc, step asc) s )");
			sql.append(" where idx>=? and idx <=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, last);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board();
				board.setBoardNo(rs.getInt(2));
				board.setTitle(rs.getString(3));
				board.setUserId(rs.getString(4));
				board.setRegDate(rs.getDate(5));
				board.setReadCount(rs.getInt(6));
				board.setGroupNo(rs.getInt(7));
				board.setStep(rs.getInt(8));
				board.setDepth(rs.getInt(9));
				boardList.add(board);
			}

		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception ex) {
				}
		}
		return boardList;
	}
	

	}
