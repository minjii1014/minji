package www.dream.com.user.model.mapper;

import www.dream.com.user.model.UserVO;

public interface UserMapper {
	//회원 가입
	public void signUp(UserVO userVO);

	//아이디 중복 체크
	public int idChk(String userId);
	
	//로그인
	public UserVO login(UserVO userVO);
	
	//회원 정보 변경
	public void memberUpdate(UserVO userVO);
	
	//회원 탈퇴
	public void memberDelete(UserVO userVO);
	
	//비밀번호 검사
	public int passChk(UserVO userVO);
	
}