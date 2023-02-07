package User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class UserDao {
	
	private DataSource dataSource;
	
	public UserDao() throws Exception {
		Properties properties = new Properties();
		properties.load(this.getClass().getResourceAsStream("/jdbc.properties"));
		/*** Apache DataSource ***/
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClass"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}

	/*
	 * 사용자관리테이블에 새로운사용자생성
	 */
	/*
	 * Create(insert) 회원생성
	 */
	public int create(User user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_INSERT);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getAddress());
			insertRowCount = pstmt.executeUpdate();
			return insertRowCount;
		} finally {
			if (pstmt != null) {
				pstmt.close();				
			}
			if (con != null) {
				con.close();
			}
		}
	}
	
	/*
	 * 사용자아이디에해당하는 정보를 데이타베이스에서 찾아서 User 도메인클래스에 저장하여 반환
	 */
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
			if (rs.next()) {
				findUser = new User(
						rs.getString("userid"), 
						rs.getString("password"), 
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("phone"),
						rs.getNString("address"));

			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return findUser;
	}
	
	/*
	 * 모든사용자 정보를 데이타베이스에서 찾아서 List<User> 콜렉션 에 저장하여 반환
	 */	
	public ArrayList<User> findUserList() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<User> findUserList = new ArrayList<User>();
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_SELECT_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				findUserList.add(new User(rs.getString("userid"),
						                  rs.getString("password"),
						                  rs.getString("name"),
						                  rs.getString("email"),
						                  rs.getString("phone"),
						                  rs.getNString("address")));

			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return findUserList;
	}
	
	/*
	 * 기존에 가입한 회원정보를 수정
	 */
	public int update(User user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		
		try {	
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_UPDATE);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getAddress());
			updateRowCount = pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return updateRowCount;
	}
	
	/*
	 * 기존에 가입한 회원정보를 삭제
	 */
	public int delete(String userid) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int removeRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_DELETE);
			pstmt.setString(1, userid);
			removeRowCount = pstmt.executeUpdate();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return removeRowCount;
	}
	
	/*
	 * 인자로 전달되는 아이디를 가지고 있는 사용자가 존재하는지 여부판별
	 */
	public boolean existedUser(String userid) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		boolean isExist = false;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserSQL.USER_SELECT_BY_ID_COUNT);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt("cnt");
			if(count==1) {
				isExist = true;
			}
		} finally {
			if(rs != null)
			   rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return isExist;
	}
	
}