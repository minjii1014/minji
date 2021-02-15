package www.dream.com.location.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dream.com.location.model.LocationVO;
import www.dream.com.location.model.mapper.LocationMapper;

@Service
public class LocationService {
	@Autowired
	private LocationMapper locationMapper;

	

	public void insertLocation(long locationX, long locationY) {
		locationMapper.insertLocation(locationX , locationY);
		
	}
}
