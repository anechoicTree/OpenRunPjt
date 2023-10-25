package com.openrun.ticket.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.openrun.ticket.product.admin.util.UploadFileService;
import com.openrun.ticket.service.LocationService;
import com.openrun.ticket.service.ProductReplyService;
import com.openrun.ticket.service.ProductServiceImpl;
import com.openrun.ticket.service.UserService;
import com.openrun.ticket.vo.LocationVO;
import com.openrun.ticket.vo.ProductVO;
import com.openrun.ticket.vo.ReplyVO;
import com.openrun.ticket.vo.UserVO;


@Controller
@RequestMapping("/product/seller")
public class ProductController {
	
	@Autowired
	ProductServiceImpl productService;
	
	@Autowired
	LocationService locationService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProductReplyService productReplyService;
	
	@Autowired
	UploadFileService uploadFileService;
	
	
	//판매자 마이페이지 상품 등록 페이지 이동
	@GetMapping("/registerProductForm")
	public String registerProductForm() {
		System.out.println("[ProductController] registerProductForm()");
		
		String nextPage = "admin/product/register_product_form";
		
		return nextPage;
	}
	
	//판매자 마이페이지 상품 등록이 정상적으로 실행되면 이동
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
	
	//판매자 마이페이지 상품목록 리스트
	@GetMapping("/sellerProductList")
	public String sellerProductList(Model model, ProductVO productVO) {
		System.out.println("[ProductController] sellerProductList()");
		
		String nextPage = "admin/product/seller_product_list";
		
		List<ProductVO> productsList = productService.selectAllProduct(productVO);
		
		model.addAttribute("productsList", productsList);
		
		return nextPage;
	}
	
	//판매자 마이페이지 상품 목록 수정 페이지 이동
	@GetMapping("/modifyProductForm")
	public String modifyProductForm(@RequestParam("p_no") int p_no, Model model) {
		System.out.println("[Productcontroller] modifyProductForm()");
		
		String nextPage = "admin/product/modify_product_form";
		
		ProductVO productVO = productService.modifyProductForm(p_no);
		
		model.addAttribute("productVO", productVO);
		
		return nextPage;
	}
	
	//판매자 마이페이지 상품 목록 수정이 정상적으로 실행되면 이동 - 관리자한테 권한 넘기기 안되어있음
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
	
	@GetMapping("/searchProductConfirm")
	public String searchProductConfirm(ProductVO productVO, Model model) {
		System.out.println("[ProductController] searchProductConfirm()");
		
		String nextPage = "admin/product/search_product";
		
		List<ProductVO> productVOs = productService.searchProductConfirm(productVO);
		
		model.addAttribute("productVOs", productVOs);
		
		return nextPage;
	}
	
	
	//상품 상세 페이지 - 메인
	@GetMapping("/productDetail")
	public String productDetail(@RequestParam("p_no") int p_no, Model model) {
		System.out.println("[ProductController] productDetail()");
		
		String nextPage = "admin/product/product_detail";
		
		ProductVO productVO = productService.productDetail(p_no);
		
		model.addAttribute("productVO", productVO);
		
		return nextPage;
	}
	

	
	//상품 상세 페이지 - 판매자 정보
	@GetMapping("/productSellInfo")
	public String productSellInfo(@RequestParam("p_no") int p_no, Model model) {
		System.out.println("[ProductController] productSellInfo()");
		
		String nextPage = "admin/product/product_sell_info";
		
		ProductVO productVO = productService.productDetail(p_no);
		
		model.addAttribute("productVO", productVO);
		
		return nextPage;
	}
	
	// 상품 상세 페이지 - 관람후기 댓글
	@GetMapping("/productReview")
	public String productReview(@RequestParam("p_no") int p_no, Model model, ReplyVO replyVO) {
	    System.out.println("[ProductController] productReview()");

	    String nextPage = "admin/product/product_review";

	    ProductVO productVO = productService.productDetail(p_no);

	    // 댓글 목록을 가져오려면 selectAllReply를 사용합니다.
	    List<ReplyVO> replysList = productReplyService.selectAllReply(p_no);

	    model.addAttribute("productVO", productVO);

	    // 댓글 목록을 모델에 추가
	    model.addAttribute("replysList", replysList != null ? replysList : new ArrayList<>());

	    return nextPage;
	}
	
	// 댓글 삽입 처리
	@PostMapping("/addReply")
	public String addReply(@RequestParam("p_no") int p_no, @RequestParam("r_writer") String r_writer,
							@RequestParam("r_content") String r_content, Model model) {
	    System.out.println("[ProductController] addReply()");

	    ReplyVO replyVO = new ReplyVO();
	    replyVO.setP_no(p_no);
	    replyVO.setR_writer(r_writer);
	    replyVO.setR_content(r_content);

	    // 댓글을 데이터베이스에 삽입합니다.
	    int insertedReply = productReplyService.insertReply(replyVO);

	    if (insertedReply > 0) {
	        System.out.println("댓글이 DB에 성공적으로 삽입되었습니다.");
	    } else {
	        System.out.println("댓글 삽입 중 오류가 발생했습니다.");
	    }

	    List<UserVO> userVOs = userService.user();
	    
	    model.addAttribute("userVOs", userVOs);
	    
	    // 댓글 목록을 가져오려면 selectAllReply를 사용합니다.
	    List<ReplyVO> replysList = productReplyService.selectAllReply(p_no);

	    return "redirect:/product/seller/productReview?p_no=" + p_no;
	}
	
	//상품 상세 페이지 - NaverMap API를 통해 공연 장소와 일치하는 지도를 띄워줌 
	@GetMapping("/productPlaceInfo")
	public String productPlaceInfo(@RequestParam("p_no") int p_no, Model model) {
		System.out.println("[ProductController] productPlaceInfo()");
		
		String nextPage = "admin/product/product_place_info";
		
		ProductVO productVO = productService.productDetail(p_no);
		
		LocationVO locationVO = locationService.locationDetail(p_no);
		
		model.addAttribute("productVO", productVO);
		
		model.addAttribute("locationVO", locationVO);
		
		return nextPage;
	}
	

	
}
