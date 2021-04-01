package org.spring5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyVO;

public interface CmReplyMapper {
	
	//커뮤니티 댓글 추가
	public int cmReplyInsert(ReplyVO replyVO);
	
	//커뮤니티 댓글 조회
	public ReplyVO cmReplyRead(Long rno);
	
	//커뮤니티 댓글조회 페이징
	public List<ReplyVO> cmReplyGetList(@Param("cri") Criteria cri,
										  @Param("bno") Long bno);
	
	//커뮤니티 특정 게시글에 대한 - 댓글 갯수
	public Long cmReplyGetCountByBno(Long bno);

	//커뮤니티 댓글 삭제
	public int cmReplyDelete(Long rno);
	
	//커뮤니티 댓글 수정
	public int cmReplyModify(ReplyVO replyVO);

}
