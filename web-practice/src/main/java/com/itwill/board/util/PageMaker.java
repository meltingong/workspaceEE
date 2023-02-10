package com.itwill.board.util;

public class PageMaker {
	// 페이지 당 게시글 수
	public static final int PAGE_SCALE = 10;
	// 화면 당 페이지 수 
	public static final int BLOCK_SCALE = 10;
	// 전체 게시글 수
	private int totCount;
	// 현재 페이지
	private int curPage;
	// 이전 페이지
	private int prevPage;
	// 다음 페이지
	private int nextPage;
	// 이전 그룹 시작 페이지
	private int prevGroupStartPage;
	// 다음 그룹 시작 페이지
	private int nextGroupStartPage;
	// 전체 페이지 수
	private int totPage;
	// 전체 페이지 블록 수
	private int totBlock;
	// 현재 페이지 블록
	private int curBlock;
	// 이전 페이지 블록
	private int prevBlock;
	// 다음 페이지 블록
	private int nextBlock;
	/*
	 WHERE rn BETWEEN #{start} AND #{end}
	 #{start}
	 */
	private int pageBegin;
	// #{end}
	private int pageEnd;
	// 현재 페이지 블록의 시작 번호
	private int blockBegin;
	// 현재 페이지 블록의 끝번호
	private int blockEnd;
	
	/*
	 * 생성자 (전체 게시글 수, 현재 페이지 번호)
	 */
	public PageMaker(int count, int curPage) {
		curBlock = 1;
		this.totCount = count;
		setTotPage();
		if (curPage > totPage) {
			this.curPage = totPage;
		} else if (curPage < 0) {
			this.curPage = 1;
		} else {
			this.curPage = curPage;
		}
		
		setPageRange();
		setTotBlock(this.totPage);
		setBlockRange();
		
		System.out.println();
		System.out.println(this.curPage+" 페이지("+pageBegin+" ~ "+pageEnd+")");
		System.out.println("*************** 페이지 정보 ***********************************");
		System.out.println("01.화면 당 페이지 수(BLOCK_SCALE):	" + BLOCK_SCALE);
		System.out.println("02.한 페이지 당 게시물 수(PAGE_SCALE):	" + PAGE_SCALE);
		System.out.println("03.현재(요청)페이지 번호(curPage):	" + this.curPage);
		System.out.println("04.전체 게시물 수(totCount):		" + this.totCount);
		System.out.println("05.전체 페이지 수(totPage):		" + this.totPage);
		System.out.println("06.현재(요청)페이지 블록번호(curBlock):			" + this.curBlock);
		System.out.println("07.현재(요청)페이지 블록 시작번호(blockBegin):	" + this.blockBegin);
		System.out.println("08.현재(요청)페이지 블록 끝번호(blockEnd):	" + this.blockEnd);
		System.out.println("09.이전 블록 시작페이지 번호(prevGroupStartPage):  " + this.prevGroupStartPage);
		System.out.println("10.다음 블록 시작페이지 번호(nextGroupStartPage):  " + this.nextGroupStartPage);
		System.out.println("11.이전 페이지 번호(prevPage):			" + this.prevPage);
		System.out.println("12.다음 페이지 번호(nextPage):			" + this.nextPage);
		System.out.println("13.DB에서select할 게시물 시작번호(pageBegin):" + this.pageBegin);
		System.out.println("14.DB에서select할 게시물 끝번호(pageEnd):   " + this.pageEnd);
		System.out.println("*************************************************************");
	}
	
	/*
	 * 전체 페이지 수 계산
	 */
	public void setTotPage() {
		// Math.ceil(실수) 올림 
		totPage = (int)Math.ceil(this.totCount * 1.0 / PAGE_SCALE);
	}
	
	/*
	 * 페이지의 시작번호와 끝번호 설정
	 */
	public void setPageRange() {
		pageBegin = (curPage-1) * PAGE_SCALE +1;
		pageEnd = pageBegin + PAGE_SCALE -1;
	}
	/*
	 * 페이지 블록 수 계산
	 * 예) 총 91페이지, 화면 당 페이지 수 10개 -> 블록 10개
	 */
	public void setTotBlock(int page) {
		totBlock = (int)Math.ceil(page*1.0 / BLOCK_SCALE);
	}
	/*
	 * 블록의 시작과 끝 설정
	 */
	public void setBlockRange() {
		curBlock = (int)Math.ceil((curPage-1)/BLOCK_SCALE)+1;
		blockBegin = (curBlock-1) * BLOCK_SCALE +1;
		blockEnd = blockBegin + BLOCK_SCALE -1;
		
		if (blockEnd > totPage) {
			blockEnd = totPage;
		}
		prevPage = curPage-1;
		nextPage = curPage+1;
		prevGroupStartPage = blockBegin - BLOCK_SCALE;
		nextGroupStartPage = blockBegin + BLOCK_SCALE;
	}
	/*
	 * 이전 그룹 존재 여부
	 */
	public boolean isShowPreviousGroup() {
		if (prevGroupStartPage > 0) {
			return true;
		}
		return false;
	}
	/*
	 * 다음 그룹 존재 여부
	 */
	public boolean isShowNextGroup() {
		if (totPage > nextGroupStartPage) {
			return true;
		}
		return false;
	}

	public int getTotCount() {
		return totCount;
	}

	public void setTotCount(int totCount) {
		this.totCount = totCount;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPrevGroupStartPage() {
		return prevGroupStartPage;
	}

	public void setPrevGroupStartPage(int prevGroupStartPage) {
		this.prevGroupStartPage = prevGroupStartPage;
	}

	public int getNextGroupStartPage() {
		return nextGroupStartPage;
	}

	public void setNextGroupStartPage(int nextGroupStartPage) {
		this.nextGroupStartPage = nextGroupStartPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	public static int getPageScale() {
		return PAGE_SCALE;
	}

	public static int getBlockScale() {
		return BLOCK_SCALE;
	}

	public int getTotBlock() {
		return totBlock;
	}
	
	
	
	
	
	
	
	
	
	
	
}
