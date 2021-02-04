package www.dream.com.board.model;

import lombok.Data;

@Data
public class PostVO extends ReplyVO{
	private String title;
	private long viewCount;
	private long boardId;
	
	public PostVO() {
	}
}
