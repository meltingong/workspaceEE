package test;

import java.util.ArrayList;
import java.util.List;

import product.Category;
import product.Product;
import product.ProductDao;
import product.ProductService;

public class ProductDaoTest {

	public static void main(String[] args) throws Exception {
		ProductDao productDao = new ProductDao();
		Category category = new Category();
		/*
		System.out.println("상품 번호를 인자로 받아서 옵션 변경");
		System.out.println(productDao.update(1,"화이트골드"));
		
		System.out.println("상품 번호로 검색");
		System.out.println(productDao.findByPrimaryKey(1));
		
		System.out.println("상품 전체 검색");
		System.out.println(productDao.findAll());
		
		System.out.println("상품 카테고리로 검색");
		System.out.println(productDao.searchCategory("목걸이"));
		
		System.out.println("상품 이름으로 검색");
		System.out.println(productDao.searchProductName("링"));
		
		System.out.println("카테고리 선택 후 가격 내림차순으로 정렬");
		System.out.println(productDao.categorySortDesc(1));

		System.out.println("카테고리 선택 후 가격 오름차순으로 정렬");
		System.out.println(productDao.categorySortAsc(1));
		*/
		String keyword = "반지";
		ProductService productService = new ProductService();
		List<Product> productList = new ArrayList<Product>();
		if(keyword.equals("반지")||keyword.equals("목걸이")||keyword.equals("귀걸이")||keyword.equals("팔찌")){
			productList = productService.searchCategory(keyword);
		}else{
			productList = productService.searchProductName(keyword);
		}
		for (Product product : productList) {
			System.out.println(product);
		}
	}

}
