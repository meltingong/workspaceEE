package product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class ProductDao {
	/*
	 * data Source 멤버필드 선언
	 */
	private DataSource dataSource;
	/*
	 * productDao 생성자 선언 후 properties 받을 준비
	 */
	public ProductDao() throws IOException {
		Properties properties = new Properties();	
		properties.load(this.getClass().getResourceAsStream("/jdbc.properties"));
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource = basicDataSource;
	}
	
	public Product findByPrimaryKey(int p_no) throws Exception {
		Product product = null;
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_BY_NO);
		pstmt.setInt(1, p_no);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			product = new Product(
							rs.getInt("p_no"),
							rs.getString("p_name"),
							rs.getInt("p_price"),
							rs.getString("p_desc"),
							rs.getString("p_image"),
							rs.getString("p_option"),
							rs.getInt("p_click_count")
					);
		}
		return product;
	}
	
	public List<Product> findAll() throws Exception{
		List<Product> productList = new ArrayList<Product>();
		
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SELECT_ALL);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Product product = new Product(
									rs.getInt("p_no"),
									rs.getString("p_name"),
									rs.getInt("p_price"),
									rs.getString("p_desc"),
									rs.getString("p_image"),
									rs.getString("p_option"),
									rs.getInt("p_click_count"));
			productList.add(product);
		}
		return productList;
	}
	
	/*
	 * 상품 카테고리 선택 시 카테고리에 해당하는 아이템 모두 보여주기
	 */
	
	/*
	 * 전체 리스트에서 카테고리 검색 시 해당 카테고리 아이템 전부 보여주기
	 */
	public List<Product> searchCategory(String keyword) throws Exception{
		List<Product> searchProductList = new ArrayList<Product>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SEARCH_CATEGORY);
		pstmt.setString(1, keyword);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Product product = new Product(
									rs.getInt("p_no"),
									rs.getString("p_name"),
									rs.getInt("p_price"),
									rs.getString("p_desc"),
									rs.getString("p_image"),
									rs.getString("p_option"),
									rs.getInt("p_click_count"));
			searchProductList.add(product);
		}
		return searchProductList;
	}
	
	/*
	 * 상품 이름으로 검색
	 */
	public List<Product> searchProductName(String keyword) throws Exception{
		List<Product> searchProductList = new ArrayList<Product>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_SEARCH_P_NAME);
		pstmt.setString(1, "%"+keyword);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Product product = new Product(
									rs.getInt("p_no"),
									rs.getString("p_name"),
									rs.getInt("p_price"),
									rs.getString("p_desc"),
									rs.getString("p_image"),
									rs.getString("p_option"),
									rs.getInt("p_click_count"));
			searchProductList.add(product);
		}
		return searchProductList;
	}
	
	public List<Product> categorySortDesc(int ca_no) throws Exception{
		List<Product> categorySortList = new ArrayList<Product>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_PRICE_DESC);
		pstmt.setInt(1, ca_no);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Product product = new Product(
							rs.getInt("p_no"),
							rs.getString("p_name"),
							rs.getInt("p_price"),
							rs.getString("p_desc"),
							rs.getString("p_image"),
							rs.getString("p_option"),
							rs.getInt("p_click_count"));
			categorySortList.add(product);
		}
		return categorySortList;
	}
	
	public List<Product> categorySortAsc(int ca_no) throws Exception{
		List<Product> categorySortList = new ArrayList<Product>();
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = con.prepareStatement(ProductSQL.PRODUCT_PRICE_ASC);
		pstmt.setInt(1, ca_no);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Product product = new Product(
							rs.getInt("p_no"),
							rs.getString("p_name"),
							rs.getInt("p_price"),
							rs.getString("p_desc"),
							rs.getString("p_image"),
							rs.getString("p_option"),
							rs.getInt("p_click_count"));
			categorySortList.add(product);
		}
		return categorySortList;
	}
	
}
