package com.openrun.ticket.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.ProductQnaVO;

public interface ProductQnaDAO {
	public int insertProductQna(ProductQnaVO productQnaVO) throws DataAccessException;
	
	public List<ProductQnaVO> selectAllProductQna(ProductQnaVO productQnaVO) throws DataAccessException;

	public boolean isINum(int i_no) throws DataAccessException;

	public ProductQnaVO selectInquiry(int i_no) throws DataAccessException;

	public int updateAnswer(ProductQnaVO productQnaVO) throws DataAccessException;
}
