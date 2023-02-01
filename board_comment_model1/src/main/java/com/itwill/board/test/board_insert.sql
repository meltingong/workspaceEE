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
--새글쓰기
INSERT INTO
board(boardno, title, writer, content,groupno,step,depth) 
VALUES(	board_sequence.nextval,
        '게시판타이틀'||board_sequence.currval,
        '김경호'||board_sequence.currval,
        'content'||board_sequence.currval,
        board_sequence.currval,
        1,
        0);
        
        

commit;   
        
INSERT INTO Board ( boardno,title,writer,content,groupno,step) 
VALUES (board_sequence.nextval, ?, ?, ?,board_sequence.currval, 1);
commit;
--답글쓰기
--INSERT INTO Board ( boardno,title,writer,content,groupno,step,depth) 
--VALUES (board_sequence.nextval, '3번답글3번', 'KIM','CONTEN',3, 2, 1);

--
/*현재글의 데이타를 기반으로 작업한다.
 * 1. 현재글과 같은그룹번호들중에서현재글의 step보다큰 step을가진 게시물들의 step을 1씩 증가시킨다.
 */
 --1번step
UPDATE board SET step = step + 1 WHERE step >= 2 AND groupno = 563;
commit;
/*
 * 2. 
 * 	  boardno:시퀀스증가
 *    groupno:원글의 groupno
 *    step   :원글의 step+1
 *    depth  :원글의 depth+1
 *    
 */
 
INSERT INTO board(boardno,title,writer,content, groupno, step, depth) 
               VALUES
            (board_sequence.nextval,
                '563번답글1',
                'guard',
                '563번답글컨텐트1',
                563,
                2,
                1
              );
commit;              
  --1번step
UPDATE board SET step = step + 1 WHERE step >= 2 AND groupno = 563;
commit;
/*
 * 2. 
 * 	  boardno:시퀀스증가
 *    groupno:원글의 groupno
 *    step   :원글의 step+1
 *    depth  :원글의 depth+1
 *    
 */             
INSERT INTO board(boardno,title,writer,content, groupno, step, depth) 
               VALUES
            (board_sequence.nextval,
                '563번답글2',
                'guard',
                '563번답글컨텐트2',
                563,
                2,
                1
              );              
commit;  

--2번step
UPDATE board SET step = step + 1 WHERE step > 2 AND groupno = 563 ;

commit;
/*
 * 2. 
 * 	  boardno:시퀀스증가
 *    groupno:원글의 groupno
 *    step   :원글의 step+1
 *    depth  :원글의 depth+1
 *    
 */
INSERT INTO board(boardno,title,writer,content, groupno, step, depth) 
               VALUES
            (board_sequence.nextval,
                '563번답글답글',
                'guard',
                '563번답글답글컨텐트',
                563,
                3,
                2
              );
commit;  









