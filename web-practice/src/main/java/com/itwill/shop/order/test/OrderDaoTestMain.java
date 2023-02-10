package com.itwill.shop.order.test;

import java.sql.Date;
import java.util.ArrayList;

import com.itwill.shop.order.Order;
import com.itwill.shop.order.OrderDao;
import com.itwill.shop.order.OrderItem;
import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductDao;

public class OrderDaoTestMain {

	public static void main(String[] args) throws Exception {
		OrderDao orderDao = new OrderDao();
		int rowCount;
		
		/*
		 * orderDao. insert, findOrderByUserId, findOrderWithOrderItemByUserId,findByOrderNo TEST
		 */
		
		//System.out.println(orderDao.findByOrderNo(1));
	
		System.out.println(orderDao.findOrderByUserId("test1"));
		
		
		/*
		 * Order 주문 생성 TEST
		 */
/*		
		int oi_qty=1;
		int p_no=1;
		ProductDao productDao = new ProductDao();
		Product product = productDao.findByPrimaryKey(p_no);
		
		ArrayList<OrderItem> jumunList = new ArrayList<OrderItem>();
		jumunList.add(new OrderItem(0, oi_qty, p_no, product));
		Order newJumun = new Order(0, product.getP_name()+"외 1종", new Date(0), product.getP_price(), "cmy0");
		orderDao.insert(newJumun);
		System.out.println(orderDao.findOrderByUserId("cmy0"));
	*/		
		
		//System.out.println(orderDao.findOrderWithOrderItemByUserId("cmy0"));
		
		/*
		 * 주문삭제 관련 DAO test
		 */
		
		//orderDao.deleteByUserId("cmy0");
		
		//orderDao.deleteByOrderNo(11); 
		
		
	}

}
