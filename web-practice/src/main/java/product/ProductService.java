package product;

import java.util.List;

public class ProductService {
	private ProductDao productDao;
	public ProductService() throws Exception {
		productDao = new ProductDao();
	}
	/*
	 * 전체 상품 보기
	 */
	public List<Product> productList() throws Exception{
		return productDao.findAll();
	}
	/*
	 * 상품 상세보기
	 */
	public Product productDetail(int p_no) throws Exception {
		return productDao.findByPrimaryKey(p_no);
	}
	/*
	 * 상품 검색
	 */
	public List<Product> searchCategory(String keyword) throws Exception{
		return productDao.searchCategory(keyword);
	}
	
	public List<Product> searchProductName(String keyword) throws Exception{
		return productDao.searchProductName(keyword);
	}
	
}
