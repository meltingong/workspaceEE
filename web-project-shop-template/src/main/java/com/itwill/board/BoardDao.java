package com.itwill.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;



/*
 * 자료실 게시판에서 데이터베이스의 접근을 전담하는 클래스. 
 * BOARD 테이블과의 접근을 담당한다.
 */
public class BoardDao {
	private DataSource dataSource;
	/*
	public BoardDao()  throws Exception{
		InitialContext ic = new InitialContext();
		dataSource = (DataSource)ic.lookup("java:/comp/env/jdbc/OracleDB");

	}
	*/
	public BoardDao() throws Exception{
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
		
	}
	/**
	 * 새로운 게시물을 추가하는 메써드.
	 * @throws Exception 
	 */
	public int create(Board board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "INSERT INTO Board " + "(boardno, title, writer, content, groupno, step)"
					+ "VALUES (board_sequence.nextval, ?, ?, ?, " + "board_sequence.currval, 1)";
			pstmt = con.prepareStatement(BoardSQL.BOARD_INSERT);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			// 4. 명령 실행
			int result = pstmt.executeUpdate();
			// 5. 결과 있으면 결과 처리
			return result;
		} finally {
			// 6. 연결닫기
			con.close();
		}
		
	}

	/**
	 * 답글 게시물을 추가하는 메써드
	 */
	public int createReply(Board board) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			// 댓글을 작성할 대상글(원글)의 정보를 조회
			Board temp = this.findBoard(board.getBoardNo());

			// 영향을 받는 기존 글들의 논리적인 순서 번호 변경
			con = dataSource.getConnection();
			String sql = "UPDATE board " + "SET step = step + 1 " + "WHERE step > ? AND groupno = ?";
			pstmt = con.prepareStatement(BoardSQL.BOARD_UPDATE_STEP_REPLY);
			pstmt.setInt(1, temp.getStep());// step 번호
			pstmt.setInt(2, temp.getGroupNo());// group 번호
			pstmt.executeUpdate();
			pstmt.close();

			// 댓글 삽입
			sql = "INSERT INTO board " + "(boardno, title, writer, content, " + "groupno, step, depth) "
					+ "VALUES (board_sequence.nextVal, ?, ?, ?," + "?, ?, ?)";
			pstmt = con.prepareStatement(BoardSQL.BOARD_INSERT_REPLY);
			pstmt.setString(1, board.getTitle());// 제목
			pstmt.setString(2, board.getWriter());// 작성자
			pstmt.setString(3, board.getContent());// 내용
			pstmt.setInt(4, temp.getGroupNo());// group no
			pstmt.setInt(5, temp.getStep() + 1);// step
			pstmt.setInt(6, temp.getDepth() + 1);// depth

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

	/**
	 * 게시물 리스트를 반환(게시물시작번호,게시물끝번호)
	 */
	public ArrayList<Board> findBoardList(int start, int last) throws Exception{
		System.out.println("" + start + " ~ " + last);
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;// 조회 결과에 접근하는 참조 변수
		// 데이터베이스의 데이터를 읽어서 저장할 객체 컬렉션
		ArrayList<Board> boards = new ArrayList<Board>();

		try {
			con = dataSource.getConnection();
			// String sql="select boardno,title,groupno,step,depth from board order by groupno desc";

			StringBuffer sql = new StringBuffer(500);
			sql.append("SELECT * ");
			sql.append("FROM ");
			sql.append("( ");
			sql.append("	SELECT ");
			sql.append("		rownum idx, s.* ");
			sql.append("	FROM ");

			sql.append("	( ");
			sql.append("		SELECT ");
			sql.append("			boardno, title, writer, ");
			sql.append("			regdate, readcount, ");
			sql.append("			groupno, step, depth ");
			sql.append("		FROM ");
			sql.append("			board ");
			sql.append("		ORDER BY groupno DESC, step ASC ");
			sql.append("	) s ");

			sql.append(") ");

			sql.append("WHERE idx >= ? AND idx <= ? ");

			pstmt = con.prepareStatement(BoardSQL.BOARD_SELECT_LIST_BY_ROWNUM_RANGE);
			pstmt.setInt(1, start);
			pstmt.setInt(2, last);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();
				board.setBoardNo(rs.getInt(2));
				board.setTitle(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setRegDate(rs.getDate(5));
				board.setReadCount(rs.getInt(6));
				board.setGroupNo(rs.getInt(7));
				board.setStep(rs.getInt(8));
				board.setDepth(rs.getInt(9));

				boards.add(board);
			}
		} finally {
			// 6. 연결닫기
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
		// System.out.println(boards);
		return boards;
	}

	/*
	 * 
	 * 
	 */
	/**
	 * 답변게시물 존재여부확인메쏘드
	 */
	public boolean countReplay(Board board) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Boolean isExist = false;
		int cnt = 0;
		try {
			con = dataSource.getConnection();
			StringBuffer sql = new StringBuffer(300);
			sql.append("SELECT ");
			sql.append("count(*) cnt ");
			sql.append("FROM board ");
			sql.append("WHERE groupno = ? ");
			sql.append("AND depth >= ? ");
			sql.append("AND step >= ? ");
			sql.append("ORDER BY step,depth ASC");

			pstmt = con.prepareStatement(BoardSQL.BOARD_SELECT_REPLY_COUNT_BY_GROUPNO_DEPTH_STEP);
			pstmt.setInt(1, board.getGroupNo());
			pstmt.setInt(2, board.getDepth());
			pstmt.setInt(3, board.getStep());

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

	/**
	 * 게시물을 삭제하는 메써드.
	 */
	public int remove(int boardNo) throws Exception{

		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			String sql = "DELETE board WHERE boardno = ?";

			pstmt = con.prepareStatement(BoardSQL.BOARD_DELETE_BY_BOARDNO);
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
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;

	}

	/**
	 * 게시물내용을 수정하는 메써드.
	 */
	public int update(Board board) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			String sql = "UPDATE board " + "SET title = ?, content = ? ,writer = ?" + "WHERE boardno = ?";
			pstmt = con.prepareStatement(BoardSQL.BOARD_UDATE_BY_BOARDNO);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getWriter());
			pstmt.setInt(4, board.getBoardNo());
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;
	}

	/**
	 * 게시물 번호에 해당하는 게시물 정보를 반환하는 메써드.
	 */
	public Board findBoard(int boardNo) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;

		try {
			con = dataSource.getConnection();
			StringBuffer sql = new StringBuffer(300);
			sql.append("SELECT ");
			sql.append("boardno, title, writer, content, ");
			sql.append("regdate, readcount, ");
			sql.append("groupno, step, depth ");
			sql.append("FROM board ");
			sql.append("WHERE boardno = ?");
			pstmt = con.prepareStatement(BoardSQL.BOARD_SELECT_BY_BOARDNO);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setRegDate(rs.getDate(5));
				board.setReadCount(rs.getInt(6));
				board.setGroupNo(rs.getInt(7));
				board.setStep(rs.getInt(8));
				board.setDepth(rs.getInt(9));
			}
		}finally {
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

	/**
	 * 게시물 조회수를 1 증가.
	 */
	public void increaseReadCount(int number) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String sql = "UPDATE board " + "SET readcount = readcount + 1 " + "WHERE boardno = ?";
			pstmt = con.prepareStatement(BoardSQL.BOARD_UPDATE_READ_COUNT_BY_BOARDNO);
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

	/**
	 * 게시물 총 건수를 조회, 반환
	 */
	public int getBoardCount() throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			String sql = "SELECT COUNT(*) FROM board";
			pstmt = con.prepareStatement(BoardSQL.BOARD_SELECT_COUNT_TOT_RECORD);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);

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

}
