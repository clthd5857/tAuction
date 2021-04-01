package org.spring5.service;

import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;

public interface CmBoardService {
	
	//후기 게시물 보기
	public List<BoardVO> cmBoardGetList(Criteria cri);
	
	public int cmBoardGetTotalCount(Criteria cri);
	
	//후기 게시글 상세보기
	public BoardVO cmBoardRead(Long cmBno);
	
	public boolean viewCount(Long bno);
	
	
	//후기 게시글 추가
	public void cmBoardInsert(BoardVO boardVO);
	
	//후기 게시글 수정
	public boolean cmBoardModify(BoardVO boardVO);
	
	//삭제(Remove) ==> flag 교체해주는거
	public boolean cmBoardRemove(Long bno);
	
	//삭제(Delete) ==> 진짜 삭제
	public boolean cmBoardDelete(Long bno);
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
}
