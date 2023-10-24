package com.openrun.ticket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.ProductQnaVO;

public class ProductQnaDAOImpl implements ProductQnaDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
    @Override
    public boolean isINum(int i_no) {
        int result = sqlSession.selectOne("com.openrun.ticket.mappers.ProductQnaMapper.isINum", i_no);
    	return result > 0;
    }
	
	public int insertProductQna(ProductQnaVO productQnaVO) {
		int result = sqlSession.insert("com.openrun.ticket.mappers.ProductQnaMapper.insertProductQna", productQnaVO);
		return result;
	}
	
	@Override
	public List<ProductQnaVO> selectAllProductQna(ProductQnaVO productQnaVO) throws DataAccessException {
        return sqlSession.selectList("com.openrun.ticket.mappers.ProductQnaMapper.selectAllProductQna", productQnaVO);
	}

	@Override
	public ProductQnaVO selectInquiry(int i_no) throws DataAccessException {
		return sqlSession.selectOne("com.openrun.ticket.mappers.ProductQnaMapper.selectInquiry", i_no);
	}

	@Override
	public int updateAnswer(ProductQnaVO productQnaVO) throws DataAccessException {
	    return sqlSession.update("com.openrun.ticket.mappers.ProductQnaMapper.updateAnswer", productQnaVO);
	}
	
}
