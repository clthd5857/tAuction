package org.spring5.domain;

import lombok.Data;

@Data
public class ChatRoomVO {
	private Long chatRoomNo;
	private String roomName;
	private String senderId;
	private String receiverId;

}
