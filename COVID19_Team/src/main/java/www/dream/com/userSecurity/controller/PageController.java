package www.dream.com.userSecurity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class PageController {
	
	@GetMapping("all")
	public void doAll() {
		System.out.println("모든 사용자 진입 가능 페이지");
	}
	
	@GetMapping("member")
	public void doMember() {
		System.out.println("회원 사용자 진입 가능 페이지");
	}
	
	@GetMapping("admin")
	public void doAdmin() {
		System.out.println("관리자 진입 가능 페이지");
	}

}
