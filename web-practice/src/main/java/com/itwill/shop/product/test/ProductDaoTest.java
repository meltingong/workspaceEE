package com.itwill.shop.product.test;

import com.itwill.shop.product.ProductDao;

public class ProductDaoTest {

	public static void main(String[] args) throws Exception {
		ProductDao productDao = new ProductDao();
		
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
		
	}

}
