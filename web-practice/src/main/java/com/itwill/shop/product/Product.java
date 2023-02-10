package com.itwill.shop.product;

public class Product {
	private int p_no; 			// 상품 번호
	private String p_name;		// 상품 이름
	private int p_price;		// 상품 가격
	private String p_desc;		// 상품 설명
	private String p_image;		// 상품 이미지
	private String p_option;	// 상품 옵션 로즈골드 , 골드 , 화이트골드
	private int ca_no;  //상품 카테고리
	
	
	public Product() {
	
	}
	

	public Product(int p_no, String p_name, int p_price, String p_desc, String p_image, String p_option, int ca_no) {
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_desc = p_desc;
		this.p_image = p_image;
		this.p_option = p_option;
		this.ca_no = ca_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_desc() {
		return p_desc;
	}

	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}



	public int getCa_no() {
		return ca_no;
	}


	public void setCa_no(int ca_no) {
		this.ca_no = ca_no;
	}


	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_name=" + p_name + ", p_price=" + p_price + ", p_desc=" + p_desc
				+ ", p_image=" + p_image + ", p_option=" + p_option + ", ca_no=" + ca_no + "]\n";
	}



	
}
