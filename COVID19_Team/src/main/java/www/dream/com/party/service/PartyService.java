package www.dream.com.party.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dream.com.party.model.PartyVO;
import www.dream.com.party.model.UserVO;
import www.dream.com.party.model.mapper.PartyMapper;

@Service
public class PartyService {
	@Autowired
	private PartyMapper partyMapper;
	
	public PartyVO showOverlap(PartyVO party) {
		return partyMapper.showOverlap(party);
	}
	
	public List<PartyVO> selectAllParty() {
		return partyMapper.selectAllParty();
	}
	
	public void infectedLocation(PartyVO party) {
		partyMapper.infectedLocation(party);
	}

	public void userLocation(UserVO user) {
		partyMapper.userLocation(user);
	}
	
}