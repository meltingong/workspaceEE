package com.itwill.shop.order;

import com.itwill.shop.product.Product;

/*
 * 이름     널?       유형         
------ -------- ---------- 
OI_NO  NOT NULL NUMBER(10) 
OI_QTY          NUMBER(10) 
O_NO            NUMBER(10) 
P_NO            NUMBER(10) 
 */
public class OrderItem {
	private int oi_no;
	private int oi_qty;
	//fk
	private int o_no;
	//fk
	private Product product; //- Product 생성x
	
	public OrderItem() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "OrderItem [oi_no=" + oi_no + ", oi_qty=" + oi_qty + ", o_no=" + o_no + ", product=" + product + "]\n";
	}

	public int getOi_no() {
		return oi_no;
	}

	public void setOi_no(int oi_no) {
		this.oi_no = oi_no;
	}

	public int getOi_qty() {
		return oi_qty;
	}

	public void setOi_qty(int oi_qty) {
		this.oi_qty = oi_qty;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public OrderItem(int oi_no, int oi_qty, int o_no, Product product) {
		super();
		this.oi_no = oi_no;
		this.oi_qty = oi_qty;
		this.o_no = o_no;
		this.product = product;
	}
	
	
	
	
}
