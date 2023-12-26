package com.openrun.ticket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.openrun.ticket.vo.AdminVO;

public class AdminDAOImpl implements AdminDAO {
 
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
    
    //로그인 체크
    //id가 null이면 false를 리턴하고 값이 있으면 true를 리턴한다.
    @Override
    public boolean loginCheck(AdminVO adminVO) throws Exception{
        
        String name = sqlSession.selectOne("login_check", adminVO);
        System.out.println(name);
        //조건식 ? true일때의 값 : false일때의 값
        return (name==null) ? false : true;
        
    }
}