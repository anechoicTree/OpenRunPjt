package com.openrun.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List selectAllNoticeList() throws DataAccessException {
		List<NoticeVO> noticesList = null;
		noticesList = sqlSession.selectList("com.openrun.ticket.mappers.NoticeMapper.selectAllNoticeList");
		return noticesList;
	}
	
	@Override
	public List<NoticeVO> selectAllNoticeListWithPagination(int start, int pageSize) throws DataAccessException {
		Map<String, Integer> params = new HashMap<>();
        params.put("start", start);
        params.put("pageSize", pageSize);
        return sqlSession.selectList("com.openrun.ticket.mappers.NoticeMapper.selectAllNoticeListWithPagination", params);
	};

    @Override
    public int selectTotalNoticeCount() throws DataAccessException {
        return sqlSession.selectOne("com.openrun.ticket.mappers.NoticeMapper.selectTotalNoticeCount");
    }
	
	@Override
	public NoticeVO getNoticeByNoticeNo(int noticeNo) throws DataAccessException {
	    return sqlSession.selectOne("com.openrun.ticket.mappers.NoticeMapper.getNoticeByNoticeNo", noticeNo);
	}
	
    @Override
    public List<NoticeVO> selectNoticesByCategory(int categoryNo) throws DataAccessException {
        return sqlSession.selectList("com.openrun.ticket.mappers.NoticeMapper.selectNoticesByCategory", categoryNo);
    }

	@Override
	public int insertNotice(NoticeVO noticeVO) throws DataAccessException {
		int result = sqlSession.insert("com.openrun.ticket.mappers.NoticeMapper.insertNotice", noticeVO);
		return result;
	}
	
	@Override
	public int updateNotice(NoticeVO noticeVO) throws DataAccessException {
		int result = sqlSession.update("com.openrun.ticket.mappers.NoticeMapper.updateNotice", noticeVO);
		return result;
	}

	@Override
    public int removeNotice(int noticeNo) throws DataAccessException {
        return sqlSession.delete("com.openrun.ticket.mappers.NoticeMapper.deleteNotice", noticeNo);
    }
}