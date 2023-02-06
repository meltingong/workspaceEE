/********************************카트*********************************/
--guard1 멤버한사람의  카트에 제품번호 존재여부
select count(*) as p_count from cart c where userid='guard1' and c.p_no = 8;
/*
-------
p_count
-------
  0
*/  
select count(*) as p_count from cart c where userid='guard1' and c.p_no = 1;
/*
-------
p_count
-------
  1
*/
--guard1 카트에 있는 1번제품의 수량증가
update cart set cart_qty=cart_qty+1 where userid='guard1' and p_no=1;
update cart set cart_qty=cart_qty+3 where userid='guard1' and p_no=1;

--guard1 카트에 있는 cart_no 1번의 수량3개 수정
update cart set cart_qty=3 where cart_no=1;

--guard1 멤버한사람의 카트아이템리스트

select * from cart c join product p on c.p_no=p.p_no where c.userid='guard1';

--guard1님 카트아이템1개삭제
delete from cart where cart_no=1;
--guard1님 카트아이템모두삭제
delete from cart where userid='guard1';

/********************************주문*********************************/
--1. 멤버 한사람의 주문전체목록
select * from orders where userid='guard1';

--2. 주문한개(멤버 한사람의) 
select * from orders where o_no=1;


--3. 주문한개의  주문상세 여러개(주문상세)
select * from order_item where o_no = 1;

--4. 주문한개의 주문상세,제품정보 여러개(주문상세,제품)
select * from orders o join order_item oi on o.o_no=oi.o_no  join  product p on oi.p_no=p.p_no 
where o.userid='guard1' and o.o_no = 1;

--5. 주문한개삭제(주문1개삭제,주문상세삭제)
--on delete cascade
delete from order_item where o_no=1;
delete from orders where o_no=1;
--rollback;
--6. 멤버한사람의 주문내역전체삭제
----on delete cascade
--select j_no from orders where userid='guard1';
delete from order_item where o_no in(select o_no from orders where userid='guard1');
delete from orders where userid='guard1';

rollback;














