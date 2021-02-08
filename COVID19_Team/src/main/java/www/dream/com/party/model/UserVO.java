package www.dream.com.party.model;

import lombok.Data;

@Data
public class UserVO extends PartyVO {
	private long userId;
	private String email;
	private String loginId;
	private String password;

	public UserVO(long userId) {
		super();
		this.userId = userId;
	}
	
}
