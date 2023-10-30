package com.openrun.ticket.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.openrun.ticket.service.ReservationService;
import com.openrun.ticket.vo.ProductVO;
import com.openrun.ticket.vo.UserVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class ReservationController{
	
	 private final ReservationService reservationService;
	 
	 @Autowired 
	 public ReservationController(ReservationService reservationService) { 
		 this.reservationService = reservationService; 
		 paymentApi(); // IamportClient 초기화
	 }
	//결제하기 페이지
	@GetMapping("/user/payment")
	public String payment(HttpSession session, @RequestParam("p_no") int p_no, Model model){
		System.out.println("ReservationController / payment");
		
		List<String> exProductDetail = reservationService.exProductDetail(p_no);

        model.addAttribute("exProductDetail", exProductDetail);
        
		String nextPage = "reservation/payment";
		return nextPage;
	}
	// 결제
	@PostMapping("/user/insertReservation")
	@ResponseBody
    public String insertReservation(@RequestBody Map<String,Object> params) {
		System.out.println("ReservationController / insertReservation");
		
		int p_no = (int) params.get("p_no");
		String r_count = (String) params.get("r_count");
		String r_amount = (String) params.get("r_amount");
		int u_no = (int) params.get("u_no");
		String pay_no = (String) params.get("pay_no");
		
		System.out.println(p_no);
		System.out.println(r_count);
		System.out.println(r_amount);
		System.out.println(u_no);
		System.out.println(pay_no);
		
		int result = reservationService.insertReservation(params);
		 
		if (result > 0) {
			return "1";
		} else {
			return "0";
		}
    }
	 //결제 API 
	private IamportClient api;
	 
	 public void paymentApi() { // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
	 this.api = new IamportClient("7554562643455857", "AGXZo9SECKHDt3L60G4WhZUbuJXdjr9Yc21LhWTwCS3Kx23wG4BLPPFXFo3ngePyIhNtAJb5cg00ccca"); 
	 }
	 
	 private final String apiKey = "7554562643455857";
	 private final String apiSecret = "AGXZo9SECKHDt3L60G4WhZUbuJXdjr9Yc21LhWTwCS3Kx23wG4BLPPFXFo3ngePyIhNtAJb5cg00ccca";
	 
	 @ResponseBody	 
	 @RequestMapping(value="/verifyIamport/{imp_uid}") 
	 public IamportResponse<Payment> paymentByImpUid( Model model , Locale locale , HttpSession session , 
			 @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{

		 	System.out.println("ReservationController / IamportResponse"); 
		 	return api.paymentByImpUid(imp_uid); 
	 }
	 
	//결제 완료 페이지
	@GetMapping("/user/paymentOk")
	public String paymentOk(HttpSession session){
		System.out.println("ReservationController / paymentOk");
				
		String nextPage = "reservation/paymentOk";
		return nextPage;
	}
	//결제 취소
	@PostMapping("/product/admin/cancelPayment/{merchant_uid}")
	@ResponseBody
	public String cancelPayment(@PathVariable String merchant_uid) {
	    // 요청에서 merchant_uid 가져오기
	    int cancelPaymentResult = reservationService.cancelPayment(merchant_uid);
	    System.out.println(cancelPaymentResult);

	    if (cancelPaymentResult == 1) {
	        System.out.println("결제 취소 성공");
	        return "1"; // 결제 취소 성공
	    } else {
	        System.out.println("결제 취소 실패");
	        return "0"; // 결제 취소 실패
	    }
	}
	//예시 예매하기 상품 페이지
	@GetMapping("/user/exProduct")
	public String exProduct(Model model) throws Exception {
	    System.out.println("ReservationController / exProduct");

	    List<String> exProduct = reservationService.exProduct(); // 서비스에서 데이터 가져오기

	    model.addAttribute("exProduct", exProduct);
	    System.out.println(exProduct);

	    String nextPage = "reservation/exProduct";
		return nextPage;
	}
	@GetMapping("/user/exProductDetail")
    public String exProductDetail(@RequestParam("p_no") int p_no, Model model) {
		
		List<String> exProductDetail = reservationService.exProductDetail(p_no);

        model.addAttribute("exProductDetail", exProductDetail);

        String nextPage = "reservation/exProductDetail";
        return nextPage;
    }
	
}
