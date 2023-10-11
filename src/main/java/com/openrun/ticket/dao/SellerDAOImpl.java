package com.openrun.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.SellerVO;

public class SellerDAOImpl implements SellerDAO {

		private SqlSession sqlSession;

		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}

		@Override
		public List selectAllSellerList() throws DataAccessException {
			List<SellerVO> sellersList = null;
			sellersList = sqlSession.selectList("com.openrun.ticket.mappers.SellerMapper.selectAllSellerList");
			return sellersList;
		}
		
		@Override
		public List<SellerVO> selectAllSellerListWithPagination(int start, int pageSize) throws DataAccessException {
			Map<String, Integer> params = new HashMap<>();
	        params.put("start", start);
	        params.put("pageSize", pageSize);
	        return sqlSession.selectList("com.openrun.ticket.mappers.SellerMapper.selectAllSellerListWithPagination", params);
		};

	    @Override
	    public int selectTotalSellerCount() throws DataAccessException {
	        return sqlSession.selectOne("com.openrun.ticket.mappers.SellerMapper.selectTotalSellerCount");
	    }
		
		@Override
		public SellerVO getSellerBySellerNo(int seller_no) throws DataAccessException {
		    return sqlSession.selectOne("com.openrun.ticket.mappers.SellerMapper.getSellerBySellerNo", seller_no);
		}
		
		@Override
		public int approvalSeller(int seller_no) throws DataAccessException {
			int result = sqlSession.update("com.openrun.ticket.mappers.SellerMapper.approvalSeller", seller_no);
			return result;
		}

	}