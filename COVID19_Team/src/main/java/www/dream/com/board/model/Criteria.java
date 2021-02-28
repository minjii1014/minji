package www.dream.com.board.model;

import lombok.Data;

@Data
public class Criteria {
	/** 한 블럭에 보이는 총 페이지 수 */
	private static final long PAGING_AMOUNT = 10;
	/** 페이지당 게시글 수 */
	public static final int DEFAULT_AMOUNT = 10;
	
	private long pageNum;
	private int amount;
	
	private long startPage, endPage;
	private long totalDataCount;
	private boolean hasPrev, hasNext;
	
	// 서치 관련
	private String search;
	
	public Criteria() {
		this(1, 1241);
		// pageNum, totalDataCount
	}
	
	public Criteria(long pageNum, long totalDataCount) {
		this.totalDataCount = totalDataCount;
		setPageNum(pageNum);
	}
	
	public long getOffset() {
		return (pageNum - 1) * DEFAULT_AMOUNT;
	}
	
	public long getLimit() {
		return pageNum * DEFAULT_AMOUNT;
	}

	public void setPageNum(long pageNum) {
		this.pageNum = pageNum;
		
//		//10, 20, 30 이런 식으로 페이징 처리하기
//		//endPage = (int) Math.ceil(pageNum / (float) PAGING_AMOUNT) * PAGING_AMOUNT;
//		endPage = pageNum + PAGING_AMOUNT / 2;	//구글 스타일
////		endPage = endPage < PAGING_AMOUNT ? PAGING_AMOUNT : endPage;
//		endPage = endPage < PAGING_AMOUNT ? endPage : PAGING_AMOUNT;

		if(totalDataCount / 10 < 10) {
		    endPage = (int) Math.ceil(totalDataCount / (float) PAGING_AMOUNT) * PAGING_AMOUNT;
//			endPage = (int) Math.ceil(totalDataCount / 10) ;
		} else {
			endPage = pageNum + PAGING_AMOUNT / 2;	//구글 스타일
			endPage = endPage < PAGING_AMOUNT ? PAGING_AMOUNT : endPage;
		}

		startPage = endPage - PAGING_AMOUNT + 1;
		int realEnd = (int) Math.ceil((float) totalDataCount / DEFAULT_AMOUNT);
		if (realEnd < endPage)
			endPage = realEnd;
		hasPrev = startPage > 1;
		hasNext = endPage < realEnd;
	}

	public void setTotalDataCount(long totalDataCount) {
		this.totalDataCount = totalDataCount;
		int realEnd = (int) Math.ceil((float) totalDataCount / DEFAULT_AMOUNT);
		if (realEnd < endPage)
			endPage = realEnd;
		hasNext = endPage < realEnd;
	}
	
	// 서치 관련
	public String[] getSearchArr() {
		return (search != null && !search.isEmpty()) ? search.split(" ") : null;
	}
	
}