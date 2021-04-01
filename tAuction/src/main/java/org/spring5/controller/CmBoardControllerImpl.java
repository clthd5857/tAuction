package org.spring5.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.PageDTO;
import org.spring5.service.CmBoardService;
import org.spring5.service.PostBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
@RequestMapping("/cmBoard/*")
public class CmBoardControllerImpl implements CmBoardController{
	
	@Autowired
	private CmBoardService cmBoardService;
	
	@Autowired
	private PostBoardService postBoardService;
	
	@Override
	@GetMapping("/cmBoardGetList")
	public void cmBoardGetList(Model model, Criteria cri) {
		log.info("cmBoardGetList");
		model.addAttribute("pageMaker", new PageDTO(cri, cmBoardService.cmBoardGetTotalCount(cri)));
		Criteria cri1=new Criteria();
		model.addAttribute("postBoard", postBoardService.postBoardGetList(cri1));
	}
	
	@Override
	@GetMapping(value="/restCmBoardGetList",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<BoardVO>> restCmBoardGetList(@ModelAttribute Criteria cri) {
		return new ResponseEntity<>(cmBoardService.cmBoardGetList(cri), HttpStatus.OK);
	}
	
	@Override
	@GetMapping(value="restCmBoardGetTotalPageCnt", 
				produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> restCmBoardGetTotalPageCnt(@ModelAttribute Criteria cri) {
		int result = cmBoardService.cmBoardGetTotalCount(cri);
		log.info(result);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@Override
	@GetMapping("/cmBoardInsert")
	public void cmBoardInsert() {
		log.info("cmBoardInsert");
	}
	
	@Override
	@PostMapping("/cmBoardInsert")
	@PreAuthorize("isAuthenticated()")
	public String cmBoardInsert(@ModelAttribute BoardVO boardVO, RedirectAttributes rttr) {
		log.info("INSERT : "+boardVO);
		cmBoardService.cmBoardInsert(boardVO);
		rttr.addFlashAttribute("result", boardVO.getBno());
		return "redirect:/cmBoard/cmBoardGetList";
	}
	
	
	@Override
	@GetMapping({"/cmBoardRead"})
	public void cmBoardRead(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		cmBoardService.viewCount(bno);
		model.addAttribute("cmBoard", cmBoardService.cmBoardRead(bno));
	}
	
	@Override
	@GetMapping({"/cmBoardModify"})
	@PreAuthorize("isAuthenticated()")
	public void cmBoardModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("cmBoard", cmBoardService.cmBoardRead(bno));
	}
	
	
	
	@Override
	@PostMapping("/cmBoardModify")
	public String cmBoardModify(BoardVO boardVO, Criteria cri, RedirectAttributes rttr) {
		if(cmBoardService.cmBoardModify(boardVO)) {
			rttr.addFlashAttribute("result", "modify");
		}
		return "redirect:/cmBoard/cmBoardGetList"+cri.getListLink();
	}
	
	@Override
	@PostMapping("/cmBoardRemove")
	public String cmBoardRemove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		if(cmBoardService.cmBoardRemove(bno)) {
			rttr.addFlashAttribute("result","remove");
		}
		
		return "redirect:/cmBoard/cmBoardGetList"+cri.getListLink();
	}

	@Override
	@PostMapping("/cmBoardDelete")
	public String cmBoardDelete(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		List<BoardAttachVO> attachList = cmBoardService.getAttachList(bno);
		
		if(cmBoardService.cmBoardDelete(bno)) {
			deleteAttachFiles(attachList);
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/cmBoard/cmBoardGetList"+cri.getListLink();
	}
	
	//첨부 파일
	
	@Override
	@GetMapping(value = "/getAttachList", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		return new ResponseEntity<>(cmBoardService.getAttachList(bno), HttpStatus.OK);
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
	
	

}
