--test1 님이 1번 1개,2번 1개,3번 2개,4번 3개 제품담기 
insert into cart(cart_no,userId,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test1',1,1);
insert into cart(cart_no,userId,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test1',2,1);
insert into cart(cart_no,userId,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test1',3,2);
insert into cart(cart_no,userId,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test1',4,3);
--test2 님이 6번 1개,8번 1개,10번 2개 제품담기 
insert into cart(cart_no,userId,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test2',6,1);
insert into cart(cart_no,userId,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test2',8,1);
insert into cart(cart_no,userId,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test2',10,2);
--test1 님이 11번 1개,13번 1개,15번 2개 제품담기 
insert into cart(cart_no,userId,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test3',11,1);
insert into cart(cart_no,userId,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test3',13,1);
insert into cart(cart_no,userId,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test3',15,2);