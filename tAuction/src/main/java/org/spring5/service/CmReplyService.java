package org.spring5.service;

import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;

public interface CmReplyService {
	
	//커뮤니티 댓글 추가
	public int cmReplyInsert(ReplyVO replyVO);
	
	//커뮤니티 댓글 조회
	public ReplyVO cmReplyRead(Long rno);
	
	//커뮤니티 댓글조회 : 댓글 갯수 & 댓글목록 정보 (페이징)
	public ReplyPageDTO cmReplyGetList(Criteria cri, Long bno);

	//커뮤니티 댓글 삭제
	public int cmReplyDelete(Long rno);
	
	//커뮤니댓글 수정
	public int cmReplyModify(ReplyVO replyVO);
}
