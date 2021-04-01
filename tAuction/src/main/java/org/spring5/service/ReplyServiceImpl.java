package org.spring5.service;

import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;
import org.spring5.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	//댓글 입력
	@Override
	public int replyInsert(ReplyVO replyVO) {
		log.info("댓글입력====> " + replyVO);
		
		return replyMapper.replyInsert(replyVO);
	}
	//댓글조회
	@Override
	public ReplyVO replyRead(Long rno) {
		return replyMapper.replyRead(rno);
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
		public ReplyPageDTO replyGetList(Criteria cri, Long bno) {
			
			return new ReplyPageDTO(
							replyMapper.replyGetCountByBno(bno),
							replyMapper.replyGetList(cri, bno));
		}

	//댓글 삭제
	@Override
	public int replyDelete(Long rno) {
		log.info("댓글삭제 : rno : " + rno);
		
		return replyMapper.replyDelete(rno);
	}

	//댓글 수정
	@Override
	public int replyModify(ReplyVO replyVO) {
		log.info("댓글수정 =====> " + replyVO);
		
		return replyMapper.replyModify(replyVO);
	}
	
	
}
