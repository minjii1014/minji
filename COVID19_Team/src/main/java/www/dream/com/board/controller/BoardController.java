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
	
	// 민지님 바보 해삼 똥개
	
}

