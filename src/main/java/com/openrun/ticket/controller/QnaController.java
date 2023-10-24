package com.openrun.ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.openrun.ticket.service.QnaService;
import com.openrun.ticket.vo.QnaVO;
import com.openrun.ticket.vo.QnaVO;

@Controller
public class QnaController {

	private final QnaService qnaService;
	
	@Autowired
	public QnaController(QnaService qnaService) {
		this.qnaService = qnaService;
	}

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
	
}
    