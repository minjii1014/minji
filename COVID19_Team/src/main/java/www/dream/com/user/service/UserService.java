package www.dream.com.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dream.com.user.model.UserVO;
import www.dream.com.user.model.mapper.UserMapper;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	
	public void signUser(UserVO userVO) {
		userMapper.signUser(userVO);
	}
	

}
