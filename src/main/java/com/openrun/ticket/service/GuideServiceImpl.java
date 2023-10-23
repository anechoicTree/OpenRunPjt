package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.GuideDAO;
import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.GuideVO;
import com.openrun.ticket.vo.GuideVO;

/*@Transactional(propagation=Propagation.REQUIRED) */
@Service
public class GuideServiceImpl implements GuideService{
	   private GuideDAO guideDAO;
	   public void setGuideDAO(GuideDAO guideDAO){
	      this.guideDAO = guideDAO;
	   }

	   @Override
	   public List listGuides() throws DataAccessException {
	      List guidesList = null;
	      guidesList = guideDAO.selectAllGuideList();
	      return guidesList;
	   }	   

	   @Override
	   public List<GuideVO> selectAllGuideListWithPagination(int start, int pageSize) throws DataAccessException {
		   return guideDAO.selectAllGuideListWithPagination(start, pageSize);
	   }
		
	   @Override
	   public int selectTotalGuideCount() throws DataAccessException {
		   return guideDAO.selectTotalGuideCount();
	   }

	   @Override
	   public GuideVO getGuideByGuideNo(int guideNo) throws DataAccessException {
	       return guideDAO.getGuideByGuideNo(guideNo);
	   }
	   
	   @Override
	   public List<GuideVO> selectGuidesByCategoryWithPagination(int categoryNo, int start, int pageSize) throws DataAccessException {
		   return guideDAO.selectGuidesByCategoryWithPagination(categoryNo, start, pageSize);
	   }
	   
	   @Override
	   public int selectTotalGuideCountByCategory(int categoryNo) throws DataAccessException {
		   return guideDAO.selectTotalGuideCountByCategory(categoryNo);
	   }
	   
	   @Override
	   public int insertGuide(GuideVO guideVO) throws DataAccessException {
		   return guideDAO.insertGuide(guideVO);
	   }
	   
	   @Override
	   public int updateGuide(GuideVO guideVO) throws DataAccessException {
		   return guideDAO.updateGuide(guideVO);
	   }
	   
	   @Override
	   public int removeGuides(List<Integer> guideNos) throws DataAccessException {
	       int result = 0;
	       for (Integer guideNo : guideNos) {
	           result += guideDAO.removeGuide(guideNo);
	       }
	       return result;
	   }
}