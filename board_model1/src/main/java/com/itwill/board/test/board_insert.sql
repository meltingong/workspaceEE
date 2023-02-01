/*
CREATE TABLE board
 (
    boardno number  primary key,        -- 게시판번호
    title varchar2 (100) not null,      -- 제목
    writer varchar2 (20) not null,      -- 글쓴이
    content varchar2 (2000) not null,   -- 내용 
    regdate date default (sysdate),     -- 쓴날짜
    readcount number default (0),       -- 읽은횟수
    groupno number not null,            
    step number not null,
    depth number default (0)
 );
 */
/*
 * groupno : 최상위글과 그글의 답글모두들을 하나의 구룹으로 묶기위한컬럼
 * step    : 같은그룹내에서의 순서를 가지고있는 컬럼
 * depth   : 답글의 깊이를 가지고있는 컬럼
 */


--새글쓰기(최상위글) 
/*
 * groupno : boardno
 * step    : 1
 * depth   : 0
 */
--새글쓰기
insert into board(boardno,title,writer,content,groupno,step,depth) 
    values(board_sequence.nextval,
            '게시판타이틀'||board_sequence.currval,
            '김경호'||board_sequence.currval,
            '내용'||board_sequence.currval,
            board_sequence.currval,
            1,
            0
            );

--답글쓰기

/*현재글의 데이타를 기반으로 작업한다.
    1. boardno : 시퀀스증가
    2. groupno : 현재글의 groupno
    3. step    : 현재글의 step  + 1
    4. depth   : 현재글의 depth + 1
 */
-- update 현재글과 같은그룹번호들중에서현재글의 step보다큰 step을가진 게시물들의 step을 1씩 증가시킨다.
update board set step=step+1 where step > 1 and groupno=564;
-- insert
insert into board(boardno,title,writer,content,groupno,step,depth) 
        values(board_sequence.nextval,
            '게시판타이틀'||board_sequence.currval,
            '김경호'||board_sequence.currval,
            '내용'||board_sequence.currval,
            564,
            2,
            1
            );








