package www.dream.com.board.model.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import www.dream.com.party.model.PostVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class BoardMapperTest {
	@Autowired
	private PostMapper postMapper;
	
	@Test
	public void testAll() {
		try { 
			for (BoardVO board : postMapper.listPost(2L, new Criteria()))
				System.out.println(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
