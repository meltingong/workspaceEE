package com.itwill.guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GuestDao {
	private DataSource dataSource;
	
	public GuestDao() throws Exception{
		dataSource=new DataSource();
	}
	
	public List<Guest> findAll() throws Exception{
		List<Guest> guestList=new ArrayList<Guest>();
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(GuestSQL.GUEST_SELECT_ALL);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()) {
			guestList.add(new Guest(rs.getInt("guest_no"),
							rs.getString("guest_name"),
							rs.getDate("guest_date"),
							rs.getString("guest_email"),
							rs.getString("guest_homepage"),
							rs.getString("guest_title"),
							rs.getString("guest_content")));
		}
		con.close();
		return guestList;
	}

	public Guest findByNo(int no) throws Exception{
		Guest guest=null;
		Connection con=dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(GuestSQL.GUEST_SELECT_BY_NO);
		pstmt.setInt(1, no);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			guest=new Guest(rs.getInt("guest_no"),
							rs.getString("guest_name"),
							rs.getDate("guest_date"),
							rs.getString("guest_email"),
							rs.getString("guest_homepage"),
							rs.getString("guest_title"),
							rs.getString("guest_content"));
		}
		con.close();
		return guest;
	}
	public int insert(Guest guest)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(GuestSQL.GUEST_INSERT);
		pstmt.setString(1, guest.getGuest_name());
		pstmt.setString(2, guest.getGuest_email());
		pstmt.setString(3, guest.getGuest_homepage());
		pstmt.setString(4, guest.getGuest_title());
		pstmt.setString(5, guest.getGuest_content());
		int rowCount=pstmt.executeUpdate();
		con.close();
		
		return rowCount;
	}

	public int update(Guest guest) throws Exception{
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(GuestSQL.GUEST_UPDATE);
		pstmt.setString(1, guest.getGuest_name());
		pstmt.setString(2, guest.getGuest_email());
		pstmt.setString(3, guest.getGuest_homepage());
		pstmt.setString(4, guest.getGuest_title());
		pstmt.setString(5, guest.getGuest_content());
		pstmt.setInt(6, guest.getGuest_no());
		int rowCount=pstmt.executeUpdate();
		con.close();
		
		return rowCount;
	}

	public int delete(int no)throws Exception {
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt=con.prepareStatement(GuestSQL.GUEST_DELETE);
		pstmt.setInt(1, no);
		int rowCount=pstmt.executeUpdate();
		con.close();
		return rowCount;
	}
}
