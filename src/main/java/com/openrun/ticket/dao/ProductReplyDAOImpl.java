package com.openrun.ticket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.ReplyVO;

public class ProductReplyDAOImpl implements ProductReplyDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<ReplyVO> selectAllReply(int p_no) throws DataAccessException {
        return sqlSession.selectList("com.openrun.ticket.mappers.ReplyMapper.selectAllReply", p_no);
	}

	@Override
	public int insertReply(ReplyVO replyVO) throws DataAccessException {
		return sqlSession.insert("com.openrun.ticket.mappers.ReplyMapper.insertReply", replyVO);
	}
}
