package com.openrun.ticket.dao;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.LocationVO;


public interface LocationDAO {
	public LocationVO selectLocation(int p_no) throws DataAccessException;
}
