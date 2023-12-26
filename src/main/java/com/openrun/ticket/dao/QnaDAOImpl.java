package com.openrun.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.QnaVO;
import com.openrun.ticket.vo.QnaVO;

public class QnaDAOImpl implements QnaDAO {
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int insertQna(QnaVO qnaVO) throws DataAccessException {
		int result = sqlSession.insert("com.openrun.ticket.mappers.QnaMapper.insertQna", qnaVO);
		return result;
	}

	@Override
	public List selectAllQnaList() throws DataAccessException {
		List<QnaVO> qnasList = null;
		qnasList = sqlSession.selectList("com.openrun.ticket.mappers.QnaMapper.selectAllQnaList");
		return qnasList;
	}
	
	@Override
	public List<QnaVO> selectAllQnaListWithPagination(int start, int pageSize) throws DataAccessException {
		Map<String, Integer> params = new HashMap<>();
        params.put("start", start);
        params.put("pageSize", pageSize);
        return sqlSession.selectList("com.openrun.ticket.mappers.QnaMapper.selectAllQnaListWithPagination", params);
	};

    @Override
    public int selectTotalQnaCount() throws DataAccessException {
        return sqlSession.selectOne("com.openrun.ticket.mappers.QnaMapper.selectTotalQnaCount");
    }
	
	@Override
	public QnaVO getQnaByQnaNo(int qnaNo) throws DataAccessException {
	    return sqlSession.selectOne("com.openrun.ticket.mappers.QnaMapper.getQnaByQnaNo", qnaNo);
	}
	
 	@Override
    public List<QnaVO> selectQnasByCategoryWithPagination(int categoryNo, int start, int pageSize) throws DataAccessException {
    	Map<String, Integer> params = new HashMap<>();
        params.put("start", start);
        params.put("pageSize", pageSize);
        params.put("categoryNo", categoryNo);
    	return sqlSession.selectList("com.openrun.ticket.mappers.QnaMapper.selectQnasByCategoryWithPagination", params);
    }
    
    @Override
    public int selectTotalQnaCountByCategory(int categoryNo) throws DataAccessException {
        return sqlSession.selectOne("com.openrun.ticket.mappers.QnaMapper.selectTotalQnaCountByCategory", categoryNo);
    }
}