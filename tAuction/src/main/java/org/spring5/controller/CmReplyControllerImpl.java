package org.spring5.controller;

import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;
import org.spring5.service.CmReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RequestMapping("/cmReplies/*")
@RestController
@Log4j
public class CmReplyControllerImpl implements CmReplyController{
	
	//@Setter(onMethod_ = @Autowired)
	@Autowired
	private CmReplyService cmReplyService;
	
	//커뮤니티 댓글 목록 (특정 게시물)
	@Override
	@GetMapping(value = "/cmReplyGetList/{bno}/{page}",
				produces = {"application/xml; charset = UTF-8",
							"application/json; charset = UTF-8"})
	public ResponseEntity<ReplyPageDTO> cmReplyGetList (@PathVariable("page") int page,
												  		@PathVariable("bno") Long bno) {
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<> (cmReplyService.cmReplyGetList(cri, bno), HttpStatus.OK);
	}
	
	
	//커뮤니티 댓글 등록
	@PreAuthorize("isAuthenticated()")
	@Override
	@PostMapping(value = "/cmReplyInsert",
				 consumes = "application/json; charset=UTF-8",
				 produces = "text/plain; charset = UTF-8")
	public ResponseEntity<String> cmReplyInsert(@RequestBody ReplyVO replyVO) {
		
		log.info("등록 ReplyVO : "+replyVO);
		
		return cmReplyService.cmReplyInsert(replyVO) ==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//커뮤니티 댓글 조회
	@Override
	@GetMapping(value = "/{rno}",
				produces = {"application/xml; charset = UTF-8",
							"application/json; charset = UTF-8"})
	public ResponseEntity<ReplyVO> cmReplyRead(@PathVariable("rno") Long rno) {
		return new ResponseEntity<>(cmReplyService.cmReplyRead(rno), HttpStatus.OK);
	}
	

	//커뮤니티 댓글 수정
	@PreAuthorize("principal.username==#replyVO.memberId")
	@Override
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
					value = "/{rno}",
					consumes = "application/json",
					produces = { "text/plain; charset = UTF-8" })  
	public ResponseEntity<String> cmReplyModify (@RequestBody ReplyVO replyVO,		
										  @PathVariable("rno") Long rno) {
		replyVO.setRno(rno);
		log.info("댓글수정 rno : " + rno);
		log.info("댓글수정 replyVO : " + replyVO);
		
		return cmReplyService.cmReplyModify(replyVO) == 1
			   ? new ResponseEntity<>("success", HttpStatus.OK)
			   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//커뮤니티 댓글 삭제
//	@DeleteMapping(value= "/{rno}",
//				   produces = { "text/plain; charset = UTF-8" })  
//	public ResponseEntity<String> cmReplyDelete(@PathVariable("rno") Long rno) {
//		log.info("댓글 삭제 rno :" + rno);
//		
//		return cmReplyService.cmReplyDelete(rno) == 1
//			   ? new ResponseEntity<>("success", HttpStatus.OK)
//			   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	@PreAuthorize("principal.username==#replyVO.memberId")
	@Override
	@DeleteMapping(value= "/{rno}",
			   produces = { "text/plain; charset = UTF-8" })  
	public ResponseEntity<String> cmReplyDelete(@RequestBody ReplyVO replyVO, @PathVariable("rno") Long rno) {
		//log.info("댓글 삭제 rno :" + rno);
		
		return cmReplyService.cmReplyDelete(rno) == 1
			   ? new ResponseEntity<>("success", HttpStatus.OK)
			   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
