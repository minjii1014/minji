//package www.dream.com.party.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import www.dream.com.party.model.UserVO;
//import www.dream.com.party.service.PartyService;
//
//@Controller
//@RequestMapping("/party/*")
//public class PartyController {
//	@Autowired
//	private PartyService partyService;
//	
//	@RequestMapping("listParty")
//	public void list(Model model) {
//		model.addAttribute("listParty", partyService.selectAllParty());
//	}
//	
//	@GetMapping("map")
//	public void registerLocation(@RequestParam("id") long id, Model model) {
//		model.addAttribute("id", id);
//	}
//
//	@PostMapping("map")
//	public String registerLocation(UserVO user, RedirectAttributes rttr) {
//		partyService.registerLocation(user);
//		rttr.addFlashAttribute("result", user.getUserId());
//		
//		return "redirect:/post/map";
//	}
//	
//}