package org.spring5.service;

import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;
import org.spring5.mapper.CmReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CmReplyServiceImpl implements CmReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private CmReplyMapper cmReplyMapper;
	
	//댓글 입력
	@Override
	public int cmReplyInsert(ReplyVO replyVO) {
		log.info("댓글입력====> " + replyVO);
		
		return cmReplyMapper.cmReplyInsert(replyVO);
	}
	
	//댓글조회
	@Override
	public ReplyVO cmReplyRead(Long rno) {
		return cmReplyMapper.cmReplyRead(rno);
	}
	
	//댓글 조회 (특정 게시글)
//	@Override
//	public List<ReplyVO> replyGetList(Criteria cri, Long bno) {
//		log.info("특정 게시글의 댓글조회 : bno : " + bno);
//		
//		return replyMapper.replyGetCountByBno(bno));
//	}
	
	//댓글 조회 (특정 게시글)
	@Override
	public ReplyPageDTO cmReplyGetList(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(
						cmReplyMapper.cmReplyGetCountByBno(bno),
						cmReplyMapper.cmReplyGetList(cri, bno));
	}

	//댓글 삭제
	@Override
	public int cmReplyDelete(Long rno) {
		log.info("댓글삭제 cmRno : " + rno);
		
		return cmReplyMapper.cmReplyDelete(rno);
	}

	//댓글 수정
	@Override
	public int cmReplyModify(ReplyVO replyVO) {
		log.info("댓글수정 =====> " + replyVO);
		
		return cmReplyMapper.cmReplyModify(replyVO);
	}
	

}
