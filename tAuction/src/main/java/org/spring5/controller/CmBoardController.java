package org.spring5.controller;

import java.util.List;

import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface CmBoardController {
	
	//후기 게시글 보기
	public void cmBoardGetList(Model model, Criteria cri);
	public ResponseEntity<List<BoardVO>> restCmBoardGetList(@ModelAttribute Criteria cri);
	
	public ResponseEntity<Integer> restCmBoardGetTotalPageCnt(@ModelAttribute Criteria cri);
	
	//후기 게시글 등록
	public void cmBoardInsert();
	public String cmBoardInsert(@ModelAttribute BoardVO boardVO, RedirectAttributes rttr);
	
	
	public void cmBoardRead(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model);
	
	public void cmBoardModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model);
	
	//후기 게시글 수정
	public String cmBoardModify(BoardVO boardVO, Criteria cri, RedirectAttributes rttr);
	
	//삭제(Remove)
	public String cmBoardRemove(Long bno, Criteria cri, RedirectAttributes rttr);
	
	//후기 게시글 삭제(Delete)
	public String cmBoardDelete(Long bno, Criteria cri, RedirectAttributes rttr);
	
	//첨부파일
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno);

	public void deleteAttachFiles(List<BoardAttachVO> attachList);
}
