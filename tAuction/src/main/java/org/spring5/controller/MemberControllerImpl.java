package org.spring5.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.spring5.domain.MemberVO;
import org.spring5.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/member")
@AllArgsConstructor
public class MemberControllerImpl implements MemberController {
	
	@Setter(onMethod_=@Autowired)
	private MemberService memberService;	
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder pwencoder;
	

	
	//사용자 등록 창 불러오기
	@Override
	@GetMapping("/memberInsert")
	public void memberInsert(Model model) {
	}

	@PostMapping("/memberInsert")
	public String memberInsert(MemberVO memberVO, RedirectAttributes rttr) {
		memberVO.setMemberPassword(pwencoder.encode(memberVO.getMemberPassword()));
		memberService.memberInsert(memberVO);
		return "redirect:/index/index";
	}
	//아이디 중복 체크
	@Override
	@PostMapping("/checkId")
	public ResponseEntity<String> checkId(String memberId) {
		return new ResponseEntity<String>(memberService.checkId(memberId),HttpStatus.OK);
	}
	
	@Override
	@PreAuthorize("principal.username==#memberId")
	@PostMapping("/checkPassword")
	public ResponseEntity<String> checkPassword(String memberId,String memberPassword) {
		boolean result=pwencoder.matches(memberPassword, memberService.checkPassword(memberId));
		return new ResponseEntity<String>(String.valueOf(result),HttpStatus.OK);
	}
	
	
	//메일 인증번호 체크
	@GetMapping("/checkEmail")
	public ResponseEntity<String> checkEmail(String email) throws Exception{
		log.info("이메일 데이터 전송");
		log.info("인증번호: "+email);
		//인증 번호(난수) 생성
		Random random = new Random();
		
		int checkNum = random.nextInt(888888)+111111;
		
		log.info("인증번호 "+checkNum);
		
		
		//이메일 보내기
		
		String setFrom = "clthd5857@naver.com";
		String toMail=email;
		String title="회원가입 인증 이메일 입니다.";
		String content="홈페이지를 방문해주셔서 감사합니다."
					   +"<br><br>"
				       +"인증 번호는 "+checkNum+ " 입니다.<br>"
				       +"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
						
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
//	
		String num = Integer.toString(checkNum);
			
		return new ResponseEntity<String>(num,HttpStatus.OK);
	}
	
	//==========================================================현준이형
	//마이 페이지 창 불러오기
	@Override
	@PreAuthorize("principal.username==#memberId")
	@GetMapping("/myPage")
//	public void myPage(HttpSession session, Model model) {
	public void myPage(String memberId, Model model) {
		// TODO Auto-generated method stub
		//String memberId=(String)session.getAttribute("memberId");
		MemberVO memberVO= memberService.memberSelect(memberId);
		
		model.addAttribute("member",memberVO);
	}
	
	@Override
	@PreAuthorize("principal.username==#memberVO.memberId")
	@PostMapping("/memberModify")
	public String memberModify(MemberVO memberVO) {
		// TODO Auto-generated method stub
		log.info("modify 서비스 시작");
		memberService.memberModify(memberVO);
		return "redirect:/member/myPage?memberId="+memberVO.getMemberId();
	}
	
		
//	@Override
//	@GetMapping("/changePasswordView")
//	public String changePasswordView() {
//		// TODO Auto-generated method stub
//		return "member/changePasswordView";
//	}
	
	@Override
	@PreAuthorize("principal.username==#memberId")
	@GetMapping("/changePasswordView")
	public void changePasswordView(String memberId, Model model) {
		MemberVO memberVO = memberService.memberSelect(memberId);
		model.addAttribute("member", memberVO);
		
	}
	
	@PreAuthorize("principal.username==#memberVO.memberId")
	@PostMapping("/changePassword")
	public String changePassword(MemberVO memberVO) {
		memberVO.setMemberPassword(pwencoder.encode(memberVO.getMemberPassword()));
		memberService.changePassword(memberVO);
		return "redirect:/member/changePasswordView?memberId="+memberVO.getMemberId();
	}
	
//	@Override
//	//회원 삭제 창 불러오기
//	@GetMapping("/memberDeleteView")
//	public String memberDeleteView() {
//		// TODO Auto-generated method stub
//		return "member/memberDeleteView";
//	}
//	
	@Override
	@PreAuthorize("principal.username==#memberId")
	@GetMapping("/memberDeleteView")
	public void memberDeleteView(String memberId, Model model) {
		// TODO Auto-generated method stub
		MemberVO memberVO= memberService.memberSelect(memberId);
		model.addAttribute("member", memberVO);
		
	}
	
	
	@Override
	@PostMapping("/memberDelete")
	public String memberDelete(MemberVO memberVO, HttpSession session) {
		// TODO Auto-generated method stub
		log.info("회원 정보 완전 삭제");
		memberService.memberDelete(memberVO);
		session.invalidate();
		return "redirect:/index/index";
	}
	
	@Override
	@PreAuthorize("principal.username==#memberVO.memberId")
	@PostMapping("/memberRemove")
	public String memberRemove(String memberId, HttpSession session) {
		// TODO Auto-generated method stub
		memberService.memberRemove(memberId);
		session.invalidate();
		return "redirect:/index/index";
	}

	
   @Override
   @PreAuthorize("hasROLE('ROLE_MEMBER')")
   @PostMapping(value="/memberInfo",
         produces="application/json; charset=utf-8")
   public ResponseEntity<MemberVO> memberInfo(String memberId) {
      // TODO Auto-generated method stub
      log.info("membmerId: "+memberId);
      return new ResponseEntity<MemberVO>(memberService.memberSelect(memberId),HttpStatus.OK);
   }
	   
	
	


}
