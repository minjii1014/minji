package www.dream.com.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import www.dream.com.user.model.UserVO;
import www.dream.com.user.model.mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;

//	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public void signUp(UserVO userVO) {
		String encoderpw = bCryptPasswordEncoder.encode(userVO.getPassword());
		userVO.setPassword(encoderpw);

		userMapper.signUp(userVO);
	}

	public int idChk(String userId) {
		int result = userMapper.idChk(userId);
		System.out.println(result);
		return result;
	}

	public UserVO login(UserVO userVO) {

		String pw = userVO.getPassword();
		System.out.println(userVO + "Service");
		System.out.println(userMapper.login(userVO));
		return userMapper.login(userVO);
	}

	public void memberUpdate(UserVO userVO) {
		String encoderpw = bCryptPasswordEncoder.encode(userVO.getPassword());
		userVO.setPassword(encoderpw);
		userMapper.memberUpdate(userVO);
	}

	public void memberDelete(UserVO userVO) {
		userMapper.memberDelete(userVO);
	}

	public int passChk(UserVO userVO) {
		int result = userMapper.passChk(userVO);
		return result;
	}

}