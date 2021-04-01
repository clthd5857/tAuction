package org.spring5.controller;

import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;
import org.spring5.service.ReplyService;
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

@RequestMapping("/replies/")
@RestController
@Log4j
public class ReplyControllerImpl implements ReplyController{

	//@Setter(onMethod_ = @Autowired)
	@Autowired
	private ReplyService replyService;
	
	
	//댓글 목록 (특정 게시물)
	@Override
	@GetMapping(value = "/replyGetList/{bno}/{page}",
				produces = {"application/xml; charset = UTF-8",
							"application/json; charset = UTF-8"})
	public ResponseEntity<ReplyPageDTO> replyGetList (@PathVariable("page") int page,
												  		@PathVariable("bno") Long bno) {
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<> (replyService.replyGetList(cri, bno), HttpStatus.OK);
	}
	
	
	//댓글 등록
	@PreAuthorize("isAuthenticated()")
	@Override
	@PostMapping(value = "/replyInsert",
				 consumes = "application/json; charset=UTF-8",
				 produces = "text/plain; charset = UTF-8")
	
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO replyVO) {
		
		return replyService.replyInsert(replyVO) ==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 조회
	@Override
	@GetMapping(value = "/{rno}",
				produces = {"application/xml; charset = UTF-8",
							"application/json; charset = UTF-8"})
	public ResponseEntity<ReplyVO> replyRead(@PathVariable("rno") Long rno) {
		return new ResponseEntity<>(replyService.replyRead(rno), HttpStatus.OK);
	}
	
	//댓글 수정
	@PreAuthorize("principal.username == #replyVO.memberId")
	@Override
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
					value = "/{rno}",
					consumes = "application/json",
					produces = { "text/plain; charset = UTF-8" })  
	public ResponseEntity<String> replyModify (@RequestBody ReplyVO replyVO,
										  @PathVariable("rno") Long rno) {
		replyVO.setRno(rno);
		log.info("댓글수정 rno : " + rno);
		log.info("댓글수정 replyVO : " + replyVO);
		
		return replyService.replyModify(replyVO) == 1
			   ? new ResponseEntity<>("success", HttpStatus.OK)
			   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	//댓글 삭제
//	@Override
//	@DeleteMapping(value= "/{rno}",
//				   produces = { "text/plain; charset = UTF-8" })  
//	public ResponseEntity<String> replyDelete(@PathVariable("rno") Long rno) {
//		log.info("댓글 삭제 rno :" + rno);
//		
//		return replyService.replyDelete(rno) == 1
//			   ? new ResponseEntity<>("success", HttpStatus.OK)
//			   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	@PreAuthorize("principal.username == #replyVO.memberId")
	@Override
	@DeleteMapping(value= "/{rno}",
				   produces = { "text/plain; charset = UTF-8" })  
	public ResponseEntity<String> replyDelete(@RequestBody ReplyVO replyVO, @PathVariable("rno") Long rno) {
		//log.info("댓글 삭제 rno :" + rno);
		
		return replyService.replyDelete(rno) == 1
			   ? new ResponseEntity<>("success", HttpStatus.OK)
			   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}


	
}
