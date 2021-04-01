package org.spring5.service;

import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;
import org.spring5.mapper.PostReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PostReplyServiceImpl implements PostReplyService {

	@Setter(onMethod_ = @Autowired)
	private PostReplyMapper postReplyMapper;
	
	//´ñ±Û ÀÔ·Â
	@Override
	public int postReplyInsert(ReplyVO replyVO) {
		log.info("´ñ±ÛÀÔ·Â====> " + replyVO);
		
		return postReplyMapper.postReplyInsert(replyVO);
	}
	//´ñ±ÛÁ¶È¸
	@Override
	public ReplyVO postReplyRead(Long rno) {
		return postReplyMapper.postReplyRead(rno);
	}
	
	
	//´ñ±Û Á¶È¸ (Æ¯Á¤ °Ô½Ã±Û)
		@Override
		public ReplyPageDTO postReplyGetList(Criteria cri, Long bno) {
			
			return new ReplyPageDTO(
					postReplyMapper.postReplyGetCountByBno(bno),
					postReplyMapper.postReplyGetList(cri, bno));
		}

	//´ñ±Û »èÁ¦
	@Override
	public int postReplyDelete(Long rno) {
		log.info("´ñ±Û»èÁ¦ : rno : " + rno);
		
		return postReplyMapper.postReplyDelete(rno);
	}

	//´ñ±Û ¼öÁ¤
	@Override
	public int postReplyModify(ReplyVO replyVO) {
		log.info("´ñ±Û¼öÁ¤ =====> " + replyVO);
		
		return postReplyMapper.postReplyModify(replyVO);
	}
	
	
}
