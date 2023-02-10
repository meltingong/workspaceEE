/***************게시판*********************/
/*
 * groupno : 최상위글과 그글의 답글모두들을 하나의 구룹으로 묶기위한컬럼
 * step    : 같은그룹내에서의 순서를 가지고있는 컬럼
 * depth   : 답글의 깊이를 가지고있는 컬럼
 */


-- userinfo insert(Parent key)
insert into userinfo(userid,password,name,email) values('kms1','1111','김1','kms1@korea.com');
insert into userinfo(userid,password,name,email) values('kms2','2222','김2','kms2@korea.com');
insert into userinfo(userid,password,name,email) values('kms3','3333','김3','kms3@korea.com');

--새 게시글 쓰기(최상위글) 
/*
 * groupno : boardno
 * step    : 1
 * depth   : 0
 */

insert into board(boardno,title,userid,content,groupno,step,depth) 
    values(board_boardno_seq.nextval,
            '게시판타이틀'||board_boardno_seq.currval,
            'kms1',
            '내용'||board_boardno_seq.currval,
            board_boardno_seq.currval,
            1,
            0
            );
    
insert into board(boardno,title,userid,content,groupno,step,depth) 
    values(board_boardno_seq.nextval,
            '게시판타이틀'||board_boardno_seq.currval,
            'kms2',
            '내용'||board_boardno_seq.currval,
            board_boardno_seq.currval,
            1,
            0
            );
            
insert into board(boardno,title,userid,content,groupno,step,depth) 
    values(board_boardno_seq.nextval,
            '게시판타이틀'||board_boardno_seq.currval,
            'kms3',
            '내용'||board_boardno_seq.currval,
            board_boardno_seq.currval,
            1,
            0
            );

/***************게시판 답글*********************/
--답글쓰기

/*현재글의 데이타를 기반으로 작업한다.
    1. boardno : 시퀀스증가
    2. groupno : 현재글의 groupno
    3. step    : 현재글의 step  + 1
    4. depth   : 현재글의 depth + 1
    
 */
-- update 현재글과 같은 그룹번호들 중에서 현재글의 step보다 큰 step을 가진 게시물들의 step을 1씩 증가시킨다.
update board set step=step+1 where step >= 1 and groupno=3;
-- insert
insert into board(boardno,title,userid,content,groupno,step,depth) 
    values(board_boardno_seq.nextval,
            '게시판타이틀'||board_boardno_seq.currval,
            'kms2',
            '내용'||board_boardno_seq.currval,
            3,
            2,
            1
            );
            
insert into board(boardno,title,userid,content,groupno,step,depth) 
    values(board_boardno_seq.nextval,
            '게시판타이틀'||board_boardno_seq.currval,
            'kms3',
            '내용'||board_boardno_seq.currval,
            7,
            2,
            1
            );

            
/***************댓글*********************/
            
-- 댓글 쓰기
-- insert
insert into boardcomment(commentno,boardno,userid,c_content) 
values(boardcomment_commentno_seq.nextval, 35, 'kms1', '댓글내용'||boardcomment_commentno_seq.currval);

insert into boardcomment(commentno,boardno,userId,c_content) 
values(boardcomment_commentno_seq.nextval, 36, 'kms3', '댓글내용'||boardcomment_commentno_seq.currval);






