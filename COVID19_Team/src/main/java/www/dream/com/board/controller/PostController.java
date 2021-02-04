package www.dream.com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.dream.com.board.model.Criteria;
import www.dream.com.board.model.PostVO;
import www.dream.com.board.service.PostService;
import www.dream.com.party.model.PartyVO;

//change
//test
@Controller
@RequestMapping("/post/*")
public class PostController {
	@Autowired
	private PostService postService;
	
	@GetMapping("listPost")
	public void listPost(@RequestParam("boardId") long boardId, Criteria criteria, Model model) {
		model.addAttribute("listPost", postService.findPostWithPaging(boardId, criteria));
		model.addAttribute("criteria", criteria);
		model.addAttribute("boardId", boardId);
	}
	
	/**
	 * 상세 조회, 수정 화면 만들기
	 */
	@GetMapping({"postDetail", "modifyPost"})
	public void postDetail(@RequestParam("postId") long postId, Model model) {
		PostVO post = postService.findPostById(postId);
		model.addAttribute("post", post);
	}
	
	/**
	 * 등록 화면 만들기
	 */
 	@GetMapping("registerPost")
	public void registerPost(@RequestParam("boardId") long boardId, Model model) {
		model.addAttribute("boardId", boardId);
	}

 	/**
 	 *  
 	 */
	@PostMapping("registerPost")
	public String registerPost(PostVO post, RedirectAttributes rttr) {
		post.setUserId(new PartyVO(2L));
		postService.registerPost(post);
		rttr.addFlashAttribute("result", post.getPostId());
		rttr.addAttribute("boardId", post.getBoardId());
		return "redirect:/post/listPost";
	}
	
	/**
	 * 수정 기능
	 */
	@PostMapping("modifyPost")
	public String modifyPost(PostVO post, RedirectAttributes rttr) {
		if(postService.updatePost(post)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("result", "success");
		rttr.addAttribute("boardId", post.getBoardId());
		return "redirect:/post/listPost";
	}
	
	/**
	 * 삭제 기능
	 */
	@PostMapping("removePost")
	public String removePost(PostVO post, RedirectAttributes rttr) {
		if(postService.removePost(post)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("boardId", post.getBoardId());
		return "redirect:/post/listPost";
	}
}
