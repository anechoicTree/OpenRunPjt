package com.openrun.ticket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

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
		
	    int a = sqlSession.insert(namespace + ".insertReservation", params);
	    System.out.println(a);
	    return a;
	}
	@Override 
	public int cancelPayment(@PathVariable(value= "merchant_uid") String merchant_uid) {
	    return sqlSession.update(namespace + ".cancelPayment", merchant_uid);
	}
	@Override 
	public List<String> exProduct() {
        return sqlSession.selectList(namespace + ".exProduct");
    }
	@Override
	public List<String> exProductDetail(int p_no) {
        return sqlSession.selectList(namespace + ".exProductDetail", p_no);
    }
}
