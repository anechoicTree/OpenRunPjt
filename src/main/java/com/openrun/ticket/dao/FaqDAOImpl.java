package com.openrun.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.FaqVO;

public class FaqDAOImpl implements FaqDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List selectAllFaqList() throws DataAccessException {
		List<FaqVO> faqsList = null;
		faqsList = sqlSession.selectList("com.openrun.ticket.mappers.FaqMapper.selectAllFaqList");
		return faqsList;
	}
	
	@Override
	public List<FaqVO> selectAllFaqListWithPagination(int start, int pageSize) throws DataAccessException {
		Map<String, Integer> params = new HashMap<>();
        params.put("start", start);
        params.put("pageSize", pageSize);
        return sqlSession.selectList("com.openrun.ticket.mappers.FaqMapper.selectAllFaqListWithPagination", params);
	};
	
    @Override
    public int selectTotalFaqCount() throws DataAccessException {
        return sqlSession.selectOne("com.openrun.ticket.mappers.FaqMapper.selectTotalFaqCount");
    }
    
    @Override
    public List<FaqVO> selectFaqsByCategoryWithPagination(int categoryNo, int start, int pageSize) throws DataAccessException {
    	Map<String, Integer> params = new HashMap<>();
        params.put("start", start);
        params.put("pageSize", pageSize);
        params.put("categoryNo", categoryNo);
    	return sqlSession.selectList("com.openrun.ticket.mappers.FaqMapper.selectFaqsByCategoryWithPagination", params);
    }
    
    @Override
    public int selectTotalFaqCountByCategory(int categoryNo) throws DataAccessException {
        return sqlSession.selectOne("com.openrun.ticket.mappers.FaqMapper.selectTotalFaqCountByCategory", categoryNo);
    }
	
	@Override
	public FaqVO getFaqByFaqNo(int faqNo) throws DataAccessException {
	    return sqlSession.selectOne("com.openrun.ticket.mappers.FaqMapper.getFaqByFaqNo", faqNo);
	}
	
	@Override
	public int insertFaq(FaqVO faqVO) throws DataAccessException {
		int result = sqlSession.insert("com.openrun.ticket.mappers.FaqMapper.insertFaq", faqVO);
		return result;
	}
	
	@Override
	public int updateFaq(FaqVO faqVO) throws DataAccessException {
		int result = sqlSession.update("com.openrun.ticket.mappers.FaqMapper.updateFaq", faqVO);
		return result;
	}

	@Override
    public int removeFaq(int faqNo) throws DataAccessException {
        return sqlSession.delete("com.openrun.ticket.mappers.FaqMapper.deleteFaq", faqNo);
    }
}