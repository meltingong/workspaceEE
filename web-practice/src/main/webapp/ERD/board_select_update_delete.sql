/************* 게시판 ******************/
-- 게시물 리스트 보기
select boardno, title, userid, groupno, step, depth from board
order by groupno desc, step asc;

-- rownum
select rownum, board.* from board
order by groupno desc, step asc;

select rownum idx, s.* from
    (select * from board 
    order by groupno desc, step asc)s;
    
select rownum idx, s.* from
    (select * from board 
    order by groupno desc, step asc)s
    where rownum>=1 and rownum <= 10;   

select ss.* from 
    (select rownum idx, s.* from
        (select * from board 
        order by groupno desc, step asc) s
    ) ss;
    
select ss.* from 
    (select rownum idx, s.* from
        (select * from board 
        order by groupno desc, step asc) s
    ) ss
    where ss.idx>=1 and ss.idx <=10;
    
-- 게시판 리스트 페이지  (게시물 시작번호~끝번호)
select * from 
    (select rownum idx, s.* from
        (select boardno, title, userid, regdate, readcount, groupno, step, depth from board
        order by groupno desc, step asc) s
    )
where idx>=1 and idx <=10;

-- 키워드로 검색된 게시판 리스트
select * from board where title like '%문의%';
select * from board where title like '%목걸이%';
select * from board where title like '%문의%' order by boardno desc;

select * from 
    (select rownum idx, s.* from
        (select boardno, title, userid, regdate, readcount, groupno, step, depth from board  
        where title like '%문의%'
        order by groupno desc, step asc) s
    )
where idx>=1 and idx <=10;


-- 게시판 리스트 전체 보기
select boardno, title, userid, regdate, readcount, groupno, step, depth from board
order by groupno desc, step asc;
-- 게시판의 같은 groupno인 게시물 그룹 1개 보기
select * from board where groupno = 3;
select * from board where groupno = 3 order by groupno desc, step asc;
-- 게시판의 답글 보기
select * from board where groupno=3 and depth>=1 and step>=2
order by step, depth asc;

-- 게시글 번호로 게시물 1개 보기
select boardno, title, userid,content, regdate, readcount,groupno, step, depth from board where boardno=4;
-- 게시글 번호로 게시물 1개 + 댓글 보기
select * from board b join boardcomment c on b.boardno=c.boardno where b.boardno=5;

-- 게시물 총 개수 세기
select count(*) cnt from board;
-- 답글 존재 여부 세기
select count(*) cnt from board where groupno=3 and step>=1 and depth>=1 
order by step asc, depth asc;
-- 게시물 삭제
delete board where boardno=1;
-- 게시물 내용 수정
update board set title='제목수정',content='내용수정' where boardno=8;
-- 게시물 조회수 1 증가
update board set readcount=readcount+1 where boardno=3;
-- 현재글과 같은 그룹번호들 중에서 현재글의 step보다 큰 step을 가진 게시물들의 step을 1씩 증가시킨다.
update board set step=step+1 where step > 1 and groupno=3;

/************* 게시판 댓글 ******************/
-- 댓글 보기
select commentno,boardno,userid,c_content,c_regdate from boardcomment where boardno=5 order by commentno asc;
-- 댓글 총 개수 세기(게시글 번호로)
select count(*) cnt from boardcomment where boardno=6;
-- 댓글 수정(댓글 번호로)
update boardcomment set c_content='댓글내용수정' where commentno=3;
-- 댓글 삭제(댓글 번호로)
delete boardcomment where commentno=2;


desc board;
desc boardcomment;

