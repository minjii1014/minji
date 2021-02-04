package www.dream.com.board.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.dream.com.board.model.Criteria;
import www.dream.com.board.model.PostVO;

public interface PostMapper {
	public List<PostVO> findPostWithPaging(@Param("boardId")long boardId, @Param("criteria")Criteria criteria);

	public void registerPost(PostVO post);

	public PostVO findPostById(long postId);

	public boolean updatePost(PostVO post);

	public boolean removePost(PostVO post);

}
