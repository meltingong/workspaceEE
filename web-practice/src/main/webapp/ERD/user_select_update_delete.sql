/***************userinfo select**************/
--id로 회원찾기--
select*from userinfo where userid = 'test3';
--모든 회원 정보 찾기--
select*from userinfo;
--ID 중복 체크
select count(*) cnt from userinfo where u_id='test3';

/***************userinfo update**************/
--회원정보수정(아이디변경 불가)--
update userinfo set password = 'aaaa1', name = '이름수정', email = 'update@google.com', phone = '010-1234-5678', address = '경기도'
where userid='test1';

/***************userinfo delete**************/
--회원탈퇴,회원정보 모두삭제--
delete from userinfo where userid='test2';

/*************UPDATE USERINFO***************/
--회원의 주소만 업데이트
update userinfo set address = '경기도' where userid='fffff';


commit;=