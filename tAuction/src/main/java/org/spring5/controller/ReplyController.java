package org.spring5.controller;

import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

public interface ReplyController {
	
	//댓글 리스트
	public ResponseEntity<ReplyPageDTO> replyGetList (@PathVariable("page") int page,
		  												  @PathVariable("bno") Long bno);
		
	//댓글 입력
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO replyVO);
	
	//댓글 상세 조회
	public ResponseEntity<ReplyVO> replyRead(@PathVariable("rno") Long rno);
	
	//댓글 수정
	public ResponseEntity<String> replyModify (@RequestBody ReplyVO replyVO,
			  								   @PathVariable("rno") Long rno);
	//댓글 삭제
	//public ResponseEntity<String> replyDelete(@PathVariable("rno") Long rno);
	public ResponseEntity<String> replyDelete(@RequestBody ReplyVO replyVO, Long rno);
	
}
