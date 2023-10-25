package com.openrun.ticket.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.ReplyVO;

public interface ProductReplyDAO {

	public List<ReplyVO> selectAllReply(int p_no) throws DataAccessException;

	public int insertReply(ReplyVO replyVO) throws DataAccessException;

}
