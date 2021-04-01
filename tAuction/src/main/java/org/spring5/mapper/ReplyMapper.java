package org.spring5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyVO;

public interface ReplyMapper {

	//댓글 추가
	public int replyInsert(ReplyVO replyVO);
	
	//댓글 조회
	public ReplyVO replyRead(Long rno);
	
	//댓글조회 페이징
	public List<ReplyVO> replyGetList(@Param("cri") Criteria cri,
									  @Param("bno") Long bno);
	
	//특정 게시글에 대한 - 댓글 갯수
	public Long replyGetCountByBno(Long bno);

	//댓글 삭제
	public int replyDelete(Long rno);
	
	//댓글 수정
	public int replyModify(ReplyVO replyVO);
	
	

}
