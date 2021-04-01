package org.spring5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyVO;

public interface PostReplyMapper {

	//¥Ò±€ √ﬂ∞°
	public int postReplyInsert(ReplyVO replyVO);
	
	//¥Ò±€ ¡∂»∏
	public ReplyVO postReplyRead(Long rno);
	
	//¥Ò±€¡∂»∏ ∆‰¿Ã¬°
	public List<ReplyVO> postReplyGetList(@Param("cri") Criteria cri,
									  @Param("bno") Long bno);
	
	//∆Ø¡§ ∞‘Ω√±€ø° ¥Î«— - ¥Ò±€ ∞πºˆ
	public Long postReplyGetCountByBno(Long bno);

	//¥Ò±€ ªË¡¶
	public int postReplyDelete(Long rno);
	
	//¥Ò±€ ºˆ¡§
	public int postReplyModify(ReplyVO replyVO);
	
	

}
