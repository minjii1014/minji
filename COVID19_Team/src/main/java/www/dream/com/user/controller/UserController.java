package www.dream.com.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import www.dream.com.user.model.UserVO;
import www.dream.com.user.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//회원가입 get
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public void getSign() {
		
	}
	
	//회원가입 post
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String postSign(UserVO userVO) {
		
		userService.signUser(userVO);
		
		return "home";
	}

}
