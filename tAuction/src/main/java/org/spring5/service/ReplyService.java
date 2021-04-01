package org.spring5.service;

import org.spring5.domain.Criteria;
import org.spring5.domain.ReplyPageDTO;
import org.spring5.domain.ReplyVO;

public interface ReplyService {

	//댓글 추가
	public int replyInsert(ReplyVO replyVO);
		
	//댓글조회
	public ReplyVO replyRead(Long rno);
	
	//댓글조회
	//public List<ReplyVO> replyGetList(Criteria cri, Long bno);
	
	//댓글조회 : 댓글 갯수 & 댓글목록 정보 (페이징)
	public ReplyPageDTO replyGetList(Criteria cri, Long bno);
		
	//댓글 삭제
	public int replyDelete(Long rno);
		
	//댓글 수정
	public int replyModify(ReplyVO replyVO);
}
