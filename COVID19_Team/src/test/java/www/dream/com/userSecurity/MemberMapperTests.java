//package www.dream.com.userSecurity;
//
//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import lombok.extern.log4j.Log4j;
//import www.dream.com.user.model.UserVO;
//import www.dream.com.user.model.mapper.UserMapper;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
//@Log4j
//public class MemberMapperTests {
//	
//	@Autowired
//	private UserMapper mapper;
//	
//	@Test
//	public void testRead() {
//		UserVO vo = mapper.read("관리자80");
//		
//		log.info(vo);
//		
//		vo.getAuthList().forEach(authVO -> log.info(authVO));
//	}
//	
//}
