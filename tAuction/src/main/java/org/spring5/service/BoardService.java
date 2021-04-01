package org.spring5.service;

import java.util.List;

import org.spring5.domain.AuctionDetailVO;
import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;

public interface BoardService {
	
	//게시물 보기
	public List<BoardVO> boardGetList(Criteria cri);
	
	public int boardGetTotalCount(Criteria cri);
	
	//게시물 세부정보
	public BoardVO boardRead(Long bno);
	public boolean viewCount(Long bno);
	
	//등록
	public void boardInsert(BoardVO boardVO);
	
	//수정
	public boolean boardModify(BoardVO boardVO);
	
	//삭제(Remove) ==> flag 교체해주는거
	public boolean boardRemove(Long bno);
	
	//삭제(Delete) ==> 진짜 삭제
	public boolean boardDelete(Long bno);
	
	//첨부 파일
	public List<BoardAttachVO> getAttachList(Long bno);
	
	//********************************경매(bidding)*************************************
		//입찰
	public Long biddingInsertAndUpdate(AuctionDetailVO auctionDetailVO);
	
		//읽기
	public List<AuctionDetailVO> biddingReadInMyPage(String memberId);
	public AuctionDetailVO biddingRead(AuctionDetailVO auctionDetailVO);
	
		//입찰 취소
	public boolean biddingDelete(AuctionDetailVO auctionDetailVO);
	
	
	//********************************찜(likeTo)*************************************
	//찜 체크여부
	public String likeToCheck (BoardVO boardVO);
	
	//찜 (bno별 카운트)
	public Long likeCountByBno(Long bno);
	
	//찜 (등록)
	public void like_check (BoardVO boardVO);
	
	//찜 (해제)
	public void like_check_cancel (BoardVO boardVO);

}
