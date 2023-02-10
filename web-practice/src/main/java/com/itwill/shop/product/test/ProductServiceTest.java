package com.itwill.shop.product.test;

import java.util.List;

import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductService;

public class ProductServiceTest {

	public static void main(String[] args) throws Exception {
		ProductService productService = new ProductService();

		/*
		 * 상품 전체보기
		 * 
		 * System.out.println(productService.productList());
		 * 
		 * 상품 상세보기
		 * 
		 * System.out.println(productService.productDetail(2));
		 * 
		 * 상품 카테고리별 검색
		 * 
		 * System.out.println(productService.searchCategory("반지"));
		 * 
		 * 상품 이름키워드로 검색
		 * 
		 * System.out.println(productService.searchProductName("펜던트"));
		 */
		List<Product> productList = productService.categorySortAsc(1);
		for(Product product : productList) {
			System.out.println(product);
		}
		
	}

}
