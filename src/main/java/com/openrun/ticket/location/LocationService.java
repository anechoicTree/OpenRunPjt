package com.openrun.ticket.location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationService {
	@Autowired
	LocationDAO locationDao;
	
	public LocationVO locationDetail(int p_no) {
		System.out.println("[LocationService] locationDetail()");
		
		return locationDao.selectLocation(p_no);
	}
}
