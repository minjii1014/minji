package www.dream.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import www.dream.com.board.model.Criteria;
import www.dream.com.board.model.ReplyVO;
import www.dream.com.board.model.mapper.ReplyMapper;

@Service
public class ReplyService {
	@Autowired
	private ReplyMapper replyMapper;

	public List<ReplyVO> listReply(long originalId, Criteria criteria) {
		return replyMapper.listReply(originalId, criteria);
	}
	
	public ReplyVO findReplyById(long id) {
		
		return replyMapper.findReplyById(id);
	}
	
	@Transactional
	public long registerReply(ReplyVO reply) {
		return replyMapper.registerReply(reply);
	}

	@Transactional
	public boolean removeReply(long id) {
		return replyMapper.removeReply(id);
	}

	@Transactional
	public boolean updateReply(ReplyVO reply) {
		return replyMapper.updateReply(reply);
	}

	public long countTotalReply(long originalId) {
		return replyMapper.countTotalReply(originalId);
	}
	
	
}