package www.dream.com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import www.dream.com.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
		
	@RequestMapping("listBoard")
	public void list(Model model) {
		model.addAttribute("listBoard", boardService.selectAllBoard());
	}
	
	@GetMapping("/post/map")
	public void map() {
	}
	
//	ㅝㅏ윶보유ㅗㅈ뮤옺유ㅗㅁ즁ㅈㅁ
//	저부어자ㅠ무어ㅏㅈ뮤ㅏ윱잠유ㅘㅈㅁㅇㄴ
//	ㅈ붜마유ㅏㅈ븀아ㅠㅂㅈㅁㄴ유ㅏㅓㅈㅁ늉ㅁ
//	ㅈ붜ㅏㅇ뮤나ㅓㅂ즁뮩븀ㅇㄴ쥼윶ㅁㄴ유ㅗㅁ쥬노ㅓ
//	ㅈ뮤ㅗㅇ뉴ㅗㅇㅁ쥬ㅗㅠ오점늉ㅁ뉴ㅗ어뮹ㅁㄵㅇㅁ

}

