package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestParam;

import com.openrun.ticket.vo.ProductQnaVO;
import com.openrun.ticket.vo.ProductVO;

public interface ProductQnaService {

	public int insertProductQna(ProductQnaVO productQnaVO) throws DataAccessException;

	public List<ProductQnaVO> selectAllProductQna(ProductQnaVO productQnaVO) throws DataAccessException;
	
	public int registerInquiryConfirm(ProductQnaVO productQnaVO) throws DataAccessException;

	public ProductQnaVO productQnaDetail(int i_no) throws DataAccessException;

}
