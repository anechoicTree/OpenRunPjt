package com.openrun.ticket.service;

import java.util.List;

import com.openrun.ticket.vo.SearchVO;

public interface SearchService {
	 public List<SearchVO> searchContentsByTitle(String searchKeyword);
	 public List<SearchVO> searchContentsByCategory(String category);
	 public List<SearchVO> searchContentsAll();
	 public List<SearchVO> searchContentsByRanking();
}