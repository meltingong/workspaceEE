--test1 님이 1번 1개,2번 1개,3번 2개,4번 3개 제품담기 
insert into cart(cart_no,userid,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test1',1,1);
insert into cart(cart_no,userid,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test1',2,1);
insert into cart(cart_no,userid,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test1',3,2);
insert into cart(cart_no,userid,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test1',4,3);

--test2 님이 6번 1개,8번 1개,10번 2개 제품담기 
insert into cart(cart_no,userid,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test2',6,1);
insert into cart(cart_no,userid,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test2',8,1);
insert into cart(cart_no,userid,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test2',10,2);

--test1 님이 11번 1개,13번 1개,15번 2개 제품담기 
insert into cart(cart_no,userid,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test3',11,1);
insert into cart(cart_no,userid,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test3',13,1);
insert into cart(cart_no,userid,p_no,cart_qty) values(cart_cart_no_seq.nextval,'test3',15,2);


--test1 멤버한사람의 카트아이템리스트
select * from cart c join product p on c.p_no=p.p_no where c.userid='test1';

--카트번호 5번에 담긴 상품정보
select * from cart c join product p on c.p_no=p.p_no where cart_no=11;

--test1님의  카트에 제품 존재여부
select count(*) as p_count from cart c where userid='test1' and c.p_no = 5;
select count(*) as p_count from cart c where userid='test1' and c.p_no = 4;

--test1 카트에 있는 1번제품의 수량증가
update cart set cart_qty = cart_qty+1 where userid = 'test1' and p_no = 1 ;
update cart set cart_qty = cart_qty+4 where userid = 'test1' and p_no = 1 ;

--test1 카트에 있는 p_no 2번의 수량4개 수정 
update cart set cart_qty=4 where userid = 'test1' and p_no = 2;

--test1님 카트아이템1개삭제
delete from cart where cart_no = 11 ;

--test1님 카트아이템모두삭제
delete from cart where userid='test1';