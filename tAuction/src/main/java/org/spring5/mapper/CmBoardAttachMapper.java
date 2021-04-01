package org.spring5.mapper;

import java.util.List;

import org.spring5.domain.BoardAttachVO;

public interface CmBoardAttachMapper {

		//첨부파일 정보등록
		public void attachInsert(BoardAttachVO vo);
		
		//첨부파일 정보삭제
		public void attachDelete(String uuid);
		
		//첨부파일 정보 불러오기
		public List<BoardAttachVO> attachFindByBno(Long bno);
		
		//게시글 삭제시 해당bno 첨부파일 삭제
		public void attachDeleteAll(Long bno);
		
		public int imageFileUpate(Long bno);
	
}
