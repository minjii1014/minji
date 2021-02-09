package www.dream.com.party.model;

import java.util.Date;

import lombok.Data;

@Data
public class MoveInfoVO{
	private long partyId;			
	private Date startDate;	
	private Date thruDate;
	private long latitude;	
	private long longitude;	
	private long altitude;
}
