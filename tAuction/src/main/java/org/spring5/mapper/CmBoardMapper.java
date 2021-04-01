package org.spring5.mapper;

import java.util.List;

import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;

public interface CmBoardMapper {
	
	//후기 게시글 보기
	public List<BoardVO> cmBoardGetListWithPaging(Criteria cri);
	
	public List<BoardVO> cmBoardGetListWithPagingAndSearching(Criteria cri);
	
	//총 후기 게시물 개수
	public int cmBoardGetTotalCount(Criteria cri);
	
	//후기 게시글 상세보기
	public BoardVO cmBoardRead(Long bno);
	public int cmViewCount(Long bno);
	
	
	
	//후기 게시글 추가
	public int cmBoardInsert(BoardVO boardVO);
	
	//후기 게시글 수정
	public int cmBoardModify(BoardVO boardVO);
	
	//게시글 삭제 (Remove)
	public int cmBoardRemove(Long bno);
	
	//후기 게시글 삭제
	public int cmBoardDelete(Long bno);

}
