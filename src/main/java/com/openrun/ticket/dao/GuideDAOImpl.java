package com.openrun.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.GuideVO;

public class GuideDAOImpl implements GuideDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List selectAllGuideList() throws DataAccessException {
		List<GuideVO> guidesList = null;
		guidesList = sqlSession.selectList("com.openrun.ticket.mappers.GuideMapper.selectAllGuideList");
		return guidesList;
	}
	
	@Override
	public List<GuideVO> selectAllGuideListWithPagination(int start, int pageSize) throws DataAccessException {
		Map<String, Integer> params = new HashMap<>();
        params.put("start", start);
        params.put("pageSize", pageSize);
        return sqlSession.selectList("com.openrun.ticket.mappers.GuideMapper.selectAllGuideListWithPagination", params);
	};

    @Override
    public int selectTotalGuideCount() throws DataAccessException {
        return sqlSession.selectOne("com.openrun.ticket.mappers.GuideMapper.selectTotalGuideCount");
    }
	
	@Override
	public GuideVO getGuideByGuideNo(int guideNo) throws DataAccessException {
	    return sqlSession.selectOne("com.openrun.ticket.mappers.GuideMapper.getGuideByGuideNo", guideNo);
	}
	
    @Override
    public List<GuideVO> selectGuidesByCategoryWithPagination(int categoryNo, int start, int pageSize) throws DataAccessException {
    	Map<String, Integer> params = new HashMap<>();
        params.put("start", start);
        params.put("pageSize", pageSize);
        params.put("categoryNo", categoryNo);
    	return sqlSession.selectList("com.openrun.ticket.mappers.GuideMapper.selectGuidesByCategoryWithPagination", params);
    }
    
    @Override
    public int selectTotalGuideCountByCategory(int categoryNo) throws DataAccessException {
        return sqlSession.selectOne("com.openrun.ticket.mappers.GuideMapper.selectTotalGuideCountByCategory", categoryNo);
    }

	@Override
	public int insertGuide(GuideVO guideVO) throws DataAccessException {
		int result = sqlSession.insert("com.openrun.ticket.mappers.GuideMapper.insertGuide", guideVO);
		return result;
	}
	
	@Override
	public int updateGuide(GuideVO guideVO) throws DataAccessException {
		int result = sqlSession.update("com.openrun.ticket.mappers.GuideMapper.updateGuide", guideVO);
		return result;
	}

	@Override
    public int removeGuide(int guideNo) throws DataAccessException {
        return sqlSession.delete("com.openrun.ticket.mappers.GuideMapper.deleteGuide", guideNo);
    }
}