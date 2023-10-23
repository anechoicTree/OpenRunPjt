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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.openrun.ticket.service.FaqService;
import com.openrun.ticket.vo.FaqVO;

@Controller
public class FaqController /*implements FaqController*/ {

	private final FaqService faqService;
	
	@Autowired
	public FaqController(FaqService faqService) {
		this.faqService = faqService;
	}
	
	// 1. [일반] 고객센터 - FAQ 메인
    @GetMapping(value ="/cs/faq")
    public String listFaqs(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
    ) throws Exception {
        // 한 페이지에 보여질 공지사항 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = faqService.selectTotalFaqCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<FaqVO> faqsList = faqService.selectAllFaqListWithPagination(start, pageSize);
        request.setAttribute("faqsList", faqsList);

        return "cs/cs_faq";
    }
    
 // 2. [일반] 고객센터 - FAQ 목록
	@GetMapping(value ="/cs/faq/listFaqs")
	public String listFaqsAll(
	    HttpServletRequest request,
	    HttpServletResponse response,
	    @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
	) throws Exception {
	    // 한 페이지에 보여질 공지사항 개수
	    int pageSize = 10;
	    
	    // 페이지 번호와 총 페이지 개수를 계산하여 전달
	    int totalCount = faqService.selectTotalFaqCount();
	    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
	    request.setAttribute("currentPage", page);
	    request.setAttribute("totalPages", totalPages);
	
	    // 페이지 시작점과 끝점을 계산
	    int start = (page - 1) * pageSize;
	    int end = start + pageSize;
	
	    List<FaqVO> faqsList = faqService.selectAllFaqListWithPagination(start, pageSize);
	    request.setAttribute("faqsList", faqsList);
	
	    return "cs/cs_faq_list";
	}
	
	// 3. [일반] 고객센터 - FAQ 목록 - 카테고리 필터링
    @GetMapping("/cs/faq/listFaqsByCategory")
    public String listFaqsByCategory(
        HttpServletRequest request, 
        @RequestParam("categoryNo") int categoryNo,
        @RequestParam(name = "page", defaultValue = "1") int page, // 기본값은 1로 설정
        Model model
    ) throws Exception {
        request.setCharacterEncoding("utf-8");
        
        int pageSize = 10;
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<FaqVO> faqsList = faqService.selectFaqsByCategoryWithPagination(categoryNo, start, pageSize);
        model.addAttribute("faqsList", faqsList);
        
        // 페이지 번호와 총 페이지 개수 계산하여 전달
        int totalCount = faqService.selectTotalFaqCountByCategory(categoryNo);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("categoryNo", categoryNo);

        return "cs/cs_faq_list";
    }
	
	// 4. [일반] 고객센터 - FAQ 상세
	@GetMapping("/cs/faq/detail")
	public String showFaqDetail(HttpServletRequest request, @RequestParam("faqNo") int faqNo, Model model) throws Exception {
	request.setCharacterEncoding("utf-8");
	// 공지사항 번호로 공지사항 정보를 가져옴
		 FaqVO faq = faqService.getFaqByFaqNo(faqNo);	
		 // Model에 데이터를 추가하여 JSP로 전달
		 model.addAttribute("faq", faq);	
	return "cs/cs_faq_detail";
	}
  
    /* 관리자 */
    
	// 5. [관리자] FAQ 메인
	@GetMapping("/admin/faq")
	public String adminFaq(HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
		) throws Exception {
	        // 한 페이지에 보여질 공지사항 개수
	        int pageSize = 10;
	        
	        // 페이지 번호와 총 페이지 개수를 계산하여 전달
	        int totalCount = faqService.selectTotalFaqCount();
	        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
	        request.setAttribute("currentPage", page);
	        request.setAttribute("totalPages", totalPages);

	        // 페이지 시작점과 끝점을 계산
	        int start = (page - 1) * pageSize;
	        int end = start + pageSize;

	        List<FaqVO> faqsList = faqService.selectAllFaqListWithPagination(start, pageSize);
	        request.setAttribute("faqsList", faqsList);

		return "admin/admin_faq";
	}
	
	// 6. [관리자] FAQ 목록
    @GetMapping("/admin/faq/listFaqs")
    public String adminlistFaqs(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
    ) throws Exception {
        // 한 페이지에 보여질 공지사항 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = faqService.selectTotalFaqCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<FaqVO> faqsList = faqService.selectAllFaqListWithPagination(start, pageSize);
        request.setAttribute("faqsList", faqsList);

        return "admin/admin_faq";
    }
    
 // 7. [관리자] FAQ 목록 - 카테고리 필터링
	@GetMapping("/admin/faq/listFaqsByCategory")
    public String adminlistFaqsByCategory(
            HttpServletRequest request, 
            @RequestParam("categoryNo") int categoryNo,
            @RequestParam(name = "page", defaultValue = "1") int page, // 기본값은 1로 설정
            Model model
        ) throws Exception {
            request.setCharacterEncoding("utf-8");
            
            int pageSize = 10;
            int start = (page - 1) * pageSize;
            int end = start + pageSize;

            List<FaqVO> faqsList = faqService.selectFaqsByCategoryWithPagination(categoryNo, start, pageSize);
            model.addAttribute("faqsList", faqsList);
            
            // 페이지 번호와 총 페이지 개수 계산하여 전달
            int totalCount = faqService.selectTotalFaqCountByCategory(categoryNo);
            int totalPages = (int) Math.ceil((double) totalCount / pageSize);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("categoryNo", categoryNo);

            return "admin/admin_faq_list";
    }
    
	// 8. [관리자] FAQ 작성 페이지로 이동
    @GetMapping(value="/faq/faqForm")
    public String showFaqForm() throws Exception {    
        return "admin/admin_faqForm";
    }
    
    // 9. [관리자] FAQ 등록
    @PostMapping("/faq/insertFaq")
    @ResponseBody
    public String insertFaq(@ModelAttribute("faqVO") FaqVO faqVO) throws Exception {
        try {
            int result = faqService.insertFaq(faqVO);
            if (result > 0) {
                return "success";
            } else {
                return "error";
            }
        } catch (Exception e) {
            return "error";
        }
    }
    
    // 10. [관리자] FAQ 수정 페이지로 이동
    @GetMapping("/faq/faqUpdateForm")
    public String showFaqUpdateForm(HttpServletRequest request, @RequestParam("faqNo") int faqNo, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        // 공지사항 번호로 공지사항 정보를 가져옴
        FaqVO faq = faqService.getFaqByFaqNo(faqNo);
        // Model에 데이터를 추가하여 JSP로 전달
        model.addAttribute("faq", faq);
		return "admin/admin_faqUpdateForm";
    }
    
    // 11. [관리자] FAQ 수정
    @PostMapping("/faq/updateFaq")
    @ResponseBody
    public String updateFaq(@ModelAttribute("faqVO") FaqVO faqVO) throws Exception {
        try {
            int result = faqService.updateFaq(faqVO);
            if (result > 0) {
                return "success";
            } else {
                return "error";	
            }
        } catch (Exception e) {
            return "error";
        }
    }
    
    // 12. [관리자] FAQ 삭제
    @PostMapping("/faq/remove")
    public String removeFaqs(@RequestParam(value = "selectedFaqs[]", required = false) List<Integer> selectedFaqNos, RedirectAttributes redirectAttributes) throws Exception {
        if (selectedFaqNos != null && !selectedFaqNos.isEmpty()) {
            int result = faqService.removeFaqs(selectedFaqNos);
            if (result > 0) {
                redirectAttributes.addFlashAttribute("success");
            } else {
                // 삭제가 실패하면 에러 메시지를 리다이렉트하여 표시
                redirectAttributes.addFlashAttribute("error");
            }
        } else {
            redirectAttributes.addFlashAttribute("error");
        }
        return "redirect:/admin/faq";
    }
	

}	
