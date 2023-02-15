drop table guest;
create table guest(guest_no number(10) not null primary key,
		guest_name varchar2(10) not null,
		guest_date date not null,
		guest_email varchar2(50),
		guest_homepage varchar2(50),
		guest_title varchar2(100) not null,
		guest_content varchar2(4000) not null);

drop sequence guest_no_seq;
create sequence guest_no_seq  increment by 1 start with 1;


insert into guest values(guest_no_seq.nextval , '김경호', sysdate, 'guard@naver.com', 'http://', '방명록 사용법', '방명록처럼 사용하시면 됩니다');


delete from guest where guest_no = 1;

update guest set guest_name='name수정',
                 guest_email='email수정',
                 guest_homepage='homepage수정',
                 guest_title='title수정',
                 guest_content='content수정'
where guest_no = 3;

select * from guest;

select * from guest where guest_no = 3;

commit;

desc guest;







