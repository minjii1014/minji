package www.dream.com.party.model;

import java.util.Date;

import lombok.Data;

@Data
public class PartyVO {
	private long partyNum;
	private long partyId;
	private double latitude;
	private double longitude;
	private Date startDate;
	private Date thruDate;
	
//	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
//	private LocalDateTime SDate;
	
	public PartyVO() {
	}
	
}
