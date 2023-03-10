package com.itwill.shop.order;

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

public class OrderDao {
	
	private DataSource dataSource;

	public OrderDao() throws Exception {
		dataSource=DataSourceFactory.getDataSource();
	}
	
	/*
	 * Create , Read(select), Update, Delete (비즈니스 제외)
	 */
	/*
	 * Create(insert) 주문생성
	 */
	public int insert(Order order) throws Exception {
		
		/* [Order SQL, Order Item SQL]
		 * "insert into orders(o_no,o_desc,o_date,o_price,userid) values (orders_o_no_SEQ.nextval,?,sysdate,?,?)";
		 * "insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,?,orders_o_no_SEQ.currval,?)";
		 */
		Connection con = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			/*
			 * order 삽입
			 */
			pstmt1 = con.prepareStatement(OrderSQL.ORDER_INSERT);
			pstmt1.setString(1, order.getO_desc());
			pstmt1.setInt(2, order.getO_price());
			pstmt1.setString(3, order.getUserid());
			pstmt1.executeUpdate();
			/*
			 * order item 삽입
			 */
			pstmt2 = con.prepareStatement(OrderSQL.ORDERITEM_INSERT);
			for (OrderItem orderItem : order.getOrderItem()) {
				pstmt2.setInt(1, orderItem.getOi_qty());
				pstmt2.setInt(2, orderItem.getProduct().getP_no());
				pstmt2.executeUpdate();
			}
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			con.rollback();
			throw e;
			
		} finally {
			if(pstmt1 != null || pstmt2 != null) {
				pstmt1.close();
				pstmt2.close();
			}
			if (con != null)
				con.close();
		}
		return 0;
	}
	
	/*
	 * SELECT
	 */
	
	/*
	 * 특정사용자의 주문전체 보여주기
	 */
	public List<Order> findOrderByUserId(String sUserId) throws Exception {
		ArrayList<Order> orderList = new ArrayList<Order>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			/*
			 * select * from orders where userid='cmy0'
			 */
			pstmt = con.prepareStatement(OrderSQL.ORDER_SELECT_BY_USERID);
			pstmt.setString(1, sUserId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orderList.add(new Order(rs.getInt("o_no"), rs.getString("o_desc"), rs.getDate("o_date"),
						rs.getInt("o_price"), rs.getString("userid")));
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return orderList;
	}
	
	/*
	 * 주문+주문아이템 전체(특정사용자)
	 */
	public List<Order> findOrderWithOrderItemByUserId(String sUserId) throws Exception {
		List<Order> orderList = findOrderByUserId(sUserId);
		for (int i = 0; i < orderList.size(); i++) {
			Order order = orderList.get(i);
			Order orderWithOrderItem = this.findByOrderNo(order.getO_no());
			orderList.set(i, orderWithOrderItem);
		}
		return orderList;
	}
	
	/*
	 * 주문1개보기(주문상세리스트)
	 */
	public Order findByOrderNo(int o_no) throws Exception {
		Order order = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
		con = dataSource.getConnection();
		/*
		 * select * from orders o join order_item oi on o.o_no=oi.o_no join product p on oi.p_no=p.p_no where o.userid=? and o.o_no = ?
		 * 
		 */
		pstmt = con.prepareStatement(OrderSQL.ORDER_SELECT_WITH_ORDERITEM_BY_O_NO);
		pstmt.setInt(1, o_no);
		rs = pstmt.executeQuery();
		/*
		 *       O_NO O_DESC        O_DATE     O_PRICE USERID    OI_NO     OI_QTY   O_NO    P_NO   P_NO P_NAME         P_PRICE    P_desc     p_image p_option                                                                                                                                                                                                  
---------- ------------------------- ---------- ---------- -----------------------------------------------------------------------------------------------------------------------------
         1 T1링외1종      2023/02/05    3960000 cmy0        1          1          1          1          1 T1링               3260000   T1ring.png                        상세 정보 등...                                                                                                                                                                                         
         1 T1링외1종      2023/02/05    3960000 cmy0        2          1          1          2          2 인터라킹 서클 링  700000   interlocking-circles-ring.png  상세 정보 등...
		 */
		if (rs.next()) {
			order = new Order(rs.getInt("o_no"), rs.getString("o_desc"), rs.getDate("o_date"), rs.getInt("o_price"),
					rs.getString("userid"));
			do {
				order.getOrderItem()
						.add(new OrderItem(rs.getInt("oi_no"), rs.getInt("oi_qty"), rs.getInt("o_no"),
								new Product(rs.getInt("p_no"), rs.getString("p_name"), rs.getInt("p_price"),rs.getString("p_desc"),rs.getString("p_image"),rs.getString("p_option"),rs.getInt("ca_no"))));
			} while (rs.next());
		}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return order;
	}
	
	/*
	 * DELETE
	 */
	
	
	/*
	 * 주문전체삭제(ON DELETE CASCADE) - 해당아이디
	 */
	public int deleteByUserId(String sUserId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(OrderSQL.ORDER_DELETE_BY_USERID);
			pstmt.setString(1, sUserId);
			rowCount = pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw e;
		} finally {
			if (con != null)
				con.close();
		}
		return rowCount;
	}

	/*
	 * 주문1건삭제(ON DELETE CASCADE) (주문선택삭제)
	 */
	public int deleteByOrderNo(int o_no) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(OrderSQL.ORDER_DELETE_BY_O_NO);
			pstmt.setInt(1, o_no);
			rowCount = pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			con.rollback();
			e.printStackTrace();
			throw e;
		} finally {
			if (con != null)
				con.close();
		}
		return rowCount;
	}
	

	
}
