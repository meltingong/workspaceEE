package com.itwill.shop.product;

public class Category {
	private int ca_no; // 카테고리 번호
	private String ca_name; // 카테고리 이름
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(int ca_no, String ca_name) {
		this.ca_no = ca_no;
		this.ca_name = ca_name;
	}

	public int getCa_no() {
		return ca_no;
	}

	public void setCa_no(int ca_no) {
		this.ca_no = ca_no;
	}

	public String getCa_name() {
		return ca_name;
	}

	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}

	@Override
	public String toString() {
		return "Category [ca_no=" + ca_no + ", ca_name=" + ca_name + "]";
	}
	
	
}
