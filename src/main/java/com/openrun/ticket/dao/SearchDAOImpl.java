package com.openrun.ticket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.SearchVO;

public class SearchDAOImpl implements SearchDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<SearchVO> searchContentsByTitle(String searchKeyword) throws DataAccessException {
	    return sqlSession.selectList("com.openrun.ticket.mappers.SearchMapper.searchContentsByTitle", searchKeyword);
	}
	
	@Override
	public List<SearchVO> searchContentsByCategory(String category) throws DataAccessException {
	    return sqlSession.selectList("com.openrun.ticket.mappers.SearchMapper.searchContentsByCategory", category);
	}
	
	@Override
	public List<SearchVO> searchContentsAll() throws DataAccessException {
	    return sqlSession.selectList("com.openrun.ticket.mappers.SearchMapper.searchContentsAll");
	}
	
	@Override
	public List<SearchVO> searchContentsByRanking() throws DataAccessException {
	    return sqlSession.selectList("com.openrun.ticket.mappers.SearchMapper.searchContentsByRanking");
	}
}