package com.openrun.ticket.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.openrun.ticket.service.ReservationService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
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
	public String payment(HttpSession session){
		System.out.println("ReservationController / payment");
		
		String nextPage = "reservation/payment";
		return nextPage;
	}
	// 결제
	@PostMapping("/user/insertReservation")
	@ResponseBody
    public String insertReservation(@RequestBody Map<String,Object> params, Model model) {
		System.out.println("ReservationController / insertReservation");
		
		String r_count = (String) params.get("r_count");
		String r_amount = (String) params.get("r_amount");
		int u_no = (int) params.get("u_no");
		String pay_no = (String) params.get("pay_no");
		
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

}
