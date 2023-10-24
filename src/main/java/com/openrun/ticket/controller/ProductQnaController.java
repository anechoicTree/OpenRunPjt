package com.openrun.ticket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.openrun.ticket.service.ProductQnaServiceImpl;
import com.openrun.ticket.vo.ProductQnaVO;
import com.openrun.ticket.vo.ProductVO;

@Controller
@RequestMapping("/product/seller")
public class ProductQnaController {
	
	@Autowired
	ProductQnaServiceImpl productQnaService;
	
	//seller_product_list.jsp 컨트롤러-DAO아직 없음, 페이지창만 열리게 해둠
	@GetMapping("/inquiryProductList")
	public String inquiryProductList(Model model, ProductQnaVO productQnaVO) {
		System.out.println("[ProductQnaController] inquiryProductList()");
		
		String nextPage = "admin/product/inquiry_product_list";
		
		//ProductQnaVO를 list로 선언하고(jsp에서 forEach 반복문을 쓰려고 list로 선언) 
		//변수명을 productQnasList로 만든 후 서비스를 통해 VO에 저장되어 있는 값을 출력
		List<ProductQnaVO> productQnasList = productQnaService.selectAllProductQna(productQnaVO);
		
		//model에 productQnasList를 jsp에서 ${productQnasList}로 쓸 수 있게 함
		model.addAttribute("productQnasList", productQnasList);
		
		return nextPage;
	}
	
	@GetMapping("/registerInquiryForm")
	public String registerInquiryForm(@RequestParam("i_no") int i_no, Model model) {
		System.out.println("[ProductQnaController] registerInquiryForm()");
		
		 ProductQnaVO productQnaVO = productQnaService.productQnaDetail(i_no);

		 model.addAttribute("productQnaVO", productQnaVO);

		 String nextPage = "admin/product/inquiry_product_answer";
		
		return nextPage;
	}
	
	@PostMapping("/registerInquiryConfirm")
	public String registerInquiryConfirm(ProductQnaVO productQnaVO, Model model) {
		System.out.println("[ProductQnaController] registerInquiryConfirm()");
		
		String nextPage = "admin/product/register_inquiry_ok";
		
			int result = productQnaService.registerInquiryConfirm(productQnaVO);
			
			if(result <= 0 ) {
				nextPage = "admin/product/register_inquiry_ng";
			} else {
				nextPage = "admin/product/register_inquiry_ok";
			}
		return nextPage;
	}
	
}
