package www.dream.com.party.model;

import lombok.Data;

@Data
public class UserVO extends PartyVO{
	private String loginId;
	private String password;
	private String email;
}


