package org.spring5.controller;

import java.util.List;

import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.MyBiddingVO;
import org.spring5.domain.PageDTO;
import org.spring5.service.MemBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemBoradControllerImpl implements MemBoardController {

	@Autowired
	private MemBoardService memBoardService;
	
	//찜목록 불러오기 ===========================================================================================
	@Override
	@GetMapping("/myLikeList")
	public void myLikeList(Model model, Criteria cri, String memberId) {
		//System.out.println("안뇽" +  memBoardService.likeListTotalCount(cri, memberId));
		model.addAttribute("pageMaker",new PageDTO(cri, memBoardService.likeListTotalCount(cri, memberId)));
	}

	@Override
	@GetMapping(value="/restMyLikeList",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<BoardVO>> restMyLikeList(@ModelAttribute("cri") Criteria cri,
														@RequestParam ("memberId") String memberId) {
		return new ResponseEntity<>(memBoardService.myLikeList(cri, memberId),HttpStatus.OK);
	}

	@Override
	@GetMapping(value="/likeListTotalCount",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> likeListTotalCount(@ModelAttribute("cri") Criteria cri,
													  @RequestParam("memberId") String memberId) {
		return new ResponseEntity<>(memBoardService.likeListTotalCount(cri, memberId),HttpStatus.OK);
	}
	
	
	//내 입찰-낙찰 목록 불러오기 =======================================================================================
	@Override
	@GetMapping("/myBiddingList")
	public void myBiddingList(Model model, Criteria cri, String memberId) {
		model.addAttribute("pageMaker",new PageDTO(cri, memBoardService.BiddingListTotalCount(cri, memberId)));
	}

	@Override
	@GetMapping(value="/restMyBiddingList",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<MyBiddingVO>> restMyBiddingList(@ModelAttribute("cri") Criteria cri,
															  @RequestParam ("memberId") String memberId,
															  @RequestParam("flag") String flag) {
		ResponseEntity<List<MyBiddingVO>> result;
		
		if(flag.equals("F")) {
			result = new ResponseEntity<>(memBoardService.myBiddingList(cri, memberId),HttpStatus.OK);
		} else {
			result = new ResponseEntity<>(memBoardService.myWinningList(cri, memberId),HttpStatus.OK);
		}
		
		return result;
	}

	//내 입찰목록 카운트
	@Override
	@GetMapping(value="/BidingListTotalCount",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> BiddingListTotalCount(@ModelAttribute("cri") Criteria cri,
													    @RequestParam("memberId") String memberId,
													    @RequestParam("flag") String flag) {
		ResponseEntity<Integer> result;
		if(flag.equals("F")) {
			result = new ResponseEntity<>(memBoardService.BiddingListTotalCount(cri, memberId),HttpStatus.OK);
		} else {
			result = new ResponseEntity<>(memBoardService.winningListTotalCount(cri, memberId),HttpStatus.OK);
		}
		return result;
	}

	
	
	//내가 쓴 글 불러오기 =======================================================================================
	@Override
	@GetMapping("/myBoardList")
	public void myBoardList(Model model, Criteria cri, String memberId) {
		model.addAttribute("pageMaker",new PageDTO(cri, memBoardService.myBoardListTotalCount(cri, memberId)));
	}
	
	@Override
	@GetMapping(value="/restMyBoardList",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<BoardVO>> restMyBoardList(Criteria cri, String memberId) {
		return new ResponseEntity<>(memBoardService.myBoardList(cri, memberId),HttpStatus.OK);
	}
	@Override
	@GetMapping(value="/myBoardListTotalCount",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Integer> myBoardListTotalCount(Criteria cri, String memberId) {
		return new ResponseEntity<>(memBoardService.myBoardListTotalCount(cri, memberId),HttpStatus.OK);
	}
	
	
	
}
