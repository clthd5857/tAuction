package org.spring5.service;

import java.util.List;

import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.MyBiddingVO;

public interface MemBoardService {

	//내 찜 리스트
	public List<BoardVO> myLikeList(Criteria cri, String memberId);
	//내 찜 리스트 카운트
	public int likeListTotalCount(Criteria cri, String memberId);
	
	
	//내 입찰 리스트
	public List<MyBiddingVO> myBiddingList(Criteria cri, String memberId);
	//내 입찰 리스트 카운트
	public int BiddingListTotalCount(Criteria cri, String memberId);
	
	
	//내 낙찰 리스트
	public List<MyBiddingVO> myWinningList(Criteria cri, String memberId);
	//내 낙찰 리스트 카운트
	public int winningListTotalCount(Criteria cri, String memberId);
	
	
	//내가 쓴 끌 리스트
	public List<BoardVO> myBoardList(Criteria cri, String memberId);
	//내가 쓴 글 카운트
	public int myBoardListTotalCount(Criteria cri, String memberId);
}
