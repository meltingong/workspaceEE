package com.itwill.board.util;
public class PageMaker {
    // 페이지당 게시물 수
    public static final int PAGE_SCALE = 10;
    // 화면당 페이지 수
    public static final int BLOCK_SCALE = 10;
    private int curPage;    // 현재 페이지
    private int prevPage;   // 이전 페이지
    private int nextPage;   // 다음 페이지
    private int prevGroupStartPage;   // 이전 그룹시작페이지
    private int nextGroupStartPage;   // 다음 그룹시작페이지
    private int totPage;    // 전체 페이지 갯수
    private int totBlock;   // 전체 페이지 블록 갯수
    private int curBlock;   // 현재 페이지 블록 
    private int prevBlock;  // 이전 페이지 블록
    private int nextBlock;  // 다음 페이지 블록
    // WHERE rn BETWEEN #{start} AND #{end}
    private int pageBegin;  // #{start}
    private int pageEnd;    // #{end}
    // [이전] blockBegin -> 41 42 43 44 45 46 47 48 49 50 [다음]
    private int blockBegin; // 현재 페이지 블록의 시작번호
    // [이전] 41 42 43 44 45 46 47 48 49 50 <- blockEnd [다음]
    private int blockEnd;   // 현재 페이지 블록의 끝번호
    // 생성자
    // PageMaker(게시물 갯수, 현재 페이지 번호)
    public PageMaker(int count, int curPage){
        curBlock = 1;     // 현재 페이지 블록 번호
        setTotPage(count);// 전체 페이지 갯수 계산
        if(curPage > totPage ) {
        	//현재페이지가 전체페이지보다크면 전체페이지를현재페이지로설정  
        	this.curPage=totPage;
        }else if(curPage < 0){
        	//현재페이지가 음수이면 현재페이지를 1로설정  
        	this.curPage=1;
        }else {
        	 this.curPage = curPage;         // 현재 페이지 설정
        }
       
        setPageRange(); 
        setTotBlock(count);             // 전체 페이지 블록 갯수 계산
        setBlockRange();                // 페이지 블록의 시작, 끝 번호 계산
    }
    public void setTotPage(int count) {
        // Math.ceil(실수) 올림 처리
        totPage = (int) Math.ceil(count*1.0 / PAGE_SCALE);
    } 
    public void setPageRange(){
        	// WHERE rn BETWEEN #{start} AND #{end}
            // 시작번호 = (현재페이지-1)*페이지당 게시물수 +1
            pageBegin = (curPage-1)*PAGE_SCALE+1;
            // 끝번호 = 시작번호+페이지당 게시물수 -1
            pageEnd = pageBegin+PAGE_SCALE-1;
    }
    // 페이지 블록의 갯수 계산(총 91페이지이고 화면당 페이지 수10개이면 10개의 블록)
    public void setTotBlock(int count) {
        // 전체 페이지 갯수(91) / 화면당 페이지 수(10)
        // 91 / 10 => 9.1 => 10개
        totBlock = (int)Math.ceil(count / BLOCK_SCALE);
    }
    public void setBlockRange(){
        // *현재 페이지가 몇번째 페이지 블록에 속하는지 계산
        curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
        // *현재 페이지 블록의 시작, 끝 번호 계산
        blockBegin = (curBlock-1)*BLOCK_SCALE+1;
        // 페이지 블록의 끝번호
        blockEnd = blockBegin+BLOCK_SCALE-1;
        // *마지막 블록이 범위를 초과하지 않도록 계산
        if(blockEnd > totPage) blockEnd = totPage;
        // *이전을 눌렀을 때 이동할 페이지 번호
        prevPage = curPage-1;
        // *다음을 눌렀을 때 이동할 페이지 번호
        nextPage = curPage+1;
        // 마지막 페이지가 범위를 초과하지 않도록 처리
        if(nextPage >= totPage) nextPage = totPage;
        /***********************************************/
        // 이전다음 화면그룹의 시작페이지와 끝페이지
        prevGroupStartPage = blockBegin - BLOCK_SCALE;		
     	//if(prevGroupStartPage < 0){// groupNo이 0인 경우(페이지 인덱스가 0~10사이)
     	//	prevGroupStartPage = 0;
     	//}
     	nextGroupStartPage = blockBegin + BLOCK_SCALE;
        //if(nextGroupStartPage > totPage)nextGroupStartPage=totPage;
     	/***********************************************/
    }
    /*
    이전그룹존재하는지여부
     */
    public boolean isShowPreviousGroup() {
    	if(prevGroupStartPage>0) {
    		return true;
    	}
    	return false;
    } 
    /*
    다음그룹존재하는지여부
     */
    public boolean isShowNextGroup() {
    	if(totPage>nextGroupStartPage) {
    		return true;
    	}
    	return false;
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
     
    // Getter/Setter
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
    public int getTotPage() {
        return totPage;
    }
   
    public int getTotBlock() {
        return totBlock;
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
}
