package org.spring5.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.spring5.domain.MemberVO;
import org.spring5.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@NoArgsConstructor
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_=@Autowired)
	private MemberMapper memberMapper;
	
	//Member 등록 
	@Override
	public void memberInsert(MemberVO memberVO) {
		// TODO Auto-generated method stub
		log.info("Insert 서비스 시작");
		log.info(memberVO);
		
		memberMapper.memberInsert(memberVO);//사용자 정보추가
		
		memberMapper.memberAuthInsert(memberVO.getMemberId());//사용자 권한 추가
	}
	//Member 수정 
	@Override
	public void memberModify(MemberVO memberVO) {
		// TODO Auto-generated method stub
		log.info("modify 서비스 시작");
		log.info(memberVO);
		memberMapper.memberModify(memberVO);	
	}
	
	@Override
	public String checkId(String memberId) {
		// TODO Auto-generated method stub
		log.info("memberId check 서비스 시작");
		int count = memberMapper.checkId(memberId);//db id검색 사용자 확인
		String result="false";
		if(count==1)//id 검색시 한명일 경우 중복
		{
			result="true";
		}
		
		return result;
	
	}
	@Override
	public String checkPassword(String memberId) {
		log.info("memberPassword check 서비스 시작");
		return memberMapper.checkPassword(memberId);
	}
	@Override
	public MemberVO memberSelect(String memberId) {
		// TODO Auto-generated method stub
		log.info("회워정보 가져오기");
		MemberVO memberVO = memberMapper.memberSelect(memberId);
		return memberVO;
	}
	@Override
	public void memberDelete(MemberVO memberVO) {
		// TODO Auto-generated method stub
		log.info("회원정보 삭제");
		memberMapper.memberDelete(memberVO);
	}
	@Override
	public void memberRemove(String memberId) {
		// TODO Auto-generated method stub
		log.info("회원삭제 플래그");
		memberMapper.memberRemove(memberId);
	}
	@Override
	public void changePassword(MemberVO memberVO) {
		// TODO Auto-generated method stub
		log.info(memberVO);
		memberMapper.changePassword(memberVO);
	}
	
	///////////방문자수
	

   //==================================================
   @Override
   public void visitorCount() {
      // TODO Auto-generated method stub
      memberMapper.visitorCount();
   }
   @Override
   public void visitorCountUp() {
      // TODO Auto-generated method stub
      
   
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
      Date date = new Date();
      
   
      String todayDate=sdf.format(date);
      
      log.info(todayDate);
      
      
      memberMapper.visitorCountUp(todayDate);
      
      log.info("업 완료");
      
   }
	

   

}
