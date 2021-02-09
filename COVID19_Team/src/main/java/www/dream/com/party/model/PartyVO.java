package www.dream.com.party.model;

import java.util.Date;

import lombok.Data;

@Data
public class PartyVO {
	private long partyId;			
	private Date startDate;	
	private Date thruDate;
	private double latitude;	
	private double longitude;
	
	public PartyVO() {
		
	}
	
	public PartyVO(long partyId) {
		super();
		this.partyId = partyId;
	}
	
}
