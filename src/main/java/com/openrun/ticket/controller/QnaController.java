package com.openrun.ticket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.openrun.ticket.service.QnaService;
import com.openrun.ticket.vo.QnaVO;

@Controller
public class QnaController {

	private final QnaService qnaService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	public QnaController(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	
	// Java에서 기본 제공하는 ExecutorService를 사용하여 백그라운드에서 비동기로 이메일을 전송
	private static final ExecutorService executorService = Executors.newFixedThreadPool(10); // 10개의 스레드를 가진 풀을 생성

	// 1. [일반] 고객센터 - 1:1 문의 작성 페이지
    @GetMapping(value="/cs/qna")
    public String showQnaForm() throws Exception {    
        return "cs/cs_qna";
    }
    
    // 2. [일반] 고객센터 -  1:1 문의 제출
    @PostMapping("/cs/insertQna")
    public String insertQna(@ModelAttribute("qnaVO") QnaVO qnaVO) throws Exception {
        try {
            int result = qnaService.insertQna(qnaVO);
            System.out.println(result);
            if (result > 0) {
                return "cs/cs_main";
            } else {
                return "errorPage";
            }
        } catch (Exception e) {
            return "errorPage";
        }
    }
    
    /* 관리자 */
    
    // 3. [관리자] 1:1 문의 메인
	@GetMapping("/admin/qna")
	public String adminQna(HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
		) throws Exception {
	        // 한 페이지에 보여질 1:1 문의 개수
	        int pageSize = 10;
	        
	        // 페이지 번호와 총 페이지 개수를 계산하여 전달
	        int totalCount = qnaService.selectTotalQnaCount();
	        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
	        request.setAttribute("currentPage", page);
	        request.setAttribute("totalPages", totalPages);

	        // 페이지 시작점과 끝점을 계산
	        int start = (page - 1) * pageSize;
	        int end = start + pageSize;

	        List<QnaVO> qnasList = qnaService.selectAllQnaListWithPagination(start, pageSize);
	        request.setAttribute("qnasList", qnasList);

		return "admin/admin_qna";
	}
	
	// 4. [관리자] 1:1 문의 목록
    @GetMapping("/admin/qna/listQnas")
    public String adminlistQnas(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
		) throws Exception {
        // 한 페이지에 보여질 1:1 문의 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = qnaService.selectTotalQnaCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<QnaVO> qnasList = qnaService.selectAllQnaListWithPagination(start, pageSize);
        request.setAttribute("qnasList", qnasList);

        return "admin/admin_qna";
    }
    
    // 5. [관리자] 1:1 문의 목록 - 카테고리 필터링
	@GetMapping("/admin/qna/listQnasByCategory")
	   public String adminlistQnasByCategory(
	            HttpServletRequest request, 
	            @RequestParam("categoryNo") int categoryNo,
	            @RequestParam(name = "page", defaultValue = "1") int page, // 기본값은 1로 설정
	            Model model
	        ) throws Exception {
	            request.setCharacterEncoding("utf-8");
	            
	            int pageSize = 10;
	            int start = (page - 1) * pageSize;
	            int end = start + pageSize;

	            List<QnaVO> qnasList = qnaService.selectQnasByCategoryWithPagination(categoryNo, start, pageSize);
	            model.addAttribute("qnasList", qnasList);
	            
	            // 페이지 번호와 총 페이지 개수 계산하여 전달
	            int totalCount = qnaService.selectTotalQnaCountByCategory(categoryNo);
	            int totalPages = (int) Math.ceil((double) totalCount / pageSize);
	            model.addAttribute("currentPage", page);
	            model.addAttribute("totalPages", totalPages);
	            model.addAttribute("categoryNo", categoryNo);

	            return "admin/admin_qna_list";
	    }
	
	// 6. [관리자] 1:1 문의 - 상세 보기
    @GetMapping("/cs/qna/detail")
    public String showQnaDetail(HttpServletRequest request, @RequestParam("qnaNo") int qnaNo, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        // 1:1 문의 번호로 1:1 문의 정보를 가져옴
        QnaVO qna = qnaService.getQnaByQnaNo(qnaNo);
        // Model에 데이터를 추가하여 JSP로 전달
        model.addAttribute("qna", qna);
        return "admin/admin_qna_detail";
    }
	
    // 7. [관리자] 1:1 문의 - 답변 전송
    @PostMapping("/admin/qna/answerQna")
    public ResponseEntity<Map<String, Object>> answerQna(@RequestParam("title") String answerTitle,
            @RequestParam("body") String answerBody,
            @RequestParam("email") String email,
            Model model) throws Exception {
    	
    	Map<String, Object> response = new HashMap<>();
    	try {
    		// 비동기로 이메일 전송
            executorService.submit(() -> sendMail(email, answerTitle, answerBody));
	        response.put("status", "success");
	        return new ResponseEntity<>(response, HttpStatus.OK);
	    } catch (Exception e) {
	        response.put("status", "error");
	        response.put("message", "이메일 전송 중 오류가 발생했습니다: " + e.getMessage());
	        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
    }
     
	private void sendMail(String to, String subject, String text) {
	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setTo(to);
	    message.setSubject(subject);
	    message.setText(text);
	    mailSender.send(message);
	}

}
    