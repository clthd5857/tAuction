package org.spring5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.MyBiddingVO;

public interface MemBoardMapper {

	//내 찜 리스트
	public List<BoardVO> myLikeList(@Param("cri") Criteria cri, @Param("memberId") String memberId);
	//찜 리스트 카운트
	public int likeListTotalCount(@Param("cri") Criteria cri, @Param("memberId") String memberId);
	
	
	//내 입찰 리스트
	public List<MyBiddingVO> myBiddingList(@Param("cri") Criteria cri, @Param("memberId") String memberId);
	//입찰 리스트 카운트
	public int BiddingListTotalCount(@Param("cri") Criteria cri, @Param("memberId") String memberId);
	
	
	//내 낙찰 리스트
	public List<MyBiddingVO> myWinningList(@Param("cri") Criteria cri, @Param("memberId") String memberId);
	//낙찰 리스트 카운트
	public int winningListTotalCount(@Param("cri") Criteria cri, @Param("memberId") String memberId);
	
	
	//내가 쓴 글 리스트
	public List<BoardVO> myBoardList(@Param("cri") Criteria cri, @Param("memberId") String memberId);
	//내가 쓴 글 카운트
	public int myBoardListTotalCount(@Param("cri") Criteria cri, @Param("memberId") String memberId);
	
	
}
