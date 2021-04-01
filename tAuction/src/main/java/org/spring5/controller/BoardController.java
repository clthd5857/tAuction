package org.spring5.controller;

import java.util.List;

import org.spring5.domain.AuctionDetailVO;
import org.spring5.domain.BoardAttachVO;
import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface BoardController {
	
		//게시물 조회
		public void boardGetList(Model model, Criteria cri);
		public ResponseEntity<List<BoardVO>> restBoardGetList(@ModelAttribute Criteria cri);
		public ResponseEntity<Integer> restBoardGetTotalPageCnt(@ModelAttribute Criteria cri);
		
		
		
		//등록
		public void boardInsert();
		public String boardInsert(BoardVO boardVO,
								  String strDueDate,
								  RedirectAttributes rttr);
		
		//조회
			//read와 modify 페이지 불러오기
		public void boardRead(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model);
		
		//수정
		public void boardModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model);
		
		public String boardModify(BoardVO boardVO,
								  Criteria cri,
								  String strDueDate,
								  RedirectAttributes rttr);
		
		//삭제(Remove)
		public String boardRemove(Long bno, Criteria cri, RedirectAttributes rttr, String memberId);
		
		//삭제(Delete)
		public String boardDelete(Long bno, Criteria cri, RedirectAttributes rttr);
		
		//첨부 파일
		public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno);
		
		public void deleteAttachFiles(List<BoardAttachVO> attachList);
		
		//********************************경매(bidding)*************************************
		//입찰
		public String bidding(@ModelAttribute AuctionDetailVO auctionDetailVO,
				  			  @ModelAttribute Criteria cri,
				  			  RedirectAttributes rttr);
		
		//입찰 취소
		public String biddingDelete(@ModelAttribute AuctionDetailVO auctionDetailVO,
				@ModelAttribute Criteria cri);
		
		//입찰 내역 읽기
		public ResponseEntity<AuctionDetailVO> biddingRead(@ModelAttribute AuctionDetailVO auctionDetailVO);
		
		
		
		//********************************찜(likeTo)*************************************
		
		//찜 체크여부
		public String likeToCheck(@ModelAttribute BoardVO boardVO);
			
		//찜 체크 (등록/해제)
		public String clickLikeBtn(@ModelAttribute BoardVO boardVO);

		//찜 (bno별 카운트)
		public ResponseEntity<Long> likeCountByBno(Long bno);
		
		
		
		
		
}
