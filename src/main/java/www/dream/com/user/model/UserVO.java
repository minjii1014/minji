package www.dream.com.user.model;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO  {
	
	private long partyId;
	private long userNum;
	private String email;
	private String userId;
	private String password;
	private Date regdate;
	private Date updatedate;
	private boolean enabled;

}
