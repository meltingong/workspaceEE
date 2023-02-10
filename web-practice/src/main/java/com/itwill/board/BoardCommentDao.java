package com.itwill.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class BoardCommentDao {
	private DataSource dataSource;
	
	public BoardCommentDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/jdbc.properties"));
		// Apache DataSource
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	/*
	 * 댓글 추가
	 */
	public int create(BoardComment boardComment) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "insert into boardcomment(commentno,boardno,userId,c_content) "
					+ " values(boardcomment_commentno_seq.nextval, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardComment.getBoardNo());
			pstmt.setString(2, boardComment.getUserId());
			pstmt.setString(3, boardComment.getC_content());

			int result = pstmt.executeUpdate();
			return result;
		} finally {
			pstmt.close();
			con.close();
		}
	}
	/*
	 * 댓글 수정
	 */
	public int update(BoardComment boardComment) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			String sql = "update boardcomment set c_content=? where commentno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardComment.getC_content());
			pstmt.setInt(2, boardComment.getCommentNo());
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
	 * 댓글 삭제
	 */
	public int remove(int commentNo) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			String sql = "delete boardcomment where commentno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
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
	 * 댓글 리스트 보기
	 */
	public List<BoardComment> findBoardCommentList(int boardNo) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardComment> boardCommentList = new ArrayList<BoardComment>();
		try {
			con = dataSource.getConnection();
			StringBuffer sql = new StringBuffer(500);
			sql.append("select commentno,boardno,userId,c_content,c_regdate");
			sql.append(" from boardcomment");
			sql.append(" where boardno=?");
			sql.append(" order by commentno asc");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardComment boardComment = new BoardComment();
				boardComment.setCommentNo(rs.getInt(1));
				boardComment.setBoardNo(rs.getInt(2));
				boardComment.setUserId(rs.getString(3));
				boardComment.setC_content(rs.getString(4));
				boardComment.setC_regDate(rs.getDate(5));
				boardCommentList.add(boardComment);
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
		return boardCommentList;
	}
	/*
	 * 댓글 존재여부 확인
	 */
	public boolean countComment(int boardNo) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Boolean isExist = false;
		int cnt = 0;
		try {
			con = dataSource.getConnection();
			StringBuffer sql = new StringBuffer(300);
			sql.append("select count(*) cnt from boardcomment");
			sql.append(" where boardno=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNo);
			
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
	
	
	
}
