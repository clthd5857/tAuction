package org.spring5.mapper;

import java.util.List;

import org.spring5.domain.AuctionDetailVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.LikeToVO;

public interface BoardMapper {
	
	public List<BoardVO> boardGetListWithPaging(Criteria cri);
	
	public List<BoardVO> boardGetListWithPagingAndSearching(Criteria cri);
	
	//총 게시물 개수
	public int boardGetTotalCount(Criteria cri);
	
	//List dueDate Check
	public List<BoardVO> boardGetListDueDateCheck();
	
	//게시글 추가(Insert)
	public int boardInsert(BoardVO boardVO);
	
	//게시글 상세보기(Read)
	public BoardVO boardRead(Long bno);
	public int viewCount(Long bno);
	
	//게시글 수정
	public int boardModify(BoardVO boardVO);
	
	//게시글 삭제 (Remove)
	public int boardRemove(Long bno);
	
	//게시글 삭제 (Delete)
	public int boardDelete(Long bno);
	
	
	
	//******************경매(bidding)*****************************************************
		//경매 갱신
	public int biddingBoardUpdate(Long bno);
	public int bidCountUpdate(Long bno);
		//경매 마감
	public int biddingEnd(Long bno);
	
		//경매 상세보기
	public AuctionDetailVO biddingRead(AuctionDetailVO auctionDetailVO);
	public List<AuctionDetailVO> biddingReadInMyPage(String memberId);
		//입찰 확인
	public int biddingCheck(AuctionDetailVO auctionDetailVO);
		//입찰가 변경
	public int biddingUpdate(AuctionDetailVO auctionDetailVO);
		//입찰
	public int biddingInsert(AuctionDetailVO auctionDetailVO);
		//입찰 취소
	public int biddingDelete(AuctionDetailVO auctionDetailVO);
	
		//마감 시 Winner만 남김
	public int updateWinner(AuctionDetailVO auctionDetailVO);
	public int deleteNotWinner(Long bno);
	
	
	//******************찜(likeTo)*****************************************************
	//찜 체크여부
	public String likeToCheck(BoardVO boardVO);
		
	//찜 bno 리스트
	public List<Long> getLikeBno(LikeToVO likeToVO);
		
	//찜 카운트
	public Long likeCountByBno(Long bno);
	
	//좋아요 체크
	public void like_check (BoardVO boardVO);
		
	//좋아요 체크해제
	public void like_check_cancel(BoardVO boardVO);
	
}
