package www.dream.com.party.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
	public ResponseEntity<List<PartyVO>> uploadAjaxAction(double latitude, double longitude, HttpServletRequest request) throws ParseException {
//		private DateTime strDate;
//		
//		String strDate = "2020/01/28 01:01:00";
//		SimpleDateFormat sdf = new SimpleDateFormat();
//		Date.parse(strDate);
//		, Date startDate, Date thruDate
		
		String Date1 = request.getParameter("startDate");
		String Date2 = request.getParameter("thruDate");
		
		Date startDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(Date1);
		Date thruDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(Date2);
		
//		Date startDate = new Date();
//		SimpleDateFormat format1;
//		format1 = new SimpleDateFormat("yyyy-MM-dd HH:MM");
//		System.out.println(format1.format(startDate));
//		
//		Date thruDate = new Date();
//		SimpleDateFormat format2;
//		format2 = new SimpleDateFormat("yyyy-MM-dd HH:MM");
//		System.out.println(format2.format(thruDate));
		
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