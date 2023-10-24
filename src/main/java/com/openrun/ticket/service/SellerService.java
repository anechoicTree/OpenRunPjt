package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.SellerVO;

public interface SellerService {
	 public List listSellers() throws DataAccessException;
	 public SellerVO getSellerBySellerNo(int seller_no) throws DataAccessException;
	 public List<SellerVO> selectAllSellerListWithPagination(int start, int pageSize) throws DataAccessException;
	 int selectTotalSellerCount() throws DataAccessException;
	 public int approvalSeller(List<Integer> seller_nos) throws DataAccessException;
	 // 혜빈
	 public void insertSeller(SellerVO sellerVO) throws Exception;
	 public boolean isIdAvailable(String s_id);
	 public SellerVO Login(SellerVO sellerVO);
	 public SellerVO findIdCheck(SellerVO sellerVO);
	 public SellerVO findPwCheck(SellerVO sellerVO);
	 public String pwChange(SellerVO sellerVO);
	 public int withdrawal(SellerVO sellerVO)throws Exception;
}