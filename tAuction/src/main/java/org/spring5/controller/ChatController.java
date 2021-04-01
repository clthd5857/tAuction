package org.spring5.controller;

import java.util.ArrayList;
import java.util.List;

import org.spring5.domain.ChatRoomVO;
import org.spring5.domain.MessageVO;
import org.spring5.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {

	@Setter(onMethod_ = {@Autowired})
	private ChatService chatService;
	
	List<ChatRoomVO> roomList = new ArrayList<ChatRoomVO>();
	static int roomNumber = 0;
	
	//이거도 안씀
	@RequestMapping("/chat")
	public String chat() {
		return "/chat/chat";
	}
	
//	@RequestMapping("/room2")
//	public String room2(String memberId, Model model) {
//		List<MessageVO> adminRoomList = chatService.adminRooms(memberId);
//		log.info("값 확인 : " + chatService.adminRooms(memberId));
//		
//		model.addAttribute("adminRoomList", adminRoomList);
//		
//		return "/chat/room2";
//	}
	
	
	
   @RequestMapping("/room")
   public String room(String memberId, Model model) {
      List<ChatRoomVO> senderList = chatService.senderList(memberId);
      List<ChatRoomVO> receiverList = chatService.receiverList(memberId);
      model.addAttribute("senderList", senderList);
      model.addAttribute("receiverList", receiverList);
      
      return "/chat/room";
   }
   
	@GetMapping("/createRoom")
	public String createRoom(ChatRoomVO chatRoomVO){
		Long chatRoomNo = chatService.insertCreateChatRoom(chatRoomVO);
		log.info(chatRoomNo);
		return "redirect:/moveChating?chatRoomNo="+chatRoomNo;
	}
	
	//채팅 방으로 이동하기 ==> webSocket을 사용하는 JSP 페이지를 호출
	@RequestMapping("/moveChating")
	public String chating(Long chatRoomNo, Model model) {
		model.addAttribute("roomInfo", chatService.roomInfo(chatRoomNo));
		model.addAttribute("messageList",chatService.messageList(chatRoomNo));
		return "/chat/chat";
	}
	
	
	@PostMapping("/InsertChatting")
	@ResponseBody
	public String InsertChatting(MessageVO messageVO) {
		if(chatService.chatting(messageVO)==1) {
			return "success";
		} else {
			return "error";
		}
	}
}
