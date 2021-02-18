//package www.dream.com.userSecurity.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import www.dream.com.userSecurity.model.UserVO;
//import www.dream.com.userSecurity.model.mapper.UserMapper;
//
//
//@Service
//public class UserService {
//	@Autowired
//	private UserMapper userMapper;
//	
//	@Autowired
//	private BCryptPasswordEncoder bcryptPasswordEncoder;
//	
//	@Transactional
//	public void signUser(UserVO userVO) {
//		String endcodedPassword = bcryptPasswordEncoder.encode(userVO.getPassword());
//		userVO.setPassword(endcodedPassword);
//		userMapper.signUser(userVO);
//	}
//	
//	@Transactional
//	public void userUpdate(UserVO userVO) {
//		String endcodedPassword = bcryptPasswordEncoder.encode(userVO.getPassword());
//		userVO.setPassword(endcodedPassword);
//		userMapper.userUpdate(userVO);
//	}
//	
//	public int idChk(String userId) {
//		int result = userMapper.idChk(userId);
//		System.out.println(result);
//		return result;
//	}
//	
//	@Transactional
//	public void signAuth(String userId) {
//		userMapper.signAuth(userId);
//	}
//	
//	@Transactional
//	public void userDelete(UserVO userVO) {
//		userMapper.userDelete(userVO);
//	}
//
//
//}