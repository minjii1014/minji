package www.dream.com.board.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.dream.com.board.model.PostVO;

public interface PostMapper {
	public List<PostVO> listPost(@Param("boardId") long boardId);

	public void registerPost(PostVO post);

	public PostVO findPostById(long id);

	public boolean updatePost(PostVO post);

	public boolean removePost(PostVO post);
}
