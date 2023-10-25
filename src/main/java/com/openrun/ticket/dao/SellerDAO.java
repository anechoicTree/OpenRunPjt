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
	
	// 혜빈
	public void insertSeller(SellerVO sellerVO) throws Exception;
	public int idCheck(String s_id);
	public SellerVO Login(SellerVO sellerVO);
	public SellerVO findIdCheck(SellerVO sellerVO);
	public SellerVO findPwCheck(SellerVO sellerVO);
	public int pwChange(SellerVO sellerVO);
	public int withdrawal(SellerVO sellerVO)throws Exception;
	public SellerVO modificationPwCheck(SellerVO sellerVO);
	public int modification(SellerVO sellerVO);
}
