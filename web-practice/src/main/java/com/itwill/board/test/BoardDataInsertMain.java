package com.itwill.board.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class BoardDataInsertMain {

	public static void main(String[] args) throws Exception{
		Connection con = null;
		Statement stmt = null;
		try {
			Properties properties = new Properties();
			properties.load(BoardDataInsertMain.class.getResourceAsStream("/jdbc.properties"));
			/*** Apache DataSource ***/
			BasicDataSource basicDataSource = new BasicDataSource();
			basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
			basicDataSource.setUrl(properties.getProperty("url"));
			basicDataSource.setUsername(properties.getProperty("username"));
			basicDataSource.setPassword(properties.getProperty("password"));
			DataSource dataSource = basicDataSource;
			con = dataSource.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			con.setAutoCommit(false);
			for (int i = 1; i <= 120; i++) {
				// addBatch : 여러개의 SQL문 넣을 때
				stmt.addBatch("INSERT INTO board (boardno, title, userid, content, groupno, step)" + " VALUES ("
						+ "board_board_no_seq.nextval," + "'게시판타이틀'||board_board_no_seq.currval ,"
						+ "'test1'," + "'content'||board_board_no_seq.currval,"
						+ "board_board_no_seq.currval," + "1)");

			}
			int[] updateCounts = stmt.executeBatch();
			System.out.println("query 수:" + updateCounts.length);
			con.commit();
			System.out.println("success commit!!!!");
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
				System.out.println("rollback !!!");
			} catch (SQLException e1) {
				System.out.println("rollback fail!!!");
			}
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println("close 시 에러발생");
			}
		}

	}

}
