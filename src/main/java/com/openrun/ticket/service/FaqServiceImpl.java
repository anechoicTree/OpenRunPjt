package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.FaqDAO;
import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.FaqVO;

/*@Transactional(propagation=Propagation.REQUIRED) */
@Service
public class FaqServiceImpl implements FaqService{
	   private FaqDAO faqDAO;
	   public void setFaqDAO(FaqDAO faqDAO){
	      this.faqDAO = faqDAO;
	   }

	   @Override
	   public List listFaqs() throws DataAccessException {
	      List faqsList = null;
	      faqsList = faqDAO.selectAllFaqList();
	      return faqsList;
	   }	   
	   
	   @Override
	   public List<FaqVO> selectAllFaqListWithPagination(int start, int pageSize) throws DataAccessException {
		   return faqDAO.selectAllFaqListWithPagination(start, pageSize);
	   }
	   
	   @Override
	   public List<FaqVO> selectFaqsByCategory(int categoryNo) {
		   return faqDAO.selectFaqsByCategory(categoryNo);
	   }
		
	   @Override
	   public int selectTotalFaqCount() throws DataAccessException {
		   return faqDAO.selectTotalFaqCount();
	   }

	   @Override
	   public FaqVO getFaqByFaqNo(int faqNo) throws DataAccessException {
	       return faqDAO.getFaqByFaqNo(faqNo);
	   }
	   
	   @Override
	   public int insertFaq(FaqVO faqVO) throws DataAccessException {
		   return faqDAO.insertFaq(faqVO);
	   }
	   
	   @Override
	   public int updateFaq(FaqVO faqVO) throws DataAccessException {
		   return faqDAO.updateFaq(faqVO);
	   }
	   
	   @Override
	   public int removeFaqs(List<Integer> faqNos) throws DataAccessException {
	       int result = 0;
	       for (Integer faqNo : faqNos) {
	           result += faqDAO.removeFaq(faqNo);
	       }
	       return result;
	   }
}