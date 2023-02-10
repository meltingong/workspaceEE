/**********************orders insert************************/
--아이디 수정할것!!!!!(아이디 userinfo의 담당id로 안바꾸면 parent key not found 에러가 뜸 "cmy0" -> "???")
insert into orders(o_no,o_desc,o_date,o_price,userid) values (orders_o_no_SEQ.nextval,'하트태그링외1종',sysdate,3960000,'cmy0'); 
insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,1);
insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,2);

commit;


