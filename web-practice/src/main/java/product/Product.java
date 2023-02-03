package product;

public class Product {
	private int p_no;
	private String p_name;
	private int p_price;
	private String p_desc;
	private String category;
	private String p_image;
	private int p_click_count;
	
	public Product() {
	
	}

	public Product(int p_no, String p_name, int p_price, String p_desc, String category, String p_image,
			int p_click_count) {
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_desc = p_desc;
		this.category = category;
		this.p_image = p_image;
		this.p_click_count = p_click_count;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public int getP_click_count() {
		return p_click_count;
	}

	public void setP_click_count(int p_click_count) {
		this.p_click_count = p_click_count;
	}

	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_name=" + p_name + ", p_price=" + p_price + ", p_desc=" + p_desc
				+ ", category=" + category + ", p_image=" + p_image + ", p_click_count=" + p_click_count + "]";
	}


	
}
