package com.openrun.ticket.dao;

import org.apache.ibatis.session.SqlSession;

import com.openrun.ticket.vo.LocationVO;

public class LocationDAOImpl implements LocationDAO{
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public LocationVO selectLocation(int p_no) {
		return sqlSession.selectOne("com.openrun.ticket.mappers.LocationMapper.selectLocation", p_no);
	}

}
