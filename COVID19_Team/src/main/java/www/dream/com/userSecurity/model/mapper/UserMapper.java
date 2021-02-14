package www.dream.com.userSecurity.model.mapper;

import www.dream.com.userSecurity.model.UserVO;

public interface UserMapper {

	public UserVO read(String userId);
	
	public void signUser(UserVO userVO);
	
	public void userUpdate(UserVO userVO);
	
	// 아이디 중복 체크
	public int idChk(String userId);
}