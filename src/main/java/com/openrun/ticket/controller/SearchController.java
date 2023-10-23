package com.openrun.ticket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.openrun.ticket.service.SearchService;
import com.openrun.ticket.vo.SearchVO;

@Controller
public class SearchController /*implements SearchController*/ {

    private final SearchService searchService;

    @Autowired
    public SearchController(SearchService searchService) {
        this.searchService = searchService;
    }
    
	//search test
	@PostMapping("/search")
	public String searchContents(@RequestParam("searchKeyword") String searchKeyword, Model model) {
	    List<SearchVO> searchResults = searchService.searchContentsByTitle(searchKeyword);
	    model.addAttribute("searchResults", searchResults);
	    return "cs/searchResults";
	}
	
}