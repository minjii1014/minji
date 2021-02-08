package www.dream.com.party.model;

import lombok.Data;

@Data
public class PartyVO extends LocationVO {
	private long partyId;
	
	public PartyVO() {
		
	}
	public PartyVO(Long partyId) {
		super();
		this.partyId = partyId;
	}	
	
	
}
