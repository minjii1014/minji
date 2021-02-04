package www.dream.com.board.model.mapper;

import java.util.List;

import www.dream.com.board.model.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> listReply(long originalId);

	public ReplyVO findReplyById(long id);

	public long registerReply(ReplyVO reply);

	public boolean updateReply(ReplyVO reply);
	
	public boolean removeReply(long id);

	
}