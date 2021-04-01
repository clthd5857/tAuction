package org.spring5.service;

import java.util.List;

import org.spring5.domain.ChatRoomVO;
import org.spring5.domain.MessageVO;
import org.spring5.mapper.ChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;



@Service
public class ChatService {
	
	@Setter(onMethod_ = {@Autowired})
	private ChatMapper chatMapper;
	
	
	//사용자 간의 채팅방이 있는지 확인하고 방을 생성 혹은 수정하여 방 번호를 전달한다.
	@Transactional
	public Long insertCreateChatRoom(ChatRoomVO chatRoomVO) {
		if(chatMapper.selectCheckRoom(chatRoomVO) == 0) {
			chatMapper.insertCreateChatRoom(chatRoomVO);
			return chatMapper.selectRoomNumber(chatRoomVO);
		} else {
			chatMapper.updateChatRoom(chatRoomVO);
			return chatMapper.selectRoomNumber(chatRoomVO);
		}
	}
	
	
	//사용자가 Sender(즉, 판매자 일때)
	public List<ChatRoomVO> senderList(String memberId) {
		return chatMapper.sendRoomList(memberId);
	}
	
	//사용자가 Receiver(즉, 구매자 일때)
	public List<ChatRoomVO> receiverList(String memberId) {
		return chatMapper.receiveRoomList(memberId);
	}
	
	
	
	//채팅장에 기존 메세지 정보 받아오기
		//메세지 리스트 받아오기
	public List<MessageVO> messageList(Long chatRoomNo){
		return chatMapper.messageList(chatRoomNo);
	}
	
		//방정보 받아오기
	public ChatRoomVO roomInfo(Long chatRoomNo) {
		return chatMapper.roomInfo(chatRoomNo);
	}
	
   
	//채팅 입력하기
	public int chatting(MessageVO messageVO) {
		return chatMapper.chatting(messageVO);
	}
	
	
	//===============================관리자
	
	
	public List<MessageVO> adminRooms(String memberId){
		return chatMapper.adminRooms(memberId);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
