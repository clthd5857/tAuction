package org.spring5.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.List;

import org.spring5.domain.AuctionDetailVO;
import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.PageDTO;
import org.spring5.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardControllerImpl implements BoardController{

	@Autowired
	private BoardService boardService;
	
	@Override
	@GetMapping("/boardGetList")
	public void boardGetList(Model model, Criteria cri) {
		log.info("boardGetList");
		model.addAttribute("pageMaker",new PageDTO(cri, boardService.boardGetTotalCount(cri)));
	}

	@Override
	@GetMapping(value="/restBoardGetList",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<BoardVO>> restBoardGetList(@ModelAttribute Criteria cri) {
		return new ResponseEntity<>(boardService.boardGetList(cri),HttpStatus.OK);
	}
	

	@Override
	@GetMapping(value="/restBoardGetTotalPageCnt",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> restBoardGetTotalPageCnt(@ModelAttribute Criteria cri) {
		int result = boardService.boardGetTotalCount(cri);
		log.info(result);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}

	@Override
	@GetMapping("/boardInsert")
	@PreAuthorize("isAuthenticated()")
	public void boardInsert() {
		log.info("boardInsert");
	}

	////
	@Override
	@PostMapping("/boardInsert")
	@PreAuthorize("isAuthenticated()")
	public String boardInsert(@ModelAttribute BoardVO boardVO,
							  @RequestParam("strDueDate") String strDueDate,
							  RedirectAttributes rttr) {
		boardVO.setDueDate(Timestamp.valueOf((strDueDate+":00").replace("T", " ")));
		log.info("INSERT : "+boardVO);
		boardService.boardInsert(boardVO);
		rttr.addFlashAttribute("result",boardVO.getBno());
		return "redirect:/board/boardGetList";
	}
	
	@Override
	@GetMapping("/boardRead")
	public void boardRead(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		boardService.viewCount(bno);
		model.addAttribute("board",boardService.boardRead(bno));
	}

	@Override
	@GetMapping("/boardModify")
	@PreAuthorize("isAuthenticated()")
	public void boardModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board",boardService.boardRead(bno));
	}
	
	@Override
	@PostMapping("/boardModify")
	@PreAuthorize("principal.username==#boardVO.memberId")
	public String boardModify(@ModelAttribute BoardVO boardVO,
							  @ModelAttribute("cri") Criteria cri,
							  @RequestParam("strDueDate") String strDueDate,
							  RedirectAttributes rttr) {
		boardVO.setDueDate(Timestamp.valueOf((strDueDate+":00").replace("T", " ")));
		log.info("boardModify : "+boardVO);
		if(boardService.boardModify(boardVO)) {
			rttr.addFlashAttribute("result", "modify");
		}
		return "redirect:/board/boardGetList"+cri.getListLink();
	}

	@Override
	@PostMapping("/boardRemove")
	@PreAuthorize("principal.username==#memberId")
	public String boardRemove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr, String memberId) {
		if(boardService.boardRemove(bno)) {
			rttr.addFlashAttribute("result","remove");
		}
		
		return "redirect:/board/boardGetList"+cri.getListLink();
	}

	@Override
	@PostMapping("/boardDelete")
	public String boardDelete(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		List<BoardAttachVO> attachList = boardService.getAttachList(bno);
		
		if(boardService.boardDelete(bno)) {
			deleteAttachFiles(attachList);
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/board/boardGetList"+cri.getListLink();
	}
	
	
	//첨부 파일
	
	@Override
	@GetMapping(value = "/getAttachList", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		return new ResponseEntity<>(boardService.getAttachList(bno), HttpStatus.OK);
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
		}); //end forEach		
	}
	
	
	//********************************경매(bidding)*************************************
	
	@PreAuthorize("isAuthenticated()")
	@Override
	@PostMapping("/bidding")
	public String bidding(@ModelAttribute AuctionDetailVO auctionDetailVO,
						  @ModelAttribute Criteria cri,
						  RedirectAttributes rttr){
		if(boardService.biddingInsertAndUpdate(auctionDetailVO).equals(0L)) {
			return "redirect:/board/boardRead?bno="+auctionDetailVO.getBno().toString()+"&"+cri.getListLink();
		} else {
			rttr.addFlashAttribute("result","biddingEnd");
			return "redirect:/board/boardGetList";
		}
		
	}

	@PreAuthorize("principal.username==#auctionDetailVO.memberId")
	@Override
	@PostMapping("/biddingDelete")
	public String biddingDelete(@ModelAttribute AuctionDetailVO auctionDetailVO,
								@ModelAttribute Criteria cri) {
		boardService.biddingDelete(auctionDetailVO);
		return "redirect:/board/boardRead?bno="+auctionDetailVO.getBno().toString()+"&"+cri.getListLink();
	}
	
	
	
	@Override
	@GetMapping(value = "/biddingRead")
	@ResponseBody
	public ResponseEntity<AuctionDetailVO> biddingRead(@ModelAttribute AuctionDetailVO auctionDetailVO){
		log.info("biddingRead : "+boardService.biddingRead(auctionDetailVO));
		return new ResponseEntity<>(boardService.biddingRead(auctionDetailVO), HttpStatus.OK);
	}
	
	
	
	//********************************찜(likeTo)*************************************
	
	//찜 체크여부
	@Override
	@GetMapping(value = "/likeToCheck",
				 produces = "text/plain; charset = UTF-8")
	@ResponseBody
	public String likeToCheck(@ModelAttribute BoardVO boardVO) {
		return boardService.likeToCheck(boardVO);
	}

	//찜 체크(등록)
	@Override
	@GetMapping(value = "/clickLikeBtn",
			 	produces = "text/plain; charset = UTF-8")
	@ResponseBody
	public String clickLikeBtn(@ModelAttribute BoardVO boardVO) {
		String result = boardService.likeToCheck(boardVO);
		
		if(result == null) {
			boardService.like_check(boardVO);
			result = "T";
		} else {
			boardService.like_check_cancel(boardVO);
			result = "F";
		}
		
		return result;
	}

	//찜 (bno별 카운트)
	@Override
	@GetMapping(value = "/likeCountByBno/{bno}",
 				produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Long> likeCountByBno(@PathVariable("bno") Long bno) {
		return new ResponseEntity<>(boardService.likeCountByBno(bno), HttpStatus.OK);
	}
	
	
}
