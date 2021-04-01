package org.spring5.domain;

import lombok.Data;

@Data
public class PageDTO {
	
	//페이징 구성을 위한 DTO
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int realEnd;
	private int totalPageCnt;
	
	private Criteria cri;
	
	//보여줄 페이징 수
	private int pagingNumCnt;
	
	public PageDTO(Criteria cri, int totalPageCnt) {
		this.totalPageCnt = totalPageCnt;
		this.cri = cri;
		this.pagingNumCnt = 10;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (this.pagingNumCnt*1.0))) * this.pagingNumCnt;
		this.startPage = this.endPage - (this.pagingNumCnt-1);
		
		this.realEnd = (int)(Math.ceil((totalPageCnt*1.0)/cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
		
	}
	
}
