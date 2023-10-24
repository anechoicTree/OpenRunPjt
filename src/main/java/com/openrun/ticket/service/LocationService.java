package com.openrun.ticket.service;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.LocationVO;

public interface LocationService {
	public LocationVO locationDetail(int p_no) throws DataAccessException;
}
