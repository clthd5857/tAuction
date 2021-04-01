package org.spring5.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuctionDetailVO {
	private Long dtNo;
	private Long myPrice;
	private Timestamp biddingDate;
	private String memberId;
	private Long bno;
	private String winner;
	
}
