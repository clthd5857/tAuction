package org.spring5.controller;

import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.BoardVO;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface PostBoardController {

	//게시물 조회
	public void postBoardGetList(Model model, Criteria cri);
	public ResponseEntity<List<BoardVO>> restPostBoardGetList(@ModelAttribute Criteria cri);
	public ResponseEntity<Integer> restPostBoardGetTotalPageCnt(@ModelAttribute Criteria cri);
	
	//등록
	public void postBoardInsert();
	public String postBoardInsert(BoardVO boardVO, RedirectAttributes rttr);
	
	//읽기 
	public void postBoardRead(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model);
	
	//수정
	public void postBoardModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,  Model model);
	public String postBoardModify(BoardVO boardVO, Criteria cri,  RedirectAttributes rttr);
	
	//삭제
	public String postBoardDelete(Long bno, Criteria cri, RedirectAttributes rttr);
	
	//첨부 파일
	public ResponseEntity<List<BoardAttachVO>> postGetAttachList(Long bno);
	
	public void postDeleteAttachFiles(List<BoardAttachVO> attachList);
	
}
