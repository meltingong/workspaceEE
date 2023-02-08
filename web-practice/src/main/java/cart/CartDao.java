package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import product.Product;



public class CartDao {
	private DataSource dataSource;
	public CartDao() throws Exception{
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
	
	/*
	 * cart제품 존재여부
	 */
	public int countByProductNo(String useId,int p_no) throws Exception {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
		con=dataSource.getConnection();
		pstmt = con.prepareStatement(CartSQL.CART_COUNT_BY_USERID_PRODUCT_NO);
		pstmt.setString(1, useId);		
		pstmt.setInt(2, p_no);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			count=rs.getInt(1);
		}
		
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return count;
	}
	
	public int countByProductNoOption(String useId,int p_no,String p_option) throws Exception {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
		con=dataSource.getConnection();
		pstmt = con.prepareStatement(CartSQL.CART_COUNT_BY_USERID_PRODUCT_NO_AND_OPTION);
		pstmt.setString(1, useId);		
		pstmt.setInt(2, p_no);
		pstmt.setString(3, p_option);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			count=rs.getInt(1);
		}
		
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return count;
	}
	
	/*
	 *상품에서 카트추가시 카트에 없는 상품 추가
	 */
	public int insert(String sUserId,int p_no,int cart_qty) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowcount=0;
		try {
			con = dataSource.getConnection();
			pstmt =con.prepareStatement(CartSQL.CART_INSERT);
			pstmt.setInt(1, cart_qty);
			pstmt.setInt(2, p_no);
			pstmt.setString(3, sUserId);
			insertRowcount = pstmt.executeUpdate();
			
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return insertRowcount;
		
	}
	/*
	 * 상품에서 카트추가시 이미담긴 상품 수량증가
	 */
	public int updateByProductNo(String sUserId,int p_no,int cart_qty) throws Exception {
		Connection con = null ;
		PreparedStatement pstmt = null;
		int updateRowcount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(CartSQL.CART_UPDATE_BY_PRODUCT_NO_USERID);
			pstmt.setInt(1, cart_qty);
			pstmt.setString(2, sUserId);
			pstmt.setInt(3, p_no);
			updateRowcount = pstmt.executeUpdate();
			
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return updateRowcount;
	}
	/*
	 * 카트리스트에서 수량조절
	 */
	public int updateByCartNo(int cart_no,int cart_qty) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		int rowCount=0;
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(CartSQL.CART_UPDATE_BY_CART_NO);
			pstmt.setInt(1, cart_qty);
			pstmt.setInt(2, cart_no);
			rowCount = pstmt.executeUpdate();
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return rowCount;
	}
		
		
	/*
	 * 카트리스트 불러오기
	 */
	public List<Cart> findByUserId(String userId) throws Exception {
		List<Cart> cartList = new ArrayList<Cart>();
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			pstmt =con.prepareStatement(CartSQL.CART_SELECT_BY_USERID);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cartList.add(new Cart(rs.getInt("cart_no"),
						              rs.getInt("cart_qty"),
						              rs.getString("userId"),
						              new Product(rs.getInt("p_no"),
						            		      rs.getString("p_name"),
						            		      rs.getInt("p_price"),
						            		      rs.getString("p_desc"),
						            		      rs.getString("p_image"),
						            		      rs.getString("p_option"),
						            		      rs.getInt("ca_no")
						            		      )));
			}
			
			
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return cartList;
	}
	
	/*
	 * 카트에 담긴 특정상품 삭제
	 */
	public int deleteByCartNo(int cart_no) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		int deleteRowCount=0;
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(CartSQL.CART_DELETE_BY_CART_NO);
			pstmt.setInt(1, cart_no);
			deleteRowCount = pstmt.executeUpdate();
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return deleteRowCount;
	}
	
	/*
	 * 카트리스트 전체삭제
	 */
	public int deleteByUserId(String sUserId) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		int deleteRowCount=0;
		try {
			con=dataSource.getConnection();
			pstmt=con.prepareStatement(CartSQL.CART_DELETE_BY_USERID);
			pstmt.setString(1, sUserId);
			deleteRowCount = pstmt.executeUpdate();
		}finally {
			if(con!=null) {
				con.close();
			}
		}
		return deleteRowCount;
	}
	
//cart 번호로 정보 불러오기	
public Cart findByCartNo(int cart_no)throws Exception {
		
		Cart cart=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String selectQuery="select * from cart c join product p on c.p_no=p.p_no where cart_no=?";
		con=dataSource.getConnection();
		pstmt=con.prepareStatement(CartSQL.CART_SELECT_BY_CART_NO);
		pstmt.setInt(1,cart_no);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			cart=new Cart(rs.getInt("cart_no"),
						rs.getInt("cart_qty"),
						 rs.getString("userId"),
						 new Product(rs.getInt("p_no"),
		            		      rs.getString("p_name"),
		            		      rs.getInt("p_price"),
		            		      rs.getString("p_desc"),
		            		      rs.getString("p_image"),
		            		      rs.getString("p_option"),
		            		      rs.getInt("ca_no")
		            		      )
					
					 );
		}
		return cart;
	}

	
}
