package com.openrun.ticket.service;

import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.LocationDAO;
import com.openrun.ticket.vo.LocationVO;


@Service
public class LocationServiceImpl implements LocationService{

    private LocationDAO locationDAO;
    public void setLocationDAO(LocationDAO locationDAO){
       this.locationDAO = locationDAO;
    }
	
	@Override
	public LocationVO locationDetail(int p_no) {
	System.out.println("[LocationService] locationDetail()");
	
	return locationDAO.selectLocation(p_no);
	}
}
