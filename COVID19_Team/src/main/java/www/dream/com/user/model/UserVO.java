package www.dream.com.user.model;

import lombok.Data;

@Data
public class UserVO {
	private long partyId;
	private long userId;
	private String loginId;
	private String password;
	private String email;
	private String authority;
	private boolean enabled;

}
