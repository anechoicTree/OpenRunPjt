package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.FaqVO;

public interface FaqService {
	 public List listFaqs() throws DataAccessException;
	 public FaqVO getFaqByFaqNo(int faqNo) throws DataAccessException;
	 public List<FaqVO> selectAllFaqListWithPagination(int start, int pageSize) throws DataAccessException;
	 public List<FaqVO> selectFaqsByCategoryWithPagination(int categoryNo, int start, int pageSize) throws DataAccessException;
	 public int selectTotalFaqCountByCategory(int categoryNo) throws DataAccessException;
	 public int selectTotalFaqCount() throws DataAccessException;
	 public int insertFaq(FaqVO faqVO) throws DataAccessException;
	 public int updateFaq(FaqVO faqVO) throws DataAccessException;
	 public int removeFaqs(List<Integer> faqNos) throws DataAccessException;

}