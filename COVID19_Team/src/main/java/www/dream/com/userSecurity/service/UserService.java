package www.dream.com.userSecurity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import www.dream.com.userSecurity.model.UserVO;
import www.dream.com.userSecurity.model.mapper.UserMapper;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public void signUser(UserVO userVO) {
		String endcodedPassword = bcryptPasswordEncoder.encode(userVO.getPassword());
		userVO.setPassword(endcodedPassword);
		userMapper.signUser(userVO);
	}
	
	public void userUpdate(UserVO userVO) {
		userMapper.userUpdate(userVO);
	}
	
	public int idChk(String userId) {
		int result = userMapper.idChk(userId);
		System.out.println(result);
		return result;
	}

	
	

}