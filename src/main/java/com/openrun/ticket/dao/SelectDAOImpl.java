package com.openrun.ticket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.openrun.ticket.vo.SelectVO;

public class SelectDAOImpl implements SelectDAO {

    @Autowired
    private SqlSession sqlSession;
    
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

    @Override
    public List<SelectVO> getAllTicketsOrderBySelectNo() {
        return sqlSession.selectList("com.openrun.ticket.mappers.SelectMapper.getAllTicketsOrderBySelectNo");
    }
    
}