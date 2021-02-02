package www.dream.com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dream.com.board.model.ReplyVO;
import www.dream.com.board.model.mapper.ReplyMapper;

@Service
public class ReplyService {
	@Autowired
	private ReplyMapper replyMapper;

	public ReplyVO findReplyById(long replyId) {
		return replyMapper.findReplyById(replyId);
	}

	public long registerReply(ReplyVO reply) {
		return replyMapper.registerReply(reply);
	}
	
	
}
