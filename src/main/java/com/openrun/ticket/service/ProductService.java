package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.ProductVO;

public interface ProductService {

	 public int registerProductConfirm(ProductVO productVO) throws DataAccessException;
	 public List<ProductVO> searchProductConfirm(ProductVO productVO) throws DataAccessException;
	 public ProductVO productDetail(int p_no) throws DataAccessException;
	 public ProductVO modifyProductForm(int p_no) throws DataAccessException;
	 public int modifyProductConfirm(ProductVO productVO) throws DataAccessException;
	 public int deleteProductConfirm(int p_no) throws DataAccessException;
	 public ProductVO productSellInfo(int p_no) throws DataAccessException;
	 public ProductVO productReview(int p_no) throws DataAccessException;
	 public ProductVO productPlaceInfo(int p_no) throws DataAccessException;
	 public boolean sellerProductList(int p_no) throws DataAccessException;
}