package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.ReplyVO;

public interface ProductReplyService {

	public int insertReply(ReplyVO replyVO) throws DataAccessException;

	public List<ReplyVO> selectAllReply(int p_no) throws DataAccessException;

}
