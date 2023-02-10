package com.itwill.shop.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shop.common.DataSourceFactory;

public class UserDao {
	
	private DataSource dataSource;
	
	public UserDao() throws Exception {
		dataSource=DataSourceFactory.getDataSource();
	}
	
	/*
	 * 새로운 사용자 생성
	 */
	public int insert(User user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_INSERT);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getAddress());
			insertRowCount = pstmt.executeUpdate();
			return insertRowCount;
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
		
		
	}
	
	public int update(User user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_UPDATE);
			pstmt.setString(1, user.getPassword());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getUserId());
			updateRowCount = pstmt.executeUpdate();
		}finally {
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
		return updateRowCount;
			
	}
	
	public int remove(String userId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int removeRowCount = 0;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_REMOVE);
			pstmt.setString(1, userId);
			removeRowCount = pstmt.executeUpdate();
		}finally {
			if(pstmt != null) 
				pstmt.close();
			if(con != null)
				con.close();
			
		}
			return removeRowCount;		
	}
	
	public User findUser(String userId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User findUser = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_SELECT_BY_ID);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				findUser = new User(
							rs.getString("userid"),
							rs.getString("password"),
							rs.getString("name"),
							rs.getString("email"),
							rs.getString("phone"),
							rs.getString("address"));
			}
		}finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}
		
		return findUser;
	}
	
	public ArrayList<User> findUserList() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<User> findUserList = new ArrayList<User>();
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				findUserList.add(new User(
							rs.getString("userid"),
							rs.getString("password"),
							rs.getString("name"),
							rs.getString("email"),
							rs.getString("phone"),
							rs.getString("address")));
			}
		}finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}
		
		return findUserList;
	}
	
	public boolean existedUser(String userId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isExist = false;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_SELECT_BY_ID_COUNT);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt("cnt");
			if(count == 1) {
				isExist = true;
			}
		}finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}
		
		return isExist;
	}
	
	
	public int updateAddress(String address, String userId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		try {
			con=dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_ADDRESS_UPDATE);
			pstmt.setString(1, address);
			pstmt.setString(2, userId);
			updateRowCount = pstmt.executeUpdate();
		}finally {
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		}
		return updateRowCount;
		
		
	} 
	
	
}