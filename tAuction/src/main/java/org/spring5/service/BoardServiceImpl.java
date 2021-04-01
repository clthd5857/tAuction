package org.spring5.service;

import java.util.List;

import org.spring5.domain.AuctionDetailVO;
import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.ChatRoomVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.MessageVO;
import org.spring5.mapper.BoardAttachMapper;
import org.spring5.mapper.BoardMapper;
import org.spring5.mapper.ChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardAttachMapper boardAttachMapper;
	
	@Autowired
	private ChatMapper chatMapper;
	
	
	@Override
	public List<BoardVO> boardGetList(Criteria cri) {
		if(cri.getSearchKeyword()=="") {
			return boardMapper.boardGetListWithPaging(cri);
		} else {
			return boardMapper.boardGetListWithPagingAndSearching(cri);
		}
	}

	@Override
	public int boardGetTotalCount(Criteria cri) {
		return boardMapper.boardGetTotalCount(cri);
	}

	@Override
	public BoardVO boardRead(Long bno) {
		return boardMapper.boardRead(bno);
	}
	
	@Override
	public boolean viewCount(Long bno) {
		return boardMapper.viewCount(bno)==1;
	}
	
	
	@Override
	@Transactional
	public void boardInsert(BoardVO boardVO) {
		boardMapper.boardInsert(boardVO);
		
		if(boardVO.getAttachList() == null || boardVO.getAttachList().size() <= 0) {
			return;
		}
		
		boardVO.getAttachList().forEach(attach -> {
			attach.setBno(boardVO.getBno());
			boardAttachMapper.attachInsert(attach);
			boardAttachMapper.imageFileUpate(boardVO.getBno());
		});
	}

	@Transactional
	@Override
	public boolean boardModify(BoardVO boardVO) {
		boardAttachMapper.attachDeleteAll(boardVO.getBno());
		
		boolean modifyResult = boardMapper.boardModify(boardVO) == 1;
			if(modifyResult && boardVO.getAttachList() != null && boardVO.getAttachList().size() > 0) {
				boardVO.getAttachList().forEach(attach -> {
					attach.setBno(boardVO.getBno());
					boardAttachMapper.attachInsert(attach);
					boardAttachMapper.imageFileUpate(boardVO.getBno());
				});
			}		
		return modifyResult;
	}

	@Override
	public boolean boardRemove(Long bno) {
		return boardMapper.boardRemove(bno)==1;
	}

	@Transactional
	@Override
	public boolean boardDelete(Long bno) {
		boardAttachMapper.attachDeleteAll(bno);
		return boardMapper.boardDelete(bno)==1;
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return boardAttachMapper.attachFindByBno(bno);
	}
	
	
	//********************************경매(bidding)*************************************
	//입찰
	@Transactional
	@Override
	public Long biddingInsertAndUpdate(AuctionDetailVO auctionDetailVO) {
		Long result = 0L;
		Long bno = auctionDetailVO.getBno();
		if(boardMapper.biddingCheck(auctionDetailVO)==1) {
			boardMapper.biddingUpdate(auctionDetailVO);
		} else {
			boardMapper.biddingInsert(auctionDetailVO);
		}
		//board 테이블에 currentPrice 입력
		boardMapper.biddingBoardUpdate(bno);
		
		//현재 가격과 즉시 입찰가 비교
		BoardVO boardVO = boardMapper.boardRead(bno); //판매자 아이디 가능 ==> senderId
		log.info("currentPrice : "+boardVO.getCurrentPrice());
		log.info("maxPrice : "+boardVO.getMaxPrice());
		
		
		if(boardVO.getCurrentPrice().equals(boardVO.getMaxPrice())) {
			boardMapper.biddingEnd(bno);
			boardMapper.updateWinner(auctionDetailVO); //selectKey로 memberId를 받아옴 
			/////////////////채팅방 연동
			
			String senderId = boardVO.getMemberId();
			String receiverId = auctionDetailVO.getMemberId();
			String title = boardVO.getTitle();
			
			ChatRoomVO chatRoomVO = new ChatRoomVO();
			chatRoomVO.setSenderId(senderId);
			chatRoomVO.setReceiverId(receiverId);
			chatRoomVO.setRoomName(title);
			if(chatMapper.selectCheckRoom(chatRoomVO) == 0) {
				chatMapper.insertCreateChatRoom(chatRoomVO);
			} else {
				chatMapper.updateChatRoom(chatRoomVO);
			}
			Long chatRoomNo =chatMapper.selectRoomNumber(chatRoomVO); 
			
			
			MessageVO messageVO = new MessageVO();
			
			messageVO.setMessageContent("안녕하세요. "+title+" 게시글에 낙찰가 : "+boardVO.getCurrentPrice()+"원으로 낙찰되셨습니다.");
			messageVO.setSenderId(senderId);
			messageVO.setReceiverId(receiverId);
			messageVO.setChatRoomNo(chatRoomNo);
			
			chatMapper.chatting(messageVO);
			
			return chatRoomNo;
			
			
		}
		
		boardMapper.bidCountUpdate(bno);
		return result;
	}

	//상세정보 보기
	@Override
	public List<AuctionDetailVO> biddingReadInMyPage(String memberId) {
		return boardMapper.biddingReadInMyPage(memberId);
	}

	@Override
	public AuctionDetailVO biddingRead(AuctionDetailVO auctionDetailVO) {
		return boardMapper.biddingRead(auctionDetailVO);
	}

	//삭제
	@Override
	@Transactional
	public boolean biddingDelete(AuctionDetailVO auctionDetailVO) {
		int result=boardMapper.biddingDelete(auctionDetailVO);
		boardMapper.biddingBoardUpdate(auctionDetailVO.getBno());
		boardMapper.bidCountUpdate(auctionDetailVO.getBno());
		return result==1;
	}
	//********************************찜(likeTo)*************************************

	//찜 체크여부
	@Override
	public String likeToCheck (BoardVO boardVO) {
		return boardMapper.likeToCheck(boardVO);
	}
	
	//찜 (bno별 카운트)
	@Override
	public Long likeCountByBno(Long bno) {
		return boardMapper.likeCountByBno(bno);
	}
	
	//찜 (등록)
	@Override
	public void like_check (BoardVO boardVO) {
		boardMapper.like_check(boardVO);
	}
	
	//찜 (해제)
	@Override
	public void like_check_cancel (BoardVO boardVO) {
		boardMapper.like_check_cancel(boardVO);
	}

	
}
