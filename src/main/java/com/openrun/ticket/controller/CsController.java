package com.openrun.ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.openrun.ticket.service.FaqService;
import com.openrun.ticket.service.NoticeService;
import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.NoticeVO;

@Controller
public class CsController {
	
//	private final NoticeService noticeService;
//	//private final FaqService faqService;
//	
//	@Autowired
//	public CsController(NoticeService noticeService, FaqService faqService) {
//		this.noticeService = noticeService;
//		//this.faqService = faqService;
//	}
	
	
//	고객센터 주소 매핑
	@GetMapping("/cs/main")
	public String csGET(Model model) {
		//List<PerformanceDTO> performance_admin = product.getAllProduct();
		//model.addAttribute("performance", performance_admin);
		return "cs/cs_main";
	}
	
}
