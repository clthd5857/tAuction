package org.spring5.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
//테스트 시, DispatcherServlet의 XML 설정 구성파일(들)(servlet-context.xml)을 사용하기 위한 어노테이션
//ContextCOnfiguration에 포함되어 있으면 반드시 위의 어노테이션을 입력해줘야한다.
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class, org.zerock.config.ServletConfig.class} )
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private BoardService boardService;

	@Test
	public void testExist() {

		log.info(boardService);
		//null이 아니면 console에 표시해주는 기능을 한다.
		assertNotNull(boardService);
	}
//
//   @Test
//   public void testRegister() {
//
//      BoardVO boardVO = new BoardVO();
//      boardVO.setCategory("A");
//      boardVO.setTitle("새로 작성하는 글");
//      boardVO.setContents("새로 작성하는 내용");
//      boardVO.setImageFileName("img20.jsp");
//      Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//      boardVO.setDueDate(timestamp);
//      boardVO.setMemberId("user01");
//
//      boardService.boardInsert(boardVO);
//
//      log.info("생성된 게시물의 번호: " + boardVO.getBno());
//   }
//
//	@Test
//	public void testGetList() {
//
//		//boardService.getList().forEach(board -> log.info(board));
//		boardService.boardGetList(new Criteria(1, 10)).forEach(boardVO -> log.info(boardVO));
//	}

//	@Test
//	public void testGet() {
//
//		log.info(boardService.boardRead(1L));
//	}

//	@Test
//	public void testRemove() {
//
//		// 게시물 번호의 존재 여부를 확인하고 테스트할 것
//		log.info("REMOVE RESULT: " + boardService.boardRemove(2L));
//
//	}
	
	
//	@Test
//	public void testDelete() {
//
//		// 게시물 번호의 존재 여부를 확인하고 테스트할 것
//		log.info("DELETE RESULT: " + boardService.boardDelete(2L));
//
//	}
//
//	@Test
//	public void testUpdate() {
//
//		BoardVO board = boardService.boardRead(1L);
//
//		if (board == null) {
//			return;
//		}
//
//		board.setTitle("제목 수정합니다.");
//		log.info("MODIFY RESULT: " + boardService.boardModify(board));
//	}
	
	
//	@Test
//	public void testDueDateCheck() {
//		
//		boardService.biddingTest();
//		
//	}
	
	

}
