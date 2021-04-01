package org.spring5.task;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.spring5.domain.AuctionDetailVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.ChatRoomVO;
import org.spring5.domain.MessageVO;
import org.spring5.mapper.BoardMapper;
import org.spring5.mapper.ChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
@Log4j
public class BiddingEndDueDate {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private ChatMapper chatMapper;
	
	@Transactional
	@Scheduled(cron = "2 0 * * * *")
	public void BiddingEndCheck() throws Exception {
		
		List<BoardVO> boardList = boardMapper.boardGetListDueDateCheck();
		
		Date currentTime = new Date();
		
		for(int i=0; i<boardList.size();i++) {
			Long bno = boardList.get(i).getBno();
			Timestamp dueDate = boardList.get(i).getDueDate();
			
			if(currentTime.getTime()>dueDate.getTime()) {
				AuctionDetailVO auctionDetailVO = new AuctionDetailVO();
				auctionDetailVO.setBno(bno);
				
				if(boardMapper.biddingCheck(auctionDetailVO)>0) {
					boardMapper.biddingEnd(bno);
					log.info(bno+"번이 마감되었습니다.");
					boardMapper.updateWinner(auctionDetailVO);
					
					String senderId = boardList.get(i).getMemberId();
					log.info("판매자 ID : "+senderId);
					
					auctionDetailVO.setMemberId(senderId);
					
					auctionDetailVO = boardMapper.biddingRead(auctionDetailVO);
					
					String receiverId = auctionDetailVO.getMemberId();
					log.info("낙찰자 ID : "+receiverId);
					String title = boardList.get(i).getTitle();
					
					ChatRoomVO chatRoomVO = new ChatRoomVO();
					chatRoomVO.setSenderId(senderId);
					chatRoomVO.setReceiverId(receiverId);
					chatRoomVO.setRoomName(title);
					if(chatMapper.selectCheckRoom(chatRoomVO) == 0) {
						log.info("새로운 방 생성합니다.");
						chatMapper.insertCreateChatRoom(chatRoomVO);
					} else {
						log.info("기존의 방을 수정합니다.");
						chatMapper.updateChatRoom(chatRoomVO);
					}
					
					Long chatRoomNo =chatMapper.selectRoomNumber(chatRoomVO); 
					
					
					MessageVO messageVO = new MessageVO();
					
					messageVO.setMessageContent("안녕하세요. "+title+" 게시글에 낙찰가 : "+boardList.get(i).getCurrentPrice()+"원으로 낙찰되셨습니다.");
					messageVO.setSenderId(senderId);
					messageVO.setReceiverId(receiverId);
					messageVO.setChatRoomNo(chatRoomNo);
					
					chatMapper.chatting(messageVO);
					
					
					
					
					//boardMapper.deleteNotWinner(bno);
				} else {
					boardMapper.biddingEnd(bno);
					log.info(bno+"번이 마감되었습니다. 낙찰자가 없습니다.");
				}
			}
			
		}			
		log.info("마감처리 완료");		
	}
	
}
