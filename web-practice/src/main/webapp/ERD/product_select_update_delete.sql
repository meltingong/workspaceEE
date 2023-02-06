-- 모든 리스트에서 가격 내림차순 정렬
select * from product order by p_price desc;
-- 모든 리스트에서 가격 오름차순 정렬
select * from product order by p_price asc;

-- 반지 카테고리에서 가격 내림차순 정렬
select * from product p join category c on p.ca_no = c.ca_no and p.ca_no = 1 order by p_price desc;

-- 반지 카테고리에서 가격 오름차순 정렬
select * from product p join category c on p.ca_no = c.ca_no and p.ca_no = 1 order by p_price asc;

--카테고리 번호로 반지인 아이템 검색
select * from product p join category c on p.ca_no = c.ca_no and p.ca_no = 1;
--카테고리 이름이 반지인 아이템 검색
select * from product p join category c on p.ca_no = c.ca_no and c.ca_name = '반지';
--상품명 키워드로 검색
select * from product where p_name like '%링'; 

--옵션만 업데이트
update product set p_option='골드' where p_no = 1;