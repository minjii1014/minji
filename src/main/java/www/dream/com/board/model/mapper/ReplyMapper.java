package www.dream.com.board.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.dream.com.board.model.Criteria;
import www.dream.com.board.model.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> listReply(@Param("originalId") long originalId, @Param("criteria") Criteria criteria);

	public ReplyVO findReplyById(long id);

	public long registerReply(ReplyVO reply);

	public boolean updateReply(ReplyVO reply);
	
	public boolean removeReply(long id);

	public long countTotalReply(@Param("originalId") long originalId);

	
}