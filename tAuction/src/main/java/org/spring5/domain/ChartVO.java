package org.spring5.domain;

import lombok.Data;

@Data
public class ChartVO {
	String boardCount;
	String bidCount;
	String successbidCount;
	String successbidPrice;
	int priceAvg;
	String date;
	int visitorCountView;
}


