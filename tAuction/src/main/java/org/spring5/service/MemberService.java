package org.spring5.service;

import org.spring5.domain.MemberVO;

public interface MemberService {
	public void memberInsert(MemberVO memberVO);
	
	public void memberModify(MemberVO memberVO);
	
	
	public String checkId(String memberId);
	
	public String checkPassword(String memberId);
	
	//회원 정보 가져오기
	public MemberVO memberSelect(String memberId);
	
	//회원 탈퇴
	public void memberDelete(MemberVO memberVO);
	
	//회원 삭제 요청 플래스 변경
	public void memberRemove(String memberId);
	
	//회원 비밀번호 변경
	public void changePassword(MemberVO memberVO);
	
   //방문자 카운트 컬럼 생성
   public void visitorCount();
   
   public void visitorCountUp();
	
	
}