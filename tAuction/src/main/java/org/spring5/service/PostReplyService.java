package org.spring5.service;

import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;

public interface PostReplyService {

	//¥Ò±€ √ﬂ∞°
	public int postReplyInsert(ReplyVO replyVO);
		
	//¥Ò±€¡∂»∏
	public ReplyVO postReplyRead(Long rno);
	
	//¥Ò±€¡∂»∏ : ¥Ò±€ ∞πºˆ & ¥Ò±€∏Ò∑œ ¡§∫∏ (∆‰¿Ã¬°)
	public ReplyPageDTO postReplyGetList(Criteria cri, Long bno);
		
	//¥Ò±€ ªË¡¶
	public int postReplyDelete(Long rno);
		
	//¥Ò±€ ºˆ¡§
	public int postReplyModify(ReplyVO replyVO);
}
