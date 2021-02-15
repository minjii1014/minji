package www.dream.com.location.model;


import java.util.Date;

import lombok.Data;

@Data
public class LocationVO {
	private long locationX;
	private long locationY;
	private Date startDate;
	private Date thruDate;

}
