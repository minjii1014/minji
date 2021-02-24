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
import www.dream.com.party.service.PartyService;

@Controller
@RequestMapping("/post/*")
public class PostController {
	@Autowired
	private PostService postService;

	@GetMapping("listPost")
	public void listPost(@RequestParam("boardId") long boardId, Criteria criteria, Model model) {
		criteria = new Criteria(criteria.getPageNum() , postService.listPost(boardId));
		model.addAttribute("listPost", postService.findPostWithPaging(boardId, criteria));

		model.addAttribute("criteria", criteria);
		model.addAttribute("boardId", boardId);
	}

	/**
	 * 상세 조회, 수정 화면 만들기
	 */
	@GetMapping({"postDetail", "modifyPost"})
	public void postDetail(@RequestParam("id") long id, Model model, Criteria criteria) {
		PostVO post = postService.findPostById(id);
		model.addAttribute("criteria", criteria);
		model.addAttribute("post", post);
	}

	
	/**
	 * 등록 화면 만들기
	 */
 	@GetMapping("registerPost")
// 	@PreAuthorize("isAuthenticated()")
	public void registerPost(@RequestParam("boardId") long boardId, Model model) {
		model.addAttribute("boardId", boardId);
	}
 	/**
 	 *  
 	 */
	@PostMapping("registerPost")
//	@PreAuthorize("isAuthenticated()")
	public String registerPost(PostVO post, RedirectAttributes rttr) {
//		post.setUserId(new PartyVO(2L));
		postService.registerPost(post);
		rttr.addFlashAttribute("result", post.getId());
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
//	@PreAuthorize("principal.username == #writer")
	public String removePost(PostVO post, RedirectAttributes rttr) {
		if(postService.removePost(post)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("boardId", post.getBoardId());
		return "redirect:/post/listPost";
	}

}