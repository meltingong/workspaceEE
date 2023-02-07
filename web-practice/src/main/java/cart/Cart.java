package cart;

import product.Product;

public class Cart {
	private int cart_no;
	private int cart_qty;
	private String userId;
	private Product product;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int cart_no, int cart_qty, String userId, Product product) {
		
		this.cart_no = cart_no;
		this.cart_qty = cart_qty;
		this.userId = userId;
		this.product = product;
		
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Cart2 [cart_no=" + cart_no + ", cart_qty=" + cart_qty + ", userId=" + userId + ", product=" + product
				+ "]/n";
	}
	
	
}
