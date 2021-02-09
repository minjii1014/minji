package www.dream.com.userSecurity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dream.com.userSecurity.model.UserVO;
import www.dream.com.userSecurity.model.mapper.UserMapper;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	
	public void signUser(UserVO userVO) {
		userMapper.signUser(userVO);
	}
	

}