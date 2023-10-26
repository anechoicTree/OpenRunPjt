package com.openrun.ticket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.openrun.ticket.service.SearchService;
import com.openrun.ticket.service.SelectService;
import com.openrun.ticket.service.UserService;
import com.openrun.ticket.vo.SearchVO;
import com.openrun.ticket.vo.UserVO;

@Controller
public class MainController {
	
    @Autowired
    private SelectService selectService;
    @Autowired
    private SearchService searchService;
    
	private UserService service;
	
	@Autowired
    public MainController(UserService userService) {
        this.service = userService;
    }
	
    @RequestMapping(value={"/"}, method = RequestMethod.GET)
    public String listNotices(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	
    	List<SearchVO> searchResults = searchService.searchContentsByRanking();
    	model.addAttribute("searchResults", searchResults);
	    return "main";
    }
    
	@RequestMapping(value= {"/joinMember"} , method = RequestMethod.GET)
	public String joinMember(Model model) throws Exception {
		List<UserVO> list = new ArrayList<>(); // 빈 리스트를 초기화하여 NullPointerException을 방지
	    try {
	        list = service.user();
	    } catch (Exception e) {
	        // 예외 처리 코드 추가
	        e.printStackTrace(); // 또는 로그에 기록하거나 적절한 처리를 수행
	    }

		model.addAttribute("useTest", list);
		
		return "joinMember";
	}

	
	@GetMapping("/loginForm")
	public String loginForm(){
		System.out.println("MainController / loginForm");
		
		String nextPage = "user/loginForm";
		return nextPage;
	}    
    
}