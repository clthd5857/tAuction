package org.spring5.controller;

import javax.servlet.http.HttpSession;

import org.spring5.domain.MemberVO;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

public interface MemberController {

	public void memberInsert(Model model);
	
	public ResponseEntity<String> checkId(String memberId);
	//public String checkId(String memberId);
	public ResponseEntity<String> checkPassword(String memberId,String memberPassword);
	
	public ResponseEntity<String> checkEmail(String email) throws Exception;
	
//	public void myPage(HttpSession session, Model model);
	public void myPage(String memberId, Model model);
	
	public String memberModify(MemberVO memberVO); 
	
	public void changePasswordView(String memberId, Model model);
	
	public String changePassword(MemberVO memberVO);
	
	public void memberDeleteView(String memberId, Model model);
	
	public String memberDelete(MemberVO memberVO, HttpSession session);
	
	//public String memberRemove(MemberVO memberVO, HttpSession session);
	public String memberRemove(String memberId, HttpSession session);
	
	public ResponseEntity<MemberVO> memberInfo(String memberId);
	
	
}
