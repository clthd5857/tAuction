package org.spring5.controller;

import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

public interface PostReplyController {
	
	//´ñ±Û ¸®½ºÆ®
	public ResponseEntity<ReplyPageDTO> postReplyGetList (@PathVariable("page") int page,
		  												  @PathVariable("bno") Long bno);
		
	//´ñ±Û ÀÔ·Â
	public ResponseEntity<String> postReplyInsert(@RequestBody ReplyVO replyVO);
	
	//´ñ±Û »ó¼¼ Á¶È¸
	public ResponseEntity<ReplyVO> postReplyRead(@PathVariable("rno") Long rno);
	
	//´ñ±Û ¼öÁ¤
	public ResponseEntity<String> postReplyModify (@RequestBody ReplyVO replyVO,
			  								   @PathVariable("rno") Long rno);
	//´ñ±Û »èÁ¦
	public ResponseEntity<String> postReplyDelete(@PathVariable("rno") Long rno);
	
	
}
