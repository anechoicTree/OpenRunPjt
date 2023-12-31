package com.openrun.ticket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

//import com.openrun.ticket.location.LocationService;
//import com.openrun.ticket.location.LocationVO;
import com.openrun.ticket.product.admin.util.UploadFileService;
import com.openrun.ticket.service.ProductServiceImpl;
import com.openrun.ticket.vo.ProductVO;


@Controller
@RequestMapping("/product/admin")
public class ProductController {
	
	@Autowired
	ProductServiceImpl productService;
	
//	@Autowired
//	LocationService locationService;
	
	@Autowired
	UploadFileService uploadFileService;
	
	@GetMapping("/registerProductForm")
	public String registerProductForm() {
		System.out.println("[ProductController] registerProductForm()");
		
		String nextPage = "admin/product/register_product_form";
		
		return nextPage;
	}
	
	@PostMapping("/registerProductConfirm")
	public String registerProductConfirm(ProductVO productVO,
									  @RequestParam("file") MultipartFile file) {
		System.out.println("[ProductController] registerProductConfirm()");
		
		String nextPage = "admin/product/register_product_ok";
		
		String savedFileName = uploadFileService.upload(file);
		
		if(savedFileName != null) {
			productVO.setP_img(savedFileName);
			int result = productService.registerProductConfirm(productVO);
			
			if(result <= 0 ) {
				nextPage = "admin/product/register_product_ng";
			} else {
				nextPage = "admin/product/register_product_ok";
			}
		}
		return nextPage;
	}
	
	@GetMapping("/searchProductConfirm")
	public String searchProductConfirm(ProductVO productVO, Model model) {
		System.out.println("[ProductController] searchProductConfirm()");
		
		String nextPage = "admin/product/search_product";
		
		List<ProductVO> productVOs = productService.searchProductConfirm(productVO);
		
		model.addAttribute("productVOs", productVOs);
		
		return nextPage;
	}
	
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam("p_no") int p_no, Model model) {
		System.out.println("[ProductController] productDetail()");
		
		String nextPage = "admin/product/product_detail";
		
		ProductVO productVO = productService.productDetail(p_no);
		
		model.addAttribute("productVO", productVO);
		
		return nextPage;
	}
	
	@GetMapping("/modifyProductForm")
	public String modifyProductForm(@RequestParam("p_no") int p_no, Model model) {
		System.out.println("[Productcontroller] modifyProductForm()");
		
		String nextPage = "admin/product/modify_product_form";
		
		ProductVO productVO = productService.modifyProductForm(p_no);
		
		model.addAttribute("productVO", productVO);
		
		return nextPage;
	}
	
	@PostMapping("/modifyProductConfirm")
	public String modifyProductConfirm(ProductVO productVO, @RequestParam("file") MultipartFile file) {
		System.out.println("[ProductController] modifyProductConfirm()");
		
		String nextPage = "admin/product/modify_product_ok";
		
		if(!file.getOriginalFilename().equals("")) {
			String savedFileName = uploadFileService.upload(file);
			
			if(savedFileName != null) {
				productVO.setP_img(savedFileName);
			}
		}
		int result = productService.modifyProductConfirm(productVO);
		
		if(result <= 0)
			nextPage = "admin/product/modify_product_ng";
		
		return nextPage;
	}
	
	//product_sell_info.jsp 컨트롤러-DAO아직 없음, 페이지창만 열리게 해둠
	@GetMapping("/productSellInfo")
	public String productSellInfo(@RequestParam("p_no") int p_no, Model model) {
		System.out.println("[ProductController] productSellInfo()");
		
		String nextPage = "admin/product/product_sell_info";
		
		ProductVO productVO = productService.productDetail(p_no);
		
		model.addAttribute("productVO", productVO);
		
		return nextPage;
	}
	
	//product_review.jsp 컨트롤러-DAO아직 없음, 페이지창만 열리게 해둠
	@GetMapping("/productReview")
	public String productReview(@RequestParam("p_no") int p_no, Model model) {
		System.out.println("[ProductController] productReview()");
		
		String nextPage = "admin/product/product_review";
		
		ProductVO productVO = productService.productDetail(p_no);
		
		model.addAttribute("productVO", productVO);
		
		return nextPage;
	}
	
	//product_place_info.jsp 컨트롤러-DAO아직 없음, 페이지창만 열리게 해둠
//	@GetMapping("/productPlaceInfo")
//	public String productPlaceInfo(@RequestParam("p_no") int p_no, Model model) {
//		System.out.println("[ProductController] productPlaceInfo()");
//		
//		String nextPage = "admin/product/product_place_info";
//		
//		ProductVO productVO = productService.productDetail(p_no);
//		
//		LocationVO locationVO = locationService.locationDetail(p_no);
//		
//		model.addAttribute("productVO", productVO);
//		
//		model.addAttribute("locationVO", locationVO);
//		
//		return nextPage;
//	}
	
	//seller_product_list.jsp 컨트롤러-DAO아직 없음, 페이지창만 열리게 해둠
	@GetMapping("/sellerProductList")
	public String sellerProductList() {
		System.out.println("[ProductController] sellerProductList()");
		
		String nextPage = "admin/product/seller_product_list";
		
		return nextPage;
	}
	
	//seller_product_list.jsp 컨트롤러-DAO아직 없음, 페이지창만 열리게 해둠
	@GetMapping("/inquiryProductList")
	public String inquiryProductList() {
		System.out.println("[ProductController] inquiryProductList()");
		
		String nextPage = "admin/product/inquiry_product_list";
		
		return nextPage;
	}
}
