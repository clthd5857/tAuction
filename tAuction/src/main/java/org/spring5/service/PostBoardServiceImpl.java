package org.spring5.service;

import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.mapper.PostAttachMapper;
import org.spring5.mapper.PostBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PostBoardServiceImpl implements PostBoardService {
	
	@Autowired
	private PostBoardMapper postBoardMapper;
	
	@Autowired
	private PostAttachMapper postAttachMapper;
	
	//공지글 가져오기
	public List<BoardVO> postBoardGetList(Criteria cri) {
		if(cri.getSearchKeyword()=="") {
			return postBoardMapper.postBoardGetList(cri);
		} else {
			return postBoardMapper.postBoardGetListWithPagingAndSearching(cri);
		}
	}
	
	
	//공지글 읽기
	public BoardVO postBoardRead(Long bno) {
		return postBoardMapper.postBoardRead(bno);
	}
	
	@Override
	public boolean viewCount(Long bno) {
		return postBoardMapper.viewCount(bno)==1;
	}
	
	//공지글 삽입
	@Transactional
	@Override
	public void postBoardInsert(BoardVO boardVO) {
		postBoardMapper.postBoardInsert(boardVO);
		
		if(boardVO.getAttachList() == null || boardVO.getAttachList().size() <= 0) {
			return;
		}
		
		boardVO.getAttachList().forEach(attach -> {
			attach.setBno(boardVO.getBno());
			postAttachMapper.attachInsert(attach);
		});
	}
	
	//공지글 수정
	@Transactional
	@Override
	public boolean postBoardModify(BoardVO boardVO) {
		postAttachMapper.attachDeleteAll(boardVO.getBno());
		
		boolean modifyResult = postBoardMapper.postBoardModify(boardVO) == 1;
			if(modifyResult && boardVO.getAttachList() != null && boardVO.getAttachList().size() > 0) {
				boardVO.getAttachList().forEach(attach -> {
					attach.setBno(boardVO.getBno());
					postAttachMapper.attachInsert(attach);
				});
			}		
		return modifyResult;
	}
	//공지글 삭제
	@Override
	public boolean postBoardDelete(Long bno) {
		postAttachMapper.attachDeleteAll(bno);
		return postBoardMapper.postBoardDelete(bno)==1;
	}

	@Override
	public List<BoardAttachVO> postGetAttachList(Long bno) {
		return postAttachMapper.attachFindByBno(bno);
	}

	@Override
	public int postBoardGetTotalCount(Criteria cri) {
		return postBoardMapper.postBoardGetTotalCount(cri);
	}


}
