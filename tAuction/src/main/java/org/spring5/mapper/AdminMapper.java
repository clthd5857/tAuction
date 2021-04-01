package org.spring5.mapper;

import java.util.List;

import org.spring5.domain.BoardVO;
import org.spring5.domain.Criteria;
import org.spring5.domain.MemberVO;

public interface AdminMapper {
	//전체 멤버 조회
	public List<MemberVO> memberList();
	//삭제 요청 멤버 조회
	public List<MemberVO> memberRemoveList();
	//메인 게시판 전체 조회
	public List<BoardVO> boardList();
	//메인 게시판 삭제 요청 조회
	public List<BoardVO> boardRemoveList();
	
	public List<BoardVO> cmBoardList();
	
	public List<BoardVO> cmBoardRemoveList();
	
	
	/////////////
	
	//방문자 수 조회
	//일
	  public String visitorCountView(String today);
	//월
	  public String visitorCountViewYear(String yearMonth);
	  
	//////////
	//총 게시물 개수
	public int boardRemoveTotalCount(Criteria cri);
	
	public int memberRemoveTotalCount(Criteria cri);

	public int cmBoardRemoveTotalCount(Criteria cri);
	

	
	
	//
	public String memberYearCount(String yearMonth);
	
	public String boardYearCount(String yearMonth);
	
	public String memberMonthCount(String yearMonthDay);
	
	public String boardMonthCount(String yearMonthDay);
	//월
	public String bidCount(String yearMonth);
	
	public String successbidCount(String yearMonth);
	
	public String successbidPrice(String yearMonth);
	
	//일
	public String dayBoardCount(String yearMonth);
	
	public String dayBidCount(String yearMonth);
	
	public String daySuccessbidCount(String yearMonth);
	
	public String daySuccessbidPrice(String yearMonth);
	
	
	//

	public int memberDelete(String memberId);
	
	public int memberRestore(String memberId);
	
	public int boardDelete(Long bno);
	
	public int boardRestore(Long bno);


	public int cmBoardDelete(Long bno);
	
	public int cmBoardRestore(Long bno);
		
	
	
	
	
}
