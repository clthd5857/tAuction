package org.spring5.mapper;

import java.util.List;

import org.spring5.domain.ChatRoomVO;
import org.spring5.domain.MessageVO;

public interface ChatMapper {
	
	public int selectCheckRoom(ChatRoomVO chatRoomVO);
	
	public int insertCreateChatRoom(ChatRoomVO chatRoomVO);
	
	public int updateChatRoom(ChatRoomVO chatRoomVO);
	
	public Long selectRoomNumber(ChatRoomVO chatRoomVO);
	
	
	//방 정보 가져오기
	public List<ChatRoomVO> sendRoomList(String memberId);
	public List<ChatRoomVO> receiveRoomList(String memberId);
	
	//메세지 리스트 불러오기
	public List<MessageVO> messageList(Long chatRoomNo);
	
	public ChatRoomVO roomInfo(Long chatRoomNo);
	
	public int chatting(MessageVO messageVO);
	
	//===============================관리자 채팅
	
	public List<MessageVO> adminRooms(String memberId);
	
	
	
}
