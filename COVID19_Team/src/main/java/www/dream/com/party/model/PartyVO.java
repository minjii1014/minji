package www.dream.com.party.model;

import lombok.Data;

@Data
public class PartyVO {
	
	private long partyNum;
	private long partyId;
	private double latitude;
	private double longitude;
	private String startDate;
	private String thruDate;
	
//	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
//	private LocalDateTime SDate;
	
	public PartyVO() {
	}
	
}
