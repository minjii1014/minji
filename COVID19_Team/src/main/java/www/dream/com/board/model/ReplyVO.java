package www.dream.com.board.model;

import java.util.Date;

import lombok.Data;
import www.dream.com.party.model.PartyVO;
import www.dream.com.userSecurity.model.UserVO;

@Data
public class ReplyVO {
	private long id;
	private String content;
	private PartyVO userId;
	private long originalId;
	private String objType;
	private Date regDate;
	private Date updateDate;
	private long viewCount;
}

