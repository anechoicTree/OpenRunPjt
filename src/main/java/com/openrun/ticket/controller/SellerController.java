package com.openrun.ticket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.openrun.ticket.service.SellerService;
import com.openrun.ticket.vo.SellerVO;

@Controller
public class SellerController /*implements SellerController*/ {

    private final SellerService sellerService;

    @Autowired
    public SellerController(SellerService sellerService) {
        this.sellerService = sellerService;
    }
    
    @GetMapping(value = {"/cs/seller", "/cs/seller/listSellers"})
    public String listSellers(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
    ) throws Exception {
        // 한 페이지에 보여질 판매자 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = sellerService.selectTotalSellerCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize - 1;

        List<SellerVO> sellersList = sellerService.selectAllSellerListWithPagination(start, end);
        request.setAttribute("sellersList", sellersList);

        return "cs/cs_seller";
    }


    @GetMapping("/cs/seller/detail")
    public String showSellerDetail(HttpServletRequest request, @RequestParam("seller_no") int seller_no, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        // 판매자 번호로 판매자 정보를 가져옴
        SellerVO seller = sellerService.getSellerBySellerNo(seller_no);
        // Model에 데이터를 추가하여 JSP로 전달
        model.addAttribute("seller", seller);
        return "cs/cs_seller_detail";
    }
    
    @GetMapping("/admin/seller/listSellers")
    public String adminlistSellers(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
    ) throws Exception {
        // 한 페이지에 보여질 판매자 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = sellerService.selectTotalSellerCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize - 1;

        List<SellerVO> sellersList = sellerService.selectAllSellerListWithPagination(start, end);
        request.setAttribute("sellersList", sellersList);

        return "admin/admin_approval";
    }
    
    @PostMapping("/seller/approval")
    public String approvalSellers(@RequestParam(value = "selectedSellers[]", required = false) List<Integer> selectedSellerNos, RedirectAttributes redirectAttributes) throws Exception {
        if (selectedSellerNos != null && !selectedSellerNos.isEmpty()) {
            int result = sellerService.approvalSeller(selectedSellerNos);
            if (result > 0) {
                redirectAttributes.addFlashAttribute("success");
            } else {
                // 삭제가 실패하면 에러 메시지를 리다이렉트하여 표시
                redirectAttributes.addFlashAttribute("error");
            }
        } else {
            redirectAttributes.addFlashAttribute("error");
        }
        return "redirect:/admin/seller";
    }
    
	@GetMapping("/admin/seller")
	public String adminSeller(HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
		) throws Exception {
	        // 한 페이지에 보여질 판매자 개수
	        int pageSize = 10;
	        
	        // 페이지 번호와 총 페이지 개수를 계산하여 전달
	        int totalCount = sellerService.selectTotalSellerCount();
	        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
	        request.setAttribute("currentPage", page);
	        request.setAttribute("totalPages", totalPages);

	        // 페이지 시작점과 끝점을 계산
	        int start = (page - 1) * pageSize;
	        int end = start + pageSize - 1;

	        List<SellerVO> sellersList = sellerService.selectAllSellerListWithPagination(start, end);
	        request.setAttribute("sellersList", sellersList);

		return "admin/admin_approval";
	}
	
	// 혜빈
	
	 @Autowired
	    private JavaMailSender mailSender;
	 
	//seller 회원가입 동의서
	@GetMapping("/seller/createSellerAccountAgreementForm")
	public String createSellerAccountAgreementForm() {
		System.out.println("SellerController / createSellerAccountAgreementForm");
		
		//views 페이지
		String nextPage = "seller/createSellerAccountAgreementForm";
		return nextPage;
	}
	//seller 회원가입 form
	@GetMapping("/seller/createSellerAccountForm")
	public String createSellerAccountForm() {
		System.out.println("SellerController / createSellerAccountForm");
			
		String nextPage = "seller/createSellerAccountForm";
		return nextPage;
	}
	//seller 회원가입 데이터 전송
	@PostMapping("/seller/insertSeller")
	public String insertSeller(SellerVO sellerVO, Model model)throws Exception{
		System.out.println("SellerController / insertSeller");
		sellerService.insertSeller(sellerVO);
		
		model.addAttribute("s_business_name", sellerVO.getS_business_name());

		String nextPage = "seller/createSellerAccountOK";
		return nextPage;	
	}
	//seller 아이디 중복확인
	@PostMapping("/seller/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("s_id") String s_id, Model model) {
		System.out.println("SellerController / idCheck");
			
		model.addAttribute("s_id", s_id);
		
		boolean isIdAvailable = sellerService.isIdAvailable(s_id);
		if (isIdAvailable) {
			return "1"; // 사용 가능한 ID
		} else  {
		    return "0"; // 중복된 ID
		}
	}
	// seller 로그인
	@PostMapping("/seller/loginSeller")
	@ResponseBody
	public Map<String, String> Login(@ModelAttribute SellerVO sellerVO, HttpSession session) {
		 System.out.println("sellerController / Login");
		    session.removeAttribute("userLoginResult");
		    SellerVO sellerLoginResult = sellerService.Login(sellerVO);

		    Map<String, String> response = new HashMap<>();
		    System.out.println(sellerLoginResult);
		    
		    if (sellerLoginResult != null) {
		        session.setAttribute("sellerLoginResult", sellerLoginResult);
		        response.put("result", "1"); // 로그인 성공
		        response.put("s_level", sellerLoginResult.getS_level());
		    } else {
		        response.put("result", "0"); // 로그인 실패
		    }

		    return response;
		}
	
	// seller 로그인 완료
	@GetMapping("/seller/loginOk")
	public String loginOk() {
		System.out.println("SellerController / loginOk");

		String nextPage = "user/loginOk";
		return nextPage;
	}
	
	//seller 이메일 인증
	@GetMapping("/seller/emailSend")
	@ResponseBody
	public String emailSend(@RequestParam("s_email") String s_email, Model model) throws Exception{
		System.out.println("SellerController / emailSend");
		
		model.addAttribute("s_email", s_email);
		
		 /* 인증번호 생성 */
       Random random = new Random();
       int checkNum = random.nextInt(888888) + 111111;
       System.out.println(checkNum);
       
       String setFrom = "openrun@gmail.com";
       String toMail = s_email;
       String title = "openrun 회원가입 인증 이메일 입니다.";
       String content = 
               "openrun 홈페이지를 방문해주셔서 감사합니다." +
               "<br><br>" + 
               "인증 번호는 " + checkNum + "입니다.";
       
       try { 
           MimeMessage message = mailSender.createMimeMessage(); 
           MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
           helper.setFrom(setFrom); 
           helper.setTo(toMail); 
           helper.setSubject(title);
           helper.setText(content,true); 
           mailSender.send(message);
           System.out.println("SellerController이메일 발송 완료");
       } catch (Exception e) { 
           e.printStackTrace(); 
       }
		
       String num = Integer.toString(checkNum);
       return num;
	}
	//seller 회원가입 완료
	@GetMapping("/seller/createSellerAccountOK")
	public String createSellerAccountOK(){
		System.out.println("SellerController / createSellerAccountOK");
		
		String nextPage = "seller/createSellerAccountOK";
		return nextPage;
	}
	//seller 로그인 페이지 이동
	@GetMapping("/seller/sellerLogin")
	public String sellerLogin() {
		System.out.println("sellerController / sellerLogin");
			
		String nextPage = "seller/sellerLogin";
		return nextPage;
	}
	// seller 로그아웃-예시
	@GetMapping("/seller/exLoginOut")
	public String exLoginOut(HttpSession session) {
		System.out.println("sellerController / exLoginOut");
			
		session.invalidate();
			
		String nextPage = "seller/exLoginOut";
		return nextPage;
	}
	// seller 로그인-예시
	@GetMapping("/seller/exLoginOk")
	public String exLoginOk(HttpSession session) {
		System.out.println("sellerController / exLoginOk");
			
		String nextPage = "seller/exLoginOk";
		return nextPage;
	}
	//seller 로그인 승인예정
	@GetMapping("/seller/sellerLoginNo")
	public String sellerLoginNo() {
		System.out.println("sellerController / sellerLoginNo");
			
		String nextPage = "seller/sellerLoginNo";
		return nextPage;
	}
	//seller 아이디 찾기 페이지 이동
	@GetMapping("/seller/sellerFindId")
	public String sellerFindId() {
		System.out.println("sellerController / sellerFindId");
			
		String nextPage = "seller/sellerFindId";
		return nextPage;
	}
	//seller 아이디 찾기
	@PostMapping("/seller/findIdCheck")
	@ResponseBody
	public Map<String, Object> findIdCheck(SellerVO sellerVO) {

		Map<String, Object> response = new HashMap<>();

		SellerVO findResult = sellerService.findIdCheck(sellerVO);
		if (findResult != null) {
			response.put("result", "1");
			response.put("s_business_name", findResult.getS_business_name());
			response.put("s_id", findResult.getS_id());
		} else {
			response.put("result", "0");
		}

		return response;
	}
	//seller 비밀번호 찾기 페이지 이동
	@GetMapping("/seller/sellerFindPw")
	public String sellerFindPw() {
		System.out.println("sellerController / sellerFindPw");
			
		String nextPage = "seller/sellerFindPw";
		return nextPage;
	}
	//seller 비밀번호 찾기
	@PostMapping("/seller/findPwCheck")
	@ResponseBody
	public Map<String, Object> findPwCheck(SellerVO sellerVO) {

		Map<String, Object> response = new HashMap<>();

		SellerVO findResult = sellerService.findPwCheck(sellerVO);
		
		if (findResult != null) {
			response.put("result", "1");//회원가입 정보 찾기 성공
			response.put("s_id", findResult.getS_id());
		} else {
			response.put("result", "0");//회원가입 정보 찾기 실패
		}

		return response;
	}
	// seller 비밀번호 수정 페이지 이동
	@GetMapping("/seller/sellerPwChange")
	public String sellerPwChange() {
		System.out.println("sellerController / sellerPwChange");

		String nextPage = "seller/sellerPwChange";
		return nextPage;
	}
	//seller 아이디 찾기 성공
	@GetMapping("/seller/sellerFindIdOk")
	public String sellerFindIdOk() {
		System.out.println("sellerController / sellerFindIdOk");
					
		String nextPage = "seller/sellerFindIdOk";
		return nextPage;
	}
	//seller 비밀번호 수정
	@PostMapping("/seller/sellerPwChange") 
	@ResponseBody
	 public String pwChange(SellerVO sellerVO) {
	 System.out.println("sellerController / pwChange");
	 
	 String pwChangeResult = sellerService.pwChange(sellerVO);
	 
	 System.out.println(pwChangeResult);
	 
	 if(pwChangeResult==null) { 
		 System.out.println("비밀번호 수정 성공");
		 return "1"; //비밀번호 수정 성공 
	} else { 
		System.out.println("비밀번호 수정 실패");
		return "0"; //비밀번호 수정 실패 
	}
	}
	//seller 회원탈퇴 페이지
	@GetMapping("/product/admin/sellerWithdrawal")
	public String sellerWithdrawal(HttpSession session) {
		System.out.println("sellerController / sellerWithdrawal");
					
		String nextPage = "seller/sellerWithdrawal";
		return nextPage;
	}
	//seller 회원 탈퇴 비밀번호 입력 페이지
	@GetMapping("/product/admin/sellerWithdrawalOk")
	public String sellerWithdrawalOk( HttpSession session) {
		System.out.println("sellerController / sellerWithdrawalOk");
					
		String nextPage = "seller/sellerWithdrawalOk";
		return nextPage;
	}
	//seller 회원 탈퇴 
    @PostMapping("/product/admin/withdrawalOk")
    @ResponseBody
    public String withdrawalOk(SellerVO sellerVO, HttpSession session) throws Exception {
        System.out.println("sellerController / withdrawalOk");

        int withdrawalResult = sellerService.withdrawal(sellerVO);
        System.out.println(withdrawalResult);

        if (withdrawalResult == 1) {
        	session.removeAttribute("sellerLoginResult");
            System.out.println("회원 탈퇴 성공");
            return "1"; // 회원 탈퇴 성공
        } else {
            System.out.println("회원 탈퇴 실패");
            return "0"; // 회원 탈퇴 실패
        }
    }
	
}