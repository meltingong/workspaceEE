/***************userinfo insert**************/
insert into userinfo(userid,password,name,email,phone,address) values('test1','1111','스펀지밥','bob1@naver.com','010-1111-2222','강남구');
insert into userinfo(userid,password,name,email,phone,address) values('test2','2222','뚱이','don2@naver.com','010-3333-4444','강동구');
insert into userinfo(userid,password,name,email,phone,address) values('test3','3333','징징이','jing3@naver.com','010-5555-6666','강서구');
insert into userinfo(userid,password,name,email,phone,address) values('test4','4444','철수','test4@naver.com','010-0000-3222','강원도');
insert into userinfo(userid,password,name,email,phone,address) values('test5','5555','영이','test4@naver.com','010-3354-2222','광진구');
insert into userinfo(userid,password,name,email,phone,address) values('test6','6666','순이','test4@naver.com','010-5555-5432','송파구');

/*
이름            널?       유형            
------------- -------- ------------- 
USER_ID       NOT NULL VARCHAR2(100) 
USER_PASSWORD          VARCHAR2(100)  
USER_NAME              VARCHAR2(100) 
USER_EMAIL             VARCHAR2(100) 
USER_PHONE             VARCHAR2(50)  
USER_ADDRESS           VARCHAR2(100)    
*/

desc userinfo;