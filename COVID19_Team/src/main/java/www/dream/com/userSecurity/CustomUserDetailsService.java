package www.dream.com.userSecurity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.log4j.Log4j;
import www.dream.com.userSecurity.domain.CustomUser;
import www.dream.com.userSecurity.model.UserVO;
import www.dream.com.userSecurity.model.mapper.UserMapper;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserMapper userMapper;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + username);

		UserVO vo = userMapper.read(username);

		log.warn("queried by member mapper : " + vo);

		return vo == null ? null : new CustomUser(vo);
	}

}
