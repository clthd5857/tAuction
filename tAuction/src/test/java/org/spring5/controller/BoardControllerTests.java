package org.spring5.controller;

import java.sql.Timestamp;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

// Test for Controller
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
// Java Config
// @ContextConfiguration(classes = {
// org.zerock.config.RootConfig.class,
// org.zerock.config.ServletConfig.class} )
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	//mockMvc의 setup은 이름을 바꿔주지 않는 편이 좋다.
	//이 앞에 @Before가 있어야한다. @Before는 @Test가 붙어있는 메소드 전에 반드시 실행이된다.
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	//목록보기 페이징 X
//	@Test
//	public void testList() throws Exception {
//
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/boardGetList")).andReturn().getModelAndView().getModelMap());
//	}

	@Test
	public void testRegister() throws Exception {

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/board/boardInsert")
				.param("title", "테스트 새글 제목")
				.param("category", "A")
				.param("contents", "테스트 새글 내용")
				.param("memberId", "user01")
				.param("dueDate", timestamp.toString())
				)
				.andReturn()
				.getModelAndView()
				.getViewName();

		log.info(resultPage);

	}
//
//	@Test
//	public void tetGet() throws Exception {
//
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get").param("bno", "4")).andReturn()
//				.getModelAndView().getModelMap());
//	}
//
//	@Test
//	public void testModify() throws Exception {
//
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/board/modify").param("bno", "1").param("title", "수정된 테스트 새글 제목")
//						.param("content", "수정된 테스트 새글 내용").param("writer", "user00"))
//				.andReturn().getModelAndView().getViewName();
//
//		log.info(resultPage);
//
//	}
//
//	@Test
//	public void testRemove() throws Exception {
//		// 삭제전 데이터베이스에 게시물 번호 확인할 것
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove").param("bno", "13")).andReturn()
//				.getModelAndView().getViewName();
//
//		log.info(resultPage);
//	}
//
	//List Paging O
//	@Test
//	public void testListPaging() throws Exception {
//
//		log.info(mockMvc.perform(
//				MockMvcRequestBuilders.get("/board/list")
//				.param("pageNum", "2")
//				.param("amount", "10"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
	
	

}


