package test;

import product.ProductService;

public class ProductServiceTest {

	public static void main(String[] args) throws Exception {
		ProductService productService = new ProductService();
		
		/*
		 * 상품 전체보기
		 */
		//System.out.println(productService.productList());
		/*
		 * 상품 상세보기
		 */
		//System.out.println(productService.productDetail(2));
		/*
		 * 상품 가격 오름차순
		 */
		System.out.println(productService.priceSortAsc());
		/*
		 * 상품 카테고리별 검색
		 */
		//System.out.println(productService.searchCategory("반지"));
		/*
		 * 상품 이름키워드로 검색
		 */
		//System.out.println(productService.searchProductName("펜던트"));
		
		
	}

}
