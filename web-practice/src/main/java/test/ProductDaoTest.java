package test;

import product.Product;
import product.ProductDao;

public class ProductDaoTest {

	public static void main(String[] args) throws Exception {
		ProductDao productDao = new ProductDao();
		
		System.out.println("상품 번호로 검색");
		System.out.println(productDao.findByPrimaryKey(1));
		
		System.out.println("상품 전체 검색");
		System.out.println(productDao.findAll());
		
		System.out.println("상품 카테고리로 검색");
		System.out.println(productDao.searchCategory("목걸이"));
		
		System.out.println("상품 이름으로 검색");
		System.out.println(productDao.searchProductName("링"));
	}

}
