DROP TABLE board;
DROP SEQUENCE board_sequence;
CREATE SEQUENCE board_sequence;
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
/*
 * groupno : 최상위글과 그글의 답글들을 하나의 구룹으로 묶기위한컬럼
 * step    : 같은그룹내에서의 순서를 가지고있는 컬럼
 * depth   : 답글의 깊이를 가지고있는 컬럼
 */










