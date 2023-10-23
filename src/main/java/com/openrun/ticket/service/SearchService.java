package com.openrun.ticket.service;

import java.util.List;

import com.openrun.ticket.vo.SearchVO;

public interface SearchService {
	 public List<SearchVO> searchContentsByTitle(String searchKeyword);
}