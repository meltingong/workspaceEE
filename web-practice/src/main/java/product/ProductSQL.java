package product;

public class ProductSQL {
	public final static String PRODUCT_SELECT_BY_NO = "select * from product where p_no=?";
	public final static String PRODUCT_SELECT_ALL = "select * from product";
	public final static String PRODUCT_SEARCH_CATEGORY = "select * from product p join category c on p.ca_no = c.ca_no and c.ca_name =?";
	public final static String PRODUCT_SEARCH_P_NAME = "select * from product where p_name like ?";
}
