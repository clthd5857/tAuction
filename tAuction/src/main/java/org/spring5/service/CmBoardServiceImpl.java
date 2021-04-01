package org.spring5.service;

import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.mapper.CmBoardAttachMapper;
import org.spring5.mapper.CmBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CmBoardServiceImpl implements CmBoardService {
	
	@Autowired
	private CmBoardMapper cmBoardMapper;
	
	@Autowired
	private CmBoardAttachMapper cmBoardAttachMapper;
	
	@Override
	public List<BoardVO> cmBoardGetList(Criteria cri) {
		if(cri.getSearchKeyword()=="") {
			return cmBoardMapper.cmBoardGetListWithPaging(cri);
		} else {
			return cmBoardMapper.cmBoardGetListWithPagingAndSearching(cri);
		}
	}
	
	@Override
	public int cmBoardGetTotalCount(Criteria cri) {
		return cmBoardMapper.cmBoardGetTotalCount(cri);
	}
	
	@Override
	public BoardVO cmBoardRead(Long bno) {
		BoardVO result=cmBoardMapper.cmBoardRead(bno);
		System.out.println(result.toString());
		return result;
	}
	
	@Override
	public boolean viewCount(Long bno) {
		return cmBoardMapper.cmViewCount(bno)==1;
	}
	
	
	@Override
	@Transactional
	public void cmBoardInsert(BoardVO boardVO) {
		cmBoardMapper.cmBoardInsert(boardVO);
		
		if(boardVO.getAttachList() == null || boardVO.getAttachList().size() <= 0) {
			return;
		}
		
		boardVO.getAttachList().forEach(attach -> {
			attach.setBno(boardVO.getBno());
			cmBoardAttachMapper.attachInsert(attach);
			cmBoardAttachMapper.imageFileUpate(boardVO.getBno()); 
		});
	}


	@Transactional
	@Override
	public boolean cmBoardModify(BoardVO boardVO) {
		cmBoardAttachMapper.attachDeleteAll(boardVO.getBno());
		
		boolean modifyResult = cmBoardMapper.cmBoardModify(boardVO) == 1;
			if(modifyResult && boardVO.getAttachList() != null && boardVO.getAttachList().size() > 0) {
				boardVO.getAttachList().forEach(attach -> {
					attach.setBno(boardVO.getBno());
					cmBoardAttachMapper.attachInsert(attach);
					cmBoardAttachMapper.imageFileUpate(boardVO.getBno()); 
				});
			}		
		return modifyResult;
	}
	
	@Override
	public boolean cmBoardRemove(Long bno) {
		return cmBoardMapper.cmBoardRemove(bno)==1;
	}
	
	@Transactional
	public boolean cmBoardDelete(Long bno) {
		cmBoardAttachMapper.attachDeleteAll(bno);
		return cmBoardMapper.cmBoardDelete(bno)==1;
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return cmBoardAttachMapper.attachFindByBno(bno);
	}

	
}
