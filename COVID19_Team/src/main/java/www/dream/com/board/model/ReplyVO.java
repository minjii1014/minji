package www.dream.com.board.model;

import java.util.Date;

import lombok.Data;
import www.dream.com.party.model.PartyVO;

@Data
public class ReplyVO {
	private long id;
	private String content;
	private String userId;
	private long originalId;
	private String objType;
	private Date regDate;
	private Date updateDate;
	private long viewCount;
	
	/*----------연관 정보 정의 영역-----------*/
	private int countOfReply;
}