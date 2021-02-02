package www.dream.com.board.model.mapper;

import www.dream.com.board.model.ReplyVO;

public interface ReplyMapper {

	public ReplyVO findReplyById(long replyId);

	public long registerReply(ReplyVO reply);
	
}