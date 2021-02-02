package www.dream.com.board.model;

import java.util.Date;

import lombok.Data;
import www.dream.com.party.model.PartyVO;

@Data
public class PostVO {
	private long postId;
	private String postTitle;
	private String postContent;
	private PartyVO userId;
	private long viewCount;
	private long boardId;
	private Date regDate;
	private Date updateDate;
	
	public PostVO() {
	}
	
//	public PostVO(Long postId) {
//		super();
//		this.postId = postId;
//	}
	
	
}
