package com.itwill.shop.product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
	private ProductDao productDao;
	public ProductService() throws Exception {
		productDao = new ProductDao();
	}
	
	/*
	 * 고객 옵션 선택시 db에 고객이 선택한 옵션으로 상품 옵션 변경
	 */
	public int updateOption(int p_no,String p_option) throws Exception {
		return productDao.update(p_no, p_option);
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
	 * 상품 카테고리 번호로 검색
	 */
	public List<Product> searchCaNo(int ca_no) throws Exception{
		return productDao.searchCaNo(ca_no);
	}
	/*
	 * 상품 카테고리 이름으로 검색
	 */
	public List<Product> searchCategory(String keyword) throws Exception{
		return productDao.searchCategory(keyword);
	}
	/*
	 * 상품 이름으로 검색
	 */
	public List<Product> searchProductName(String keyword) throws Exception{
		return productDao.searchProductName(keyword);
	}
	
	/*
	 * 전체에서 가격 내림차순 정렬
	 */
	
	public List<Product> priceSortDesc() throws Exception{
		return productDao.priceSortDesc();
	}
	
	/*
	 * 전체에서 가격 오름차순 정렬
	 */
	public List<Product> priceSortAsc() throws Exception{
		return productDao.priceSortAsc();
	}
	
	/*
	 * 상품 카테고리 내에서 가격 내림차순 정렬
	 */
	public List<Product> categorySortDesc(int ca_no) throws Exception{
		return productDao.categorySortDesc(ca_no);
	}
	
	/*
	 * 상품 카테고리 내에서 가격 오름차순 정렬
	 */
	public List<Product> categorySortAsc(int ca_no) throws Exception{
		return productDao.categorySortAsc(ca_no);
	}
	
	/*
	 * 검색 후 정렬 오름차순
	 */
	
	public List<Product> searchSortAsc(String keyword) throws Exception{
		return productDao.searchSortAsc(keyword);
	}
	
	/*
	 * 검색 후 정렬 내림차순
	 */
	
	public List<Product> searchSortDesc(String keyword) throws Exception{
		return productDao.searchSortDesc(keyword);
	}
}
