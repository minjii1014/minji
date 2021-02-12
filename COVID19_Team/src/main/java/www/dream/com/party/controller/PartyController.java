package www.dream.com.party.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.dream.com.party.model.PartyVO;
import www.dream.com.party.model.UserVO;
import www.dream.com.party.service.PartyService;

@Controller
@RequestMapping("/party/*")
public class PartyController {
	@Autowired
	private PartyService partyService;
	
	@GetMapping("registerLocation")
	public void registerLocation() {
//		@RequestParam("id") long id, Model model
//		model.addAttribute("id", id);
	}

	@PostMapping("registerLocation")
	public String registerLocation(UserVO user, RedirectAttributes rttr) {
		partyService.registerLocation(user);
		rttr.addFlashAttribute("result", user.getLatitude());
		rttr.addFlashAttribute("result", user.getLongitude());
		
		return "redirect:/party/registerLocation";
	}
	
	
	@PostMapping(value="/saveAjaxLocation", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<PartyVO>> uploadAjaxAction(double latitude, double longitude) {
		List<PartyVO> listRet = new ArrayList<>();
		
		PartyVO party = new PartyVO();
		party.setLatitude(latitude);
		party.setLongitude(longitude);
				
		listRet.add(party);
		partyService.registerLocation(party);
		
		return new ResponseEntity<>(listRet, HttpStatus.OK);
	}
	
	
}