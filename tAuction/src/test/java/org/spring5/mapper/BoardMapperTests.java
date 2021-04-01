package org.spring5.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;

//테스트 끝난건 주석처리한다.	

	@Test
	public void testBoardGetList() {
		//람다식
		log.info("~~");
		//boardMapper.boardGetList().forEach(boardVO -> log.info(boardVO));

	}

	//boardInsert
//	@Test
//	public void testBoardInsert() {
//
//		BoardVO boardVO = new BoardVO();
//		boardVO.setCategory("A");
//		boardVO.setTitle("새로 작성하는 글 select key");
//		boardVO.setContents("새로 작성하는 내용 select key");
//		boardVO.setImageFileName("img10.jpg");
//		
//		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//		boardVO.setDueDate(timestamp);
//		boardVO.setMemberId("user01");
//		
//		boardMapper.boardInsert(boardVO);
//
//		log.info(boardVO);
//	}
	//게시글 조회테스트
//	@Test
//	public void testBoardRead() {
//
//		// 존재하는 게시물 번호로 테스트
//		BoardVO boardVO = boardMapper.boardRead(5L);
//
//		log.info(boardVO);
//
//	}
//
//	@Test
//	public void testBoardRemove() {
//
//		log.info("Remove COUNT: " + boardMapper.boardRemove(4L));
//	}
	
	
//	@Test
//	public void testBoardDelete() {
//
//		log.info("DELETE COUNT: " + boardMapper.boardDelete(3L));
//	}
//
//	@Test
//	public void testUpdate() {
//
//		BoardVO boardVO = new BoardVO();
//		// 실행전 존재하는 번호인지 확인할 것
//		boardVO.setBno(5L);
//		boardVO.setCategory("B");
//		boardVO.setTitle("수정된 제목");
//		boardVO.setImageFileName("img5.jpg");
//		boardVO.setContents("수정된 내용");
//		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//		boardVO.setDueDate(timestamp);
//		
//		int count = boardMapper.boardModify(boardVO);
//		log.info("UPDATE COUNT: " + count);
//	}
//
//	@Test
//	public void testPaging() {
//
//		Criteria cri = new Criteria();
//		// pageNum : 2, amount : 10
//		
//		
//	    //10개씩 3페이지 
//	    cri.setPageNum(1);
//	    cri.setAmount(10);
//	    //cri.setCategory("B");
//
//		List<BoardVO> list = boardMapper.boardGetListWithPaging(cri);
//
//		list.forEach(boardVO -> log.info(boardVO));
//
//	}
//
	
//	  @Test
//	  public void testSearch() {
//
//	    Criteria cri = new Criteria();
//	    //T : Title, C : Contents, W : memberId 
//	    cri.setSearchKeyword("용");
//	    cri.setSearchType("TC");
//	    cri.setCategory("B");
//	    //cri.setType("TCW");
//	    
//	    List<BoardVO> list = boardMapper.boardGetListWithPagingAndSearching(cri);
//
//	    list.forEach(boardVO -> log.info(boardVO));
//	  }
	
//	  @Test
//	  public void testTotalCount() {
//		  Criteria cri = new Criteria();
//		  cri.setSearchKeyword("용");
//		  cri.setSearchType("TC");
//		  
//		  int count = boardMapper.boardGetTotalCount(cri);
//		  log.info("UPDATE COUNT: " + count);
//	  }

}
