package org.spring5.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MessageVO {
	private Long messageNo;
	private String messageContent;
	private Timestamp sendTime;
	private Timestamp readTime;
	private String senderId;
	private String receiverId;
	private Long chatRoomNo;
}
