package com.itwill.shop.order;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*
 * 이름      널?       유형            
------- -------- ------------- 
O_NO    NOT NULL NUMBER(10)    
O_DESC           VARCHAR2(100) 
O_DATE           DATE          
O_PRICE          NUMBER(10)    
USERID           VARCHAR2(100) 
 */

public class Order {
	private int o_no;
	private String o_desc;
	private Date o_date;
	private int o_price;
	//fk
	private String userid;
	//list(orderItem)
	private List<OrderItem> orderItem;
	public Order() {
		orderItem = new ArrayList<OrderItem>();
	}
	
	
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getO_desc() {
		return o_desc;
	}
	public void setO_desc(String o_desc) {
		this.o_desc = o_desc;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public List<OrderItem> getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(List<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}
	
	public Order(int o_no, String o_desc, Date o_date, int o_price, String userid) {
		super();
		this.o_no = o_no;
		this.o_desc = o_desc;
		this.o_date = o_date;
		this.o_price = o_price;
		this.userid = userid;
		this.orderItem = new ArrayList<OrderItem>();
	}
	
	@Override
	public String toString() {
		return "Order [o_no=" + o_no + ", o_desc=" + o_desc + ", o_date=" + o_date + ", o_price=" + o_price
				+ ", userid=" + userid + ", orderItem=" + orderItem + "]\n";
	}
	
	
}
