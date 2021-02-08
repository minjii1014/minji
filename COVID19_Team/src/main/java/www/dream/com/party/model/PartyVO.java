package www.dream.com.party.model;

import java.util.Date;

import lombok.Data;

@Data
public class PartyVO {
	private long partyId;
	private long latitude;
	private long longitude;
	private Date startDate;
	private Date thruDate;
	
	public PartyVO() {
		
	}
	public PartyVO(Long partyId) {
		super();
		this.partyId = partyId;
	}	
	
	
}
