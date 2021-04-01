package org.spring5.controller;

import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

public interface CmReplyController {
	
	//커뮤니티 댓글 리스트
	public ResponseEntity<ReplyPageDTO> cmReplyGetList (@PathVariable("page") int page,
	  		@PathVariable("bno") Long bno);
	
	//커뮤니티 댓글 입력
	public ResponseEntity<String> cmReplyInsert(@RequestBody ReplyVO replyVO);
	
	//커뮤니티 댓글 상세 조회
	public ResponseEntity<ReplyVO> cmReplyRead(@PathVariable("rno") Long rno);

	//커뮤니티 댓글 수정
	public ResponseEntity<String> cmReplyModify (@RequestBody ReplyVO replyVO,
			  @PathVariable("rno") Long rno);
	
	//커뮤니티 댓글 삭제
	public ResponseEntity<String> cmReplyDelete(@RequestBody ReplyVO replyVO, @PathVariable("rno") Long rno);

}
