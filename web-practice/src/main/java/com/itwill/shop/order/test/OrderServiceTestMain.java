package com.itwill.shop.order.test;

import com.itwill.shop.order.OrderService;

public class OrderServiceTestMain {

	public static void main(String[] args) throws Exception {
		OrderService orderService = new OrderService();
		
				//주문 1개 삭제
				//orderService.deleteByOrderNo(4); //test 완료
				
				//특정회원의 주문 전체삭제
				//orderService.delete("test2"); //test완료
				
				//특정회원의 주문목록
				//System.out.println(orderService.orderList("test1"));
				
				//특정회원의 주문+주문아이템 목록
				//System.out.println(orderService.orderWithOrderItemList("test1"));
		
				//특정회원의 주문+주문아이템 상세보기
				//System.out.println(orderService.orderWithOrderItem(1));
				
				//상품에서 직접 주문
				//orderService.create("test2", 1, 2); //test 완료
		
				//카트에서 전체주문
				//orderService.create("test3");
		
		
				//카트에서 상품 선택 주문
				//String[] cart_item_noStr_array = {"6","7"};
				//orderService.create("test1", cart_item_noStr_array);
	}

}
