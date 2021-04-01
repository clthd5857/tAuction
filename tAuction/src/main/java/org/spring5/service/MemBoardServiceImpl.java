package org.spring5.service;

import java.util.List;

import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.MyBiddingVO;
import org.spring5.mapper.MemBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemBoardServiceImpl implements MemBoardService {

	@Autowired
	private MemBoardMapper memBoardMapper;
	
	//내 찜 리스트- 카운트
	@Override
	public List<BoardVO> myLikeList(Criteria cri, String memberId) {
		return memBoardMapper.myLikeList(cri, memberId);
	}
	@Override
	public int likeListTotalCount(Criteria cri, String memberId) {
		return memBoardMapper.likeListTotalCount(cri, memberId);
	}
	
	
	//내 입찰 리스트- 카운트
	@Override
	public List<MyBiddingVO> myBiddingList(Criteria cri, String memberId) {
		return memBoardMapper.myBiddingList(cri, memberId);
	}
	@Override
	public int BiddingListTotalCount(Criteria cri, String memberId) {
		return memBoardMapper.BiddingListTotalCount(cri, memberId);
	}
	
	
	//내 낙찰 리스트- 카운트
	@Override
	public List<MyBiddingVO> myWinningList(Criteria cri, String memberId) {
		return memBoardMapper.myWinningList(cri, memberId);
	}
	@Override
	public int winningListTotalCount(Criteria cri, String memberId) {
		return memBoardMapper.winningListTotalCount(cri, memberId);
	}
	
	
	//내가 쓴 끌 리스트 - 카운트
	@Override
	public List<BoardVO> myBoardList(Criteria cri, String memberId) {
		return memBoardMapper.myBoardList(cri, memberId);
	}
	@Override
	public int myBoardListTotalCount(Criteria cri, String memberId) {
		return memBoardMapper.myBoardListTotalCount(cri, memberId);
	}
	
	
}
