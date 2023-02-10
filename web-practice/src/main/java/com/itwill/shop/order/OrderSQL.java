package com.itwill.shop.order;

public class OrderSQL {
	/*
	 * 주문 생성
	 */
	public final static String ORDER_INSERT = "insert into orders(o_no,o_desc,o_date,o_price,userid) values (orders_o_no_SEQ.nextval,?,sysdate,?,?)";
	public final static String ORDERITEM_INSERT = "insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,?,orders_o_no_SEQ.currval,?)";
	/*
	 * 주문 전체 조회 (해당아이디로)
	 */
	public final static String ORDER_SELECT_BY_USERID = "select * from orders where userid=? order by o_no desc";
	/*
	 * 주문번호로 상세조회
	 */
	public final static String ORDER_SELECT_WITH_ORDERITEM_BY_O_NO = "select * from orders o join order_item oi on o.o_no=oi.o_no  join  product p on oi.p_no=p.p_no where  o.o_no = ?";
	/*
	 * 주문한 아이디로 상세조회
	 */
	public final static String ORDER_SELECT_WITH_ORDERITEM_BY_USERID = "select * from orders o join order_item oi on o.o_no=oi.o_no  join  product p on oi.p_no=p.p_no where  o.userid = ?";
	/*
	 * 주문전체삭제
	 */
	public final static String ORDER_DELETE_BY_USERID = "delete from orders where userid=?";
	/*
	 * 주문번호 선택 삭제
	 */
	public final static String ORDER_DELETE_BY_O_NO = "delete from orders where o_no=?";
}
