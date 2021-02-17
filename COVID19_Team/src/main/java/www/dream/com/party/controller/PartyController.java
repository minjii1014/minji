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
	public ResponseEntity<List<PartyVO>> uploadAjaxAction(double latitude, double longitude) {
		List<PartyVO> listRet = new ArrayList<>();
		
		PartyVO party = new PartyVO();
		party.setLatitude(latitude);
		party.setLongitude(longitude);
				
		listRet.add(party);
		partyService.infectedLocation(party);
		
		return new ResponseEntity<>(listRet, HttpStatus.OK);
	}
	
	// user 정보 저장하기 -- 유저 관련
	@PostMapping(value="/saveUserLocation", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<UserVO>> saveUserLocation(double latitude, double longitude) {
		List<UserVO> listRet = new ArrayList<>();
		
		UserVO user = new UserVO();
		user.setLatitude(latitude);
		user.setLongitude(longitude);
		
		listRet.add(user);
		partyService.userLocation(user);
		
		return new ResponseEntity<>(listRet, HttpStatus.OK);
	}
	

	
}