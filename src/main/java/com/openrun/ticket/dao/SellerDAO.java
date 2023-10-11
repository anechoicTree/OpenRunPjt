package com.openrun.ticket.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.SellerVO;

public interface SellerDAO {

	public List selectAllSellerList() throws DataAccessException;
	public List<SellerVO> selectAllSellerListWithPagination(int start, int pageSize);
	int selectTotalSellerCount();
	public SellerVO getSellerBySellerNo(int seller_no) throws DataAccessException;
	public int approvalSeller(int Seller_no) throws DataAccessException;
}
