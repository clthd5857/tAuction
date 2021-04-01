package org.spring5.domain;

//import java.sql.Clob;
import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {

	private Long bno;
	private String category;
	private String title;
	//private Clob contents;
	private String contents;
	
	private String imageFileName;
	private Timestamp regDate;
	private Timestamp updateDate;
	//@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Timestamp dueDate;
	
	//private LocalDateTime dueDate;
	
	
	private Long viewCount;
	private Long bidCount;
	
	private Long minPrice;
	private Long maxPrice;
	private Long currentPrice;
	
	private String flag;
	private String memberId;
	
	private List<BoardAttachVO> attachList;
	
	
	
	
}
