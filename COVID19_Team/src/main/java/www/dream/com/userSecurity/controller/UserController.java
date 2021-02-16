package www.dream.com.userSecurity.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.dream.com.userSecurity.model.AuthVO;
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
	public String postSign(UserVO userVO ) {
		userService.signUser(userVO);
		userService.signAuth(userVO.getUserId());

		return "redirect:/";
	}

	@RequestMapping(value = "userUpdate", method = RequestMethod.GET)
	public void getUpdate() {

	}

	// 회원 정보 수정
	@RequestMapping(value = "userUpdate", method = RequestMethod.POST)
	public String postUpdate(UserVO userVO, HttpSession session) {
		userService.userUpdate(userVO);

		session.invalidate();

		return "redirect:/";
	}
	
	//회원 탈퇴
	@RequestMapping(value = "userDelete", method = RequestMethod.GET)
	public void getDelete() {
		
	}
	
	@RequestMapping(value ="userDelete", method = RequestMethod.POST )
	public String userDelete(UserVO userVO, HttpSession session, RedirectAttributes rttr) {

		UserVO vo = (UserVO)session.getAttribute("user");
		
		String sessionPw = vo.getPassword();
		String pw = userVO.getPassword();
		if(sessionPw.equals(pw)) {
			userService.userDelete(userVO);
			rttr.addFlashAttribute("result", "removeOk");
			session.invalidate();
			return "redirect:/";
		}else {
			rttr.addFlashAttribute("result","removeFalse");
			return "redirect:/user/userDelete";
			
		}
		
	}
	
	

	// 아이디 중복 체크
	@RequestMapping(value = "idChk", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String userId) {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = userService.idChk(userId);
		map.put("cnt", count);

		return map;
	}

}