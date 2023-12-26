package com.openrun.ticket.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.SearchDAO;
import com.openrun.ticket.vo.SearchVO;

/*@Transactional(propagation=Propagation.REQUIRED) */
@Service
public class SearchServiceImpl implements SearchService{
	   private SearchDAO searchDAO;
	   public void setSearchDAO(SearchDAO searchDAO){
	      this.searchDAO = searchDAO;
	   }
	   
	   @Override
	   public List<SearchVO> searchContentsByTitle(String searchKeyword) {
	       return searchDAO.searchContentsByTitle(searchKeyword);
	   }
	   
	   @Override
	   public List<SearchVO> searchContentsByCategory(String category) {
	       return searchDAO.searchContentsByCategory(category);
	   }
	   
	   @Override
	   public List<SearchVO> searchContentsAll() {
	       return searchDAO.searchContentsAll();
	   }
	   
	   @Override
	   public List<SearchVO> searchContentsByRanking() {
	       return searchDAO.searchContentsByRanking();
	   }
	   
}