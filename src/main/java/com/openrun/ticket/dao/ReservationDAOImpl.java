package com.openrun.ticket.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

@Repository
@Primary
public class ReservationDAOImpl implements ReservationDAO{
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private static final String namespace="com.openrun.ticket.reservationMapper";
	 
	private SqlSession sqlSession;
	
	@Override
	public int insertReservation(Map<String,Object> params) {
	    return sqlSession.insert(namespace + ".insertReservation", params);
	}
}
