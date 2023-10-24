package com.openrun.ticket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.openrun.ticket.vo.ProductVO;

public class ProductDAOImpl implements ProductDAO {
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

    @Override
    public boolean isPNum(int p_no) {
        int result = sqlSession.selectOne("com.openrun.ticket.mappers.ProductMapper.isPNum", p_no);
    	return result > 0;
    }

    @Override
    public boolean sellerList(int p_no) {
    	int result = sqlSession.selectOne("com.openrun.ticket.mappers.ProductMapper.sellerList", p_no);
        return result > 0;
    }

    @Override
    public int insertProduct(ProductVO productVo) {
        return sqlSession.insert("com.openrun.ticket.mappers.ProductMapper.insertProduct", productVo);
    }

    @Override
    public List<ProductVO> selectProductBySearch(ProductVO productVo) {
        return sqlSession.selectList("com.openrun.ticket.mappers.ProductMapper.selectProductBySearch", productVo);
    }

    @Override
    public ProductVO selectProduct(int p_no) {
        return sqlSession.selectOne("com.openrun.ticket.mappers.ProductMapper.selectProduct", p_no);
    }

    @Override
    public int updateProduct(ProductVO productVo) {
        return sqlSession.update("com.openrun.ticket.mappers.ProductMapper.updateProduct", productVo);
    }

    @Override
    public int deleteProduct(int p_no) {
        return sqlSession.delete("com.openrun.ticket.mappers.ProductMapper.deleteProduct", p_no);
    }
}

