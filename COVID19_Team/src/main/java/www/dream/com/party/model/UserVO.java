package www.dream.com.party.model;

import lombok.Data;

@Data
public class UserVO extends PartyVO {
//	private long userNum;
	private String email;
	private String loginId;
	private String password;

	public UserVO() {
	}
	
}
