package www.dream.com.userSecurity.model;

import lombok.Data;

@Data
public class UserVO {
	private long partyId;
	private long userNum;
	private String userId;
	private String password;
	private String email;
	private String authority;
	private boolean enabled;

}