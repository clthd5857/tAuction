package org.spring5.controller;

import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;
import org.spring5.service.PostReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RequestMapping("/postReplies/")
@RestController
@Log4j
public class PostReplyControllerImpl implements PostReplyController{

	//@Setter(onMethod_ = @Autowired)
	@Autowired
	private PostReplyService postReplyService;
	
	
	//´ñ±Û ¸ñ·Ï (Æ¯Á¤ °Ô½Ã¹°)
	@Override
	@GetMapping(value = "/postReplyGetList/{bno}/{page}",
				produces = {"application/xml; charset = UTF-8",
							"application/json; charset = UTF-8"})
	public ResponseEntity<ReplyPageDTO> postReplyGetList (@PathVariable("page") int page,
												  		@PathVariable("bno") Long bno) {
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<> (postReplyService.postReplyGetList(cri, bno), HttpStatus.OK);
	}
	
	
	//´ñ±Û µî·Ï
	@Override
	@PostMapping(value = "/postReplyInsert",
				 consumes = "application/json; charset=UTF-8",
				 produces = "text/plain; charset = UTF-8")
	public ResponseEntity<String> postReplyInsert(@RequestBody ReplyVO replyVO) {
		log.info(replyVO.toString());
		return postReplyService.postReplyInsert(replyVO) ==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//´ñ±Û Á¶È¸
	@Override
	@GetMapping(value = "/{rno}",
				produces = {"application/xml; charset = UTF-8",
							"application/json; charset = UTF-8"})
	public ResponseEntity<ReplyVO> postReplyRead(@PathVariable("rno") Long rno) {
		return new ResponseEntity<>(postReplyService.postReplyRead(rno), HttpStatus.OK);
	}
	
	//´ñ±Û ¼öÁ¤
	@Override
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
					value = "/{rno}",
					consumes = "application/json",
					produces = { "text/plain; charset = UTF-8" })  
	public ResponseEntity<String> postReplyModify (@RequestBody ReplyVO replyVO,
										  @PathVariable("rno") Long rno) {
		replyVO.setRno(rno);
		log.info("´ñ±Û¼öÁ¤ rno : " + rno);
		log.info("´ñ±Û¼öÁ¤ replyVO : " + replyVO);
		
		return postReplyService.postReplyModify(replyVO) == 1
			   ? new ResponseEntity<>("success", HttpStatus.OK)
			   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	//´ñ±Û »èÁ¦
	@Override
	@DeleteMapping(value= "/{rno}",
				   produces = { "text/plain; charset = UTF-8" })  
	public ResponseEntity<String> postReplyDelete(@PathVariable("rno") Long rno) {
		log.info("´ñ±Û »èÁ¦ rno :" + rno);
		
		return postReplyService.postReplyDelete(rno) == 1
			   ? new ResponseEntity<>("success", HttpStatus.OK)
			   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	
}
