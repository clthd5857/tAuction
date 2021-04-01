package org.spring5.controller;

import java.util.List;

import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.MyBiddingVO;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

public interface MemBoardController {
	
	//내 찜 리스트
	public void myLikeList(Model model, Criteria cri, String memberId);
	public ResponseEntity<List<BoardVO>> restMyLikeList(Criteria cri, String memberId);
	public ResponseEntity<Integer> likeListTotalCount(Criteria cri, String memberId);
	
	//내 입찰-낙찰 리스트
	public void myBiddingList(Model model, Criteria cri, String memberId);
	public ResponseEntity<List<MyBiddingVO>> restMyBiddingList(Criteria cri, String memberId, String flag);
	public ResponseEntity<Integer> BiddingListTotalCount(Criteria cri, String memberId, String flag);
	
	//내가쓴 글 리스트
	public void myBoardList(Model model, Criteria cri, String memberId);
	public ResponseEntity<List<BoardVO>> restMyBoardList(Criteria cri, String memberId);
	public ResponseEntity<Integer> myBoardListTotalCount(Criteria cri, String memberId);
}
