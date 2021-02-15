package www.dream.com.userSecurity.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private long partyId;
	private long userNum;
	private String email;
	private String userId;
	private String password;
	private boolean enabled;

	private Date regDate;
	private Date updateDate;

	private List<AuthVO> authList;

	public UserVO() {

	}

}