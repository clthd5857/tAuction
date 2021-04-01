package org.spring5.mapper;

import org.spring5.domain.MemberVO;

public interface MemberMapper {
	
	public void memberInsert(MemberVO memberVO); //사용자 추가
	
	public void memberAuthInsert(String memberId);//사용자 권한 TA_MEMBER 추가
	
	public void memberModify(MemberVO memberVO); //사용자 정보 수정

	public int checkId(String memberId); //아이디 중복 확인
	
	public String checkPassword(String memberId);
	
	
	public MemberVO read(String memberId); //사용자 권한 찾기
	
	//==========================================================

	//멤버삭제 
	public void memberDelete(MemberVO memberVO);
	//회원 정보 가져오기
	public MemberVO memberSelect(String memberId);
	
	//비밀번호 변경
	public void changePassword(MemberVO memberVO);
	
	//삭제플래그
	public void memberRemove(String memberId);
	
	//============================================================
	
   //방문자 카운트 컬럼 생성
   public void visitorCount();
   
   //카운트 업
   public void visitorCountUp(String todayDate);
	
	
	
}
