package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.FaqVO;

public interface FaqService {
	 public List listFaqs() throws DataAccessException;
	 public FaqVO getFaqByFaqNo(int faqNo) throws DataAccessException;
	 public List<FaqVO> selectAllFaqListWithPagination(int start, int pageSize) throws DataAccessException;
	 public List<FaqVO> selectFaqsByCategory(int categoryNo);
	 int selectTotalFaqCount() throws DataAccessException;
	 public int insertFaq(FaqVO faqVO) throws DataAccessException;
	 public int updateFaq(FaqVO faqVO) throws DataAccessException;
	 public int removeFaqs(List<Integer> faqNos) throws DataAccessException;

}