package www.dream.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import www.dream.com.board.model.Criteria;
import www.dream.com.board.model.PostVO;
import www.dream.com.board.model.mapper.PostMapper;

@Service
public class PostService {
	@Autowired
	private PostMapper postMapper;
	
	public long listPost(long boardId) {
		return postMapper.listPost(boardId);
	}
	
	public List<PostVO> findPostWithPaging(long boardId, Criteria criteria) {
		return postMapper.findPostWithPaging(boardId, criteria);
	}
	
	@Transactional
	public void registerPost(PostVO post) {
		postMapper.registerPost(post);
	}

	public PostVO findPostById(long id) {
		return postMapper.findPostById(id);
	}

	@Transactional
	public boolean updatePost(PostVO post) {
		return postMapper.updatePost(post);
	}
	
	@Transactional
	public boolean removePost(PostVO post) {
		return postMapper.removePost(post);
	}
}