package www.dream.com.party.model;

import java.util.Date;

import lombok.Data;

@Data
public class InfectedVO extends PartyVO{
	 private Date startDate;
	 private Date thruDate;
}
