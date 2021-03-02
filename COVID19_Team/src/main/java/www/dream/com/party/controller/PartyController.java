package www.dream.com.party.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import www.dream.com.party.model.PartyVO;
import www.dream.com.party.model.UserVO;
import www.dream.com.party.service.PartyService;

@Controller
@RequestMapping("/party/*")
public class PartyController {
	@Autowired
	private PartyService partyService;
	
	// 감염자(클릭)이벤트 위도 경도 저장하기 -- 감염자 관련
	@PostMapping(value="/saveInfectedLocation", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<PartyVO>> uploadAjaxAction(double latitude, double longitude, String startDate, String thruDate)  {
		
		List<PartyVO> listRet = new ArrayList<>();
		
		PartyVO party = new PartyVO();
		party.setLatitude(latitude);
		party.setLongitude(longitude);
		party.setStartDate(startDate);
		party.setThruDate(thruDate);
				
		listRet.add(party);
		partyService.infectedLocation(party);
		
		return new ResponseEntity<>(listRet, HttpStatus.OK);
	}
	
	// user 정보 저장하기 -- 유저 관련
	@PostMapping(value="/saveUserLocation", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<UserVO>> saveUserLocation(double latitude, double longitude, String startDate, String thruDate, HttpSession session) {
		String loginId = (String) session.getAttribute("userId");
		
		List<UserVO> listRet = new ArrayList<>();
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		String format_time2 = format1.format(time.getTime());
		
//		Date nowTime = new Date();

		UserVO user = new UserVO();
		user.setLatitude(latitude);
		user.setLongitude(longitude);
		user.setStartDate(format_time1);
		user.setThruDate(format_time2);
		user.setLoginId(loginId);
		
		listRet.add(user);
		partyService.userLocation(user);
		
		return new ResponseEntity<>(listRet, HttpStatus.OK);
	}
	
	@GetMapping("map")
	public void map(PartyVO party, Model model) {
		model.addAttribute("party", partyService.showOverlap(party));
//		System.out.println(partyService.showOverlap(party)); 
//		partyService.infectedLocation(party);
//		PartyVO party = partyService.infectedLocation(party);
				
	}
		
	@GetMapping("user")
	public void user(PartyVO party, Model model) {
		model.addAttribute("party", partyService.showOverlap(party));
	}

	
}