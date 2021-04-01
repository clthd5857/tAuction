package org.spring5.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyBiddingVO {
	private Long bno;
	private String category;
	private String title;
	private Long myPrice;
	private Timestamp biddingDate;
}
