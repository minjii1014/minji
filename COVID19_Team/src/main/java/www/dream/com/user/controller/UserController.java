package www.dream.com.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.dream.com.user.model.UserVO;
import www.dream.com.user.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;	
	
	/* 회원가입 */
	
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public void getSignUp() {
		
	}
	
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String postSignUp(@ModelAttribute UserVO userVO) {
		userService.signUp(userVO);
		
		return "redirect:/";
	}
	
	//아이디 중복 체크
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String userId) {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = userService.idChk(userId);
		map.put("cnt", count);
		System.out.println(map + "컨트롤러");

		return map;
	}
	
	//로그인 
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(UserVO userVO, HttpServletRequest req, RedirectAttributes rttr) {
			 
			HttpSession session = req.getSession();
			UserVO login = userService.login(userVO);
			boolean pwCheck = bCryptPasswordEncoder.matches(userVO.getPassword(), login.getPassword());
			System.out.println(pwCheck);
			System.out.println(login);
			
			
			if(login != null && pwCheck) {
				session.setAttribute("member", login);
			} else {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
			}
			return "redirect:/";
			
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "logout", method =  RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	/* 회원 정보 수정 */
	@RequestMapping(value = "memberUpdate", method =  RequestMethod.GET)
	public String getRegisterUpdate() {
		return "user/memberUpdate";
	}
	
	@RequestMapping(value ="memberUpdate", method = RequestMethod.POST )
	public String postRegisterUpdate(UserVO userVO, HttpSession session) {
		
		userService.memberUpdate(userVO);
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	/* 회원 탈퇴 */
	@RequestMapping(value = "memberDelete", method =  RequestMethod.GET)
	public String getMemberDelete() {
		return "user/memberDelete";
	}
	
	
	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	public String postMemberDelete(UserVO vo, HttpSession session, RedirectAttributes rttr) {
		/*
		 * UserVO userVO = (UserVO) session.getAttribute("member"); //세션에 있는 비밀번호 String
		 * sessionPass = userVO.getPassword(); //vo로 들어오는 비밀번호 String voPass =
		 * vo.getPassword();
		 * 
		 * if(!(sessionPass.equals(voPass))) {
		 * 
		 * rttr.addFlashAttribute("msg", false); return "redirect:/"; }
		 */
		
		userService.memberDelete(vo);
		session.invalidate();;
		
		return "redirect:/";
	}
	
	/* 비밀번호 체크 */
	@ResponseBody
	@RequestMapping(value = "passChk", method = RequestMethod.POST )
	public boolean passChk(UserVO userVO) {
		UserVO login = userService.login(userVO);
		boolean pwCheck = bCryptPasswordEncoder.matches(userVO.getPassword(), login.getPassword());
		System.out.println(userVO.getPassword());
		System.out.println(login.getPassword());
		System.out.println(pwCheck);
		return pwCheck;
	}
	
	
}
