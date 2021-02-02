package www.dream.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dream.com.board.model.PostVO;
import www.dream.com.board.model.mapper.PostMapper;

@Service
public class PostService {
	@Autowired
	private PostMapper postMapper;
	
	public List<PostVO> listPost(long boardId) {
		return postMapper.listPost(boardId);
	}

	public void registerPost(PostVO post) {
		postMapper.registerPost(post);
	}

	public PostVO findPostById(long postId) {
		return postMapper.findPostById(postId);
	}

	public boolean updatePost(PostVO post) {
		return postMapper.updatePost(post);
	}

	public boolean removePost(PostVO post) {
		return postMapper.removePost(post);
	}
}