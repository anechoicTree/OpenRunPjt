package com.openrun.ticket.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.ProductReplyDAO;
import com.openrun.ticket.vo.ReplyVO;

@Service
public class ProductReplyServiceImpl implements ProductReplyService{
	private ProductReplyDAO productReplyDAO;
	public void setProductReplyDAO(ProductReplyDAO productReplyDAO){
	      this.productReplyDAO = productReplyDAO;
	   }

	@Override
	public List<ReplyVO> selectAllReply(int p_no) throws DataAccessException {
	    if (productReplyDAO == null) {
	        // productReplyDAO가 null인 경우에 대한 처리
	        return new ArrayList<>();
	    }

	    List<ReplyVO> replysList = productReplyDAO.selectAllReply(p_no);

	    // 댓글 목록이 null인 경우 빈 목록을 생성하여 반환
	    if (replysList == null) {
	        replysList = new ArrayList<>();
	    }

	    return replysList;
	}

	@Override
	public int insertReply(ReplyVO replyVO) throws DataAccessException {
		return productReplyDAO.insertReply(replyVO);
	}



}
