DROP TABLE board;
DROP SEQUENCE board_sequence;
CREATE TABLE board
 (
    boardno number not null primary key,
    title varchar2 (100) not null,
    writer varchar2 (20) not null,
    content varchar2 (2000) not null,
    regdate date default (SYSDATE),
    readcount number default (0),
    groupno number not null,
    step number not null,
    depth number default (0)
 );
/*
 * groupno : 최상위글과 그글의 답글들을 하나의 구룹으로 묶기위한컬럼
 * step    : 같은그룹내에서의 순서를 가지고있는 컬럼
 * depth   : 답글의 깊이를 가지고있는 컬럼
 */
CREATE SEQUENCE board_sequence;
CREATE TABLE boardcomment
(
	commentno number not null primary key,
	boardno number not null,            -- board table reference
	writer varchar2 (20) not null,      -- member table reference
	content varchar2 (500) not null,
	regdate date default (sysdate)
);

ALTER TABLE boardcomment
ADD CONSTRAINT fk_board_comment
FOREIGN KEY (boardno) REFERENCES board (boardno) ON DELETE CASCADE;
/*
ALTER TABLE boardcomment
ADD CONSTRAINT fk_member_comment
FOREIGN KEY (writer) REFERENCES member (memberid);
*/
CREATE SEQUENCE boardcomment_sequence;
commit; 
 
 



