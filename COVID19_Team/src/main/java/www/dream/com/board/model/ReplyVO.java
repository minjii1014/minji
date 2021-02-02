package www.dream.com.board.model;

import java.util.Date;

import lombok.Data;
import www.dream.com.party.model.PartyVO;

@Data
public class ReplyVO {
	private long replyId;
	private String replyContent;
	private PartyVO userId;
	private long originalId;
	private Date regDate;
	private Date updateDate;
}
