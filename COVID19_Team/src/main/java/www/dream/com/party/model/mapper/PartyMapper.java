package www.dream.com.party.model.mapper;

import java.util.List;

import www.dream.com.party.model.PartyVO;
import www.dream.com.party.model.UserVO;

public interface PartyMapper {
//	모든 지정한 유형의 Party 전부 출력하기
	public List<PartyVO> selectAllParty();
	
//	유저의 정보 DB에 넣기
	public void registerLocation(PartyVO party);
	
	
	
}
