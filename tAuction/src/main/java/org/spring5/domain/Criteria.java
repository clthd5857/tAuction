package org.spring5.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class Criteria {
	
	//현재 페이지
	private int pageNum;
	
	//보여줄 게시글 수
	private int amount;
	
	//검색 조건
	private String searchType;
	
	//카테고리 검색 조건
	private String category;
	
	//검색어
	private String searchKeyword;

	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public Criteria(int pageNum, int amount, String category) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.category = category;
	}
	
	public String[] getSearchTypeArr() {
		return searchType == null ? new String[] {} : searchType.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
														   .queryParam("pageNum", this.pageNum)
														   .queryParam("amount",this.getAmount())
														   .queryParam("category", this.getCategory())
														   .queryParam("searchType", this.getSearchType())
														   .queryParam("searchKeyword", this.getSearchKeyword());
		return builder.toUriString();
	}

	
}
