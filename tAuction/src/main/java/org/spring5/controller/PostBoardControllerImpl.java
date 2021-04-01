package org.spring5.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.PageDTO;
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
@RequestMapping("/postBoard")
public class PostBoardControllerImpl implements PostBoardController {
	
	@Autowired
	private PostBoardService postBoardService;
	
	
	@Override
	@GetMapping("/postBoardGetList")
	public void postBoardGetList(Model model, Criteria cri) {
		log.info("postBoardGetList");
		
		
		model.addAttribute("pageMaker",new PageDTO(cri, postBoardService.postBoardGetTotalCount(cri)));
		
	}
	
	@Override
	@GetMapping(value="/restPostBoardGetList", produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<BoardVO>> restPostBoardGetList(@ModelAttribute Criteria cri) {
		return new ResponseEntity<>(postBoardService.postBoardGetList(cri),HttpStatus.OK); 
	}
	
	@Override
	@GetMapping(value="/restPostBoardGetTotalPageCnt", produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> restPostBoardGetTotalPageCnt(@ModelAttribute Criteria cri) {
		int result = postBoardService.postBoardGetTotalCount(cri);
		log.info(result);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}

	@Override
	@GetMapping("/postBoardInsert")
	public void postBoardInsert() {
		log.info("postBoardInsert");
	}

	@Override
	@PostMapping("/postBoardInsert")
	public String postBoardInsert(BoardVO boardVO, RedirectAttributes rttr) {
		log.info("postBoardInsert");
		log.info(boardVO.toString());
		postBoardService.postBoardInsert(boardVO);
		rttr.addFlashAttribute("result", boardVO.getBno());
		
		return "redirect:/postBoard/postBoardGetList";
	}
	
	@Override
	@GetMapping("/postBoardRead")
	public void postBoardRead(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("postBoardRead");
		postBoardService.viewCount(bno);
		log.info(postBoardService.postBoardRead(bno));
		model.addAttribute("postBoard", postBoardService.postBoardRead(bno));
	}
	
	@Override
	@GetMapping("/postBoardModify")
	public void postBoardModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("postBoard", postBoardService.postBoardRead(bno));
	}
	
	@Override
	@PostMapping("/postBoardModify")
	public String postBoardModify(BoardVO boardVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("postBoardModify");
		log.info(boardVO.toString());
		if(postBoardService.postBoardModify(boardVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/postBoard/postBoardGetList"+cri.getListLink();
	}
	
	@Override
	@PostMapping("/postBoardDelete")
	public String postBoardDelete(Long bno, Criteria cri, RedirectAttributes rttr) {
		log.info("postBoardDelete");
		if(postBoardService.postBoardDelete(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/postBoard/postBoardGetList"+cri.getListLink();
	}
	
	//÷�� ����
	
		@Override
		@GetMapping(value = "/postGetAttachList", produces = "application/json; charset=utf-8")
		@ResponseBody
		public ResponseEntity<List<BoardAttachVO>> postGetAttachList(Long bno) {
			log.info("postGetAttachList");
			List<BoardAttachVO> list = postBoardService.postGetAttachList(bno);
			log.info(list);
			return new ResponseEntity<>(list, HttpStatus.OK);
		}

		@Override
		public void postDeleteAttachFiles(List<BoardAttachVO> attachList) {
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
