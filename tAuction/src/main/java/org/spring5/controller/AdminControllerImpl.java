package org.spring5.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.ChartVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.MessageVO;
import org.spring5.domain.PageDTO;
import org.spring5.service.AdminService;
import org.spring5.service.BoardService;
import org.spring5.service.ChatService;
import org.spring5.service.PostBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin")
public class AdminControllerImpl implements AdminController{

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private PostBoardService postBoardService;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private BoardService boardService;
	
	//메인화면 호출
	@Override
	@GetMapping("/adminMain")
	public void main(Model model) {
		// TODO Auto-generated method stub
		log.info("--------------------------------------");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		
		String sdfDate=sdf.format(date);
		String sdfDate1=sdf1.format(date);
	
		ChartVO ChartVO =adminService.adminCountView(sdfDate);
		List<MessageVO> adminRoomList = chatService.adminRooms("admin");
		
		model.addAttribute("adminRoomList", adminRoomList);
		model.addAttribute("adminCountView", ChartVO);
		model.addAttribute("mainChart", adminService.mainChart(sdfDate1));
	}
	

	
	//사용자 리스트 페이지 호출
	@Override
	@GetMapping("/adminMemberGetList")
	public void adminMemberGetList(Model model) {
		model.addAttribute("memberList",adminService.memberList());
	}
	
	
	//삭제 요청 사용자 리스트 호출
	@Override
	@GetMapping("/adminMemberRemoveList")
	public void adminMemberRemoveList(Model model) {
		log.info("삭제 요청");
		model.addAttribute("memberRemoveList",adminService.memberRemoveList());
		log.info("memberRemoveList");
	}
	

	
	//전체 게시물 조회 호출
	@Override
	@GetMapping("/adminBoardGetList")
	public void adminBoardGetList(Model model) {
		model.addAttribute("boardList",adminService.boardList());
	}
	
	
	//삭제 요청 게시물 호출
	@Override
	@GetMapping("/adminBoardRemoveList")
	public void adminBoardRemoveList(Model model) {
		model.addAttribute("boardRemoveList",adminService.boardRemoveList());
	}
	
	
	//커뮤니티
	@Override
	@GetMapping("/adminCmBoardGetList")
	public void adminCmBoardGetList(Model model) {
		model.addAttribute("cmBoardList",adminService.cmBoardList());
	}
      
	
	
	//삭제 요청 커뮤니티 게시물 조회
	@Override
	@GetMapping("/adminCmBoardRemoveList")
	public void adminCmBoardRemoveList(Model model) {
		model.addAttribute("cmBoardRemoveList",adminService.cmBoardRemoveList());
	}

	
	
	@Override
	@GetMapping("/adminBoardRead")
	public void boardRead(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		boardService.viewCount(bno);
		log.info("adminBoardRead");
		model.addAttribute("board",boardService.boardRead(bno));
	}



	//차트
	
	
	   @Override
	   @GetMapping(value="/mainChart",produces="application/json; charset=utf-8")
	   public ResponseEntity<List<ChartVO>> mainChart() {
	      List<ChartVO> list=new ArrayList<ChartVO>();
	      Date date = new Date();
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	      
	      Calendar cal=Calendar.getInstance();
	   
	      String day;
	      
	      day=sdf.format(cal.getTime());
	      log.info(day);
	      cal.setTime(date);
	         // 하루 전
	      cal.add(Calendar.DATE, -6);
	      day =sdf.format(cal.getTime()); 
	      log.info("6일 전 : " + day);
	      
	      for(int i=1;i<7;i++)
	      {
	         ChartVO ChartVO = new ChartVO();
	         cal.setTime(date);
	         // 하루 전
	         cal.add(Calendar.DATE, (-6+i));
	         day =sdf.format(cal.getTime()); 
	         log.info((-6+i)+"일 전 : " + day);
	         ChartVO =adminService.mainChart(day);
	         ChartVO.setDate(day);
	         list.add(ChartVO);
	         
	      }
	      
	      
	      
	      return new ResponseEntity<>(list,HttpStatus.OK);
	   }
	   
	   
	@Override
	@GetMapping("/chartYear")
	public void chartYear() {
	}
	

	   
	   
	   
	   
	   
   @Override
   @GetMapping(value= {"/allChartYear"},produces="application/json; charset=utf-8")
   public ResponseEntity<List<ChartVO>> allChartYear(String year) {
   // TODO Auto-generated method stub
      
      List<ChartVO> list=new ArrayList<ChartVO>();
      
      for(int i=0;i<12;i++)
      {
         ChartVO ChartVO = new ChartVO();
         if((i+1)<10)
         {
            ChartVO=adminService.adminCountView(year+"/0"+(i+1));
         }
         else {
            ChartVO=adminService.adminCountView(year+"/"+(i+1));
         }
         list.add(ChartVO);
      }
      
      log.info(list);
      return new ResponseEntity<>(list,HttpStatus.OK);
      
   }

	   
	   
	@Override
	@GetMapping("/chartMonth")
	public void chartMonth() {
	}
   
	   
	   
   @Override
   @GetMapping(value= {"/allChartMonth"},produces="application/json; charset=utf-8")
   public ResponseEntity<List<ChartVO>> allChartMonth(String yearMonth) {
   // TODO Auto-generated method stub
      log.info(yearMonth);
      List<ChartVO> list=new ArrayList<ChartVO>();
      
      for(int i=0;i<31;i++)
      {
         ChartVO ChartVO = new ChartVO();
         if((i+1)<10)
         {
            ChartVO=adminService.mainChart(yearMonth+"/0"+(i+1));
         }
         else {
            ChartVO=adminService.mainChart(yearMonth+"/"+(i+1));
         }
         list.add(ChartVO);
      }
      log.info(list.toString());
      return new ResponseEntity<>(list,HttpStatus.OK);
   }   
	

   
   ///삭제, 복구
	@Override
	@PostMapping(value="/memberDelete")
	public ResponseEntity<String> memberDelete(String memberId) {
		// TODO Auto-generated method stub
		log.info("memberDelete 컨트롤러 시작");
		log.info(memberId);
		int result=adminService.memberDelete(memberId);
		return result==1?
				new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}



	
	@Override
	@PostMapping(value="/memberRestore")
	public ResponseEntity<String> memberRestore(String memberId) {
		int result=adminService.memberRestore(memberId);
		return result==1?
				new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@Override
	@PostMapping(value="/boardDelete")
	public ResponseEntity<String> boardDelete(Long bno) {
		log.info("boardDelete 컨트롤러 시작");
		
		int result=adminService.boardDelete(bno);
		return result==1?
				new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}



	@Override
	@PostMapping(value="/boardRestore")
	public ResponseEntity<String> boardRestore(Long bno) {
		int result=adminService.boardRestore(bno);
		return result==1?
				new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@Override
	@PostMapping(value="/cmBoardDelete")
	public ResponseEntity<String> cmBoardDelete(Long bno) {
		log.info("boardDelete 컨트롤러 시작");
		
		int result=adminService.cmBoardDelete(bno);
		return result==1?
				new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@Override
	@PostMapping(value="/cmBoardRestore")
	public ResponseEntity<String> cmBoardRestore(Long bno) {
		int result=adminService.cmBoardRestore(bno);
		return result==1?
				new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	//=======================================================================================
	//공지게시판 관리---------------------------------------------------------------------------------------------
	

		@Override
		@GetMapping("/adminPostBoardGetList")
		public void postBoardGetList(Model model, Criteria cri) {
			log.info("postBoardGetList");
			model.addAttribute("pageMaker",new PageDTO(cri, postBoardService.postBoardGetTotalCount(cri)));
		}
		
		@Override
		@GetMapping(value="/restAdminPostBoardGetList", produces="application/json; charset=utf-8")
		@ResponseBody
		public ResponseEntity<List<BoardVO>> restPostBoardGetList(@ModelAttribute Criteria cri) {
			return new ResponseEntity<>(postBoardService.postBoardGetList(cri),HttpStatus.OK); 
		}

		@Override
		@GetMapping("/adminPostBoardInsert")
		public void postBoardInsert() {
			log.info("adminPostBoardInsert");
		}

		@Override
		@PostMapping("/adminPostBoardInsert")
		public String postBoardInsert(BoardVO boardVO, RedirectAttributes rttr) {
			log.info("adminPostBoardInsert");
			log.info("Insert: "+boardVO);
			postBoardService.postBoardInsert(boardVO);
			rttr.addFlashAttribute("result", boardVO.getBno());
			return "redirect:/admin/adminPostBoardGetList";
		}
		
	@Override
	@GetMapping("/adminPostBoardRead")
	public void postBoardRead(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("adminPostBoardRead");
		log.info(postBoardService.postBoardRead(bno));
		postBoardService.viewCount(bno);
		model.addAttribute("postBoard", postBoardService.postBoardRead(bno));
	}
		
	@Override
	@GetMapping("/adminPostBoardModify")
	public void postBoardModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("postBoard", postBoardService.postBoardRead(bno));
	}
		
	@Override
	@PostMapping("/adminPostBoardModify")
	public String postBoardModify(BoardVO boardVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("postBoardModify");
		log.info(postBoardService.postBoardModify(boardVO));
		if(postBoardService.postBoardModify(boardVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/adminPostBoardGetList"+cri.getListLink();
	}
		
	@Override
	@PostMapping("/adminPostBoardDelete")
	public String postBoardDelete(Long bno, Criteria cri, RedirectAttributes rttr) {
		log.info("postBoardDelete");
		if(postBoardService.postBoardDelete(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/adminPostBoardGetList"+cri.getListLink();
	}
		

	//첨부 파일
	@Override
	@GetMapping(value = "/adminGetAttachList", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		log.info("adminGetAttachList");
		List<BoardAttachVO> list=postBoardService.postGetAttachList(bno);
		log.info(list);
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@Override
	public void deleteAttachFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		attachList.forEach(attach-> {
			try {
				Path file = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbNail);
				}
				
			} catch(Exception e) {
				log.error("delete attachFile error" + e.getMessage());
			}
		}); //end forEac
	}
	
	







	
	
	
	
	
}
