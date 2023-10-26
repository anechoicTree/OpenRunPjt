package com.openrun.ticket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	    // 검색 키워드를 모델에 추가하여 검색 결과가 없을 시 "'키워드'에 대한 검색 결과가 없습니다." 출력 용도
	    model.addAttribute("searchKeyword", searchKeyword);
	    return "searchResults";
	} 
	
	@GetMapping("/search")
	public String searchContentsByGet(@RequestParam("category") String category, Model model) {
	    List<SearchVO> searchResults = searchService.searchContentsByCategory(category);
	    model.addAttribute("searchResults", searchResults);
	    model.addAttribute("category", category);
	    return "searchResultsByCategory";
	}
	
	@GetMapping("/search/ranking")
	public String searchContentsByRanking(Model model) {
		 List<SearchVO> searchResults = searchService.searchContentsByRanking();
		 model.addAttribute("searchResults", searchResults);
		return "searchResultsByRanking";
	}
	
	@GetMapping("/search/location")
	public String searchContentsByLocation(Model model) {
		List<SearchVO> searchResults = searchService.searchContentsAll();
		model.addAttribute("searchResults", searchResults);
		return "searchResultsByLocation";
		
	}
	
}