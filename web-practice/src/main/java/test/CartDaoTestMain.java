package test;

import cart.CartDao;

public class CartDaoTestMain {
	public static void main(String[] args) throws Exception{
		CartDao cartDao=new CartDao();
		
		// 회원의 장바구니의 특정 상품 count
		System.out.println(cartDao.countByProductNo("test3", 1));
		
		// cart객체로 insert
		System.out.println(cartDao.insert("test2",2,2));
		System.out.println(cartDao.insert("test3",3,5));
		
		// 카트의 상품번호로 update
		System.out.println(cartDao.updateByProductNo("test2",3,4));

		// 카트 번호로 update
		System.out.println(cartDao.updateByCartNo(5,3));
		
		// 카트 번호로 삭제
		System.out.println(cartDao.deleteByCartNo(6));

		// 회원의 카트에 담긴 상품 전체 삭제
		System.out.println(cartDao.deleteByUserId("test3"));

		// 카트에 담긴 특정 상품 찾기(카트 번호로)
		System.out.println(cartDao.findByCartNo(16));

		// 회원의 카트에 담긴 상품 전체 찾기
		System.out.println(cartDao.findByUserId("test2"));

	}
}
