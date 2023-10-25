package com.openrun.ticket.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.ProductVO;

public interface ProductDAO {
	 public boolean isPNum(int p_no) throws DataAccessException;
	 public boolean sellerList(int p_no) throws DataAccessException;
	 public int insertProduct(ProductVO productVO) throws DataAccessException;
	 public List<ProductVO> selectProductBySearch(ProductVO productVO) throws DataAccessException;
	 public ProductVO selectProduct(int p_no) throws DataAccessException; //
	 public int updateProduct(ProductVO productVO) throws DataAccessException;
	 public int deleteProduct(int p_no) throws DataAccessException;
	 public List<ProductVO> selectAllProduct(ProductVO productVO);

}
