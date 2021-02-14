package www.dream.com.userSecurity.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.dream.com.userSecurity.model.UserVO;
import www.dream.com.userSecurity.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService userService;
	
	

	// 로그인 페이지 진입
	@RequestMapping(value = "login")
	public void loginInput(String error, String logout, Model model) {
		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "LogOut!!!");
		}
	}

	// 로그아웃
	@RequestMapping(value = "customLogout")
	public void logoutGET() {
	}

	// 로그아웃
	@RequestMapping(value = "customLogout", method = RequestMethod.POST)
	public void logoutPOST() {
	}

	// 회원가입 get
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public void getSign() {

	}

	// 회원가입 post
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String postSign(UserVO userVO) {
		 
		userService.signUser(userVO);

		return "redirect:/home";
	}
	
	@RequestMapping(value = "userUpdate", method = RequestMethod.GET)
	public void getUpdate() {

	}

	
	//회원 정보 수정
	@RequestMapping(value = "userUpdate", method = RequestMethod.POST)
	public String postUpdate(UserVO userVO, HttpSession session) {
		userService.userUpdate(userVO);
		
		session.invalidate();
		
		return "redirect:/home";
	}
	
	
	// 아이디 중복 체크
	@RequestMapping(value="idChk", method = RequestMethod.POST)
	@ResponseBody
	public int postidChk(UserVO userVO) throws Exception {
		
		String userId = userVO.getUserId();
		System.out.println(userId);
		int idChk = userService.idChk(userVO);
		
		int result = 0;
		
		if(idChk == 1) {
			result = 1;
		}
		return result;
	}


}