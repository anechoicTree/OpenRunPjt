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

import com.openrun.ticket.service.NoticeService;
import com.openrun.ticket.vo.NoticeVO;

@Controller
public class NoticeController /*implements NoticeController*/ {

    private final NoticeService noticeService;

    @Autowired
    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }
    
    // 1. [일반] 고객센터 - 공지사항 메인
    @GetMapping("/cs/notice")
    public String listNotices(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
    ) throws Exception {
        // 한 페이지에 보여질 공지사항 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = noticeService.selectTotalNoticeCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<NoticeVO> noticesList = noticeService.selectAllNoticeListWithPagination(start, pageSize);
        request.setAttribute("noticesList", noticesList);

        return "cs/cs_notice";
    }
    
    // 2. [일반] 고객센터 - 공지사항 목록
    @GetMapping("/cs/notice/listNotices")
    public String listNoticesAll(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
    ) throws Exception {
        // 한 페이지에 보여질 공지사항 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = noticeService.selectTotalNoticeCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<NoticeVO> noticesList = noticeService.selectAllNoticeListWithPagination(start, pageSize);
        request.setAttribute("noticesList", noticesList);

        return "cs/cs_notice_list";
    }
    
    // 3. [일반] 고객센터 - 공지사항 목록 - 카테고리 필터링
    @GetMapping("/cs/notice/listNoticesByCategory")
    public String listNoticesByCategory(
        HttpServletRequest request, 
        @RequestParam("categoryNo") int categoryNo,
        @RequestParam(name = "page", defaultValue = "1") int page, // 기본값은 1로 설정
        Model model
    ) throws Exception {
        request.setCharacterEncoding("utf-8");
        
        int pageSize = 10;
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<NoticeVO> noticesList = noticeService.selectNoticesByCategoryWithPagination(categoryNo, start, pageSize);
        model.addAttribute("noticesList", noticesList);
        
        // 페이지 번호와 총 페이지 개수 계산하여 전달
        int totalCount = noticeService.selectTotalNoticeCountByCategory(categoryNo);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("categoryNo", categoryNo);

        return "cs/cs_notice_list";
    }
    
	// 4. [일반] 고객센터 - 공지사항 상세
	@GetMapping("/cs/notice/detail")
	public String showNoticeDetail(HttpServletRequest request, @RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    // 공지사항 번호로 공지사항 정보를 가져옴
	    NoticeVO notice = noticeService.getNoticeByNoticeNo(noticeNo);
	    // Model에 데이터를 추가하여 JSP로 전달
	    model.addAttribute("notice", notice);
	    return "cs/cs_notice_detail";
	}
    
    /* 관리자 */
    
    // 5. [관리자] 공지사항 메인
	@GetMapping("/admin/notice")
	public String adminNotice(HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
		) throws Exception {
	        // 한 페이지에 보여질 공지사항 개수
	        int pageSize = 10;
	        
	        // 페이지 번호와 총 페이지 개수를 계산하여 전달
	        int totalCount = noticeService.selectTotalNoticeCount();
	        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
	        request.setAttribute("currentPage", page);
	        request.setAttribute("totalPages", totalPages);

	        // 페이지 시작점과 끝점을 계산
	        int start = (page - 1) * pageSize;
	        int end = start + pageSize;

	        List<NoticeVO> noticesList = noticeService.selectAllNoticeListWithPagination(start, pageSize);
	        request.setAttribute("noticesList", noticesList);

		return "admin/admin_notice";
	}
	
	// 6. [관리자] 공지사항 목록
	@GetMapping("/admin/notice/listNotices")
	public String adminlistNotices(
	    HttpServletRequest request,
	    HttpServletResponse response,
	    @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
	) throws Exception {
	    // 한 페이지에 보여질 공지사항 개수
	    int pageSize = 10;
	    
	    // 페이지 번호와 총 페이지 개수를 계산하여 전달
	    int totalCount = noticeService.selectTotalNoticeCount();
	    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
	    request.setAttribute("currentPage", page);
	    request.setAttribute("totalPages", totalPages);
	
	    // 페이지 시작점과 끝점을 계산
	    int start = (page - 1) * pageSize;
	    int end = start + pageSize;
	
	    List<NoticeVO> noticesList = noticeService.selectAllNoticeListWithPagination(start, pageSize);
	    request.setAttribute("noticesList", noticesList);
	
	    return "admin/admin_notice_list";
	}
    
    // 7. [관리자] 공지사항 목록 - 카테고리 필터링
	@GetMapping("/admin/notice/listNoticesByCategory")
    public String adminlistNoticesByCategory(
            HttpServletRequest request, 
            @RequestParam("categoryNo") int categoryNo,
            @RequestParam(name = "page", defaultValue = "1") int page, // 기본값은 1로 설정
            Model model
        ) throws Exception {
            request.setCharacterEncoding("utf-8");
            
            int pageSize = 10;
            int start = (page - 1) * pageSize;
            int end = start + pageSize;

            List<NoticeVO> noticesList = noticeService.selectNoticesByCategoryWithPagination(categoryNo, start, pageSize);
            model.addAttribute("noticesList", noticesList);
            
            // 페이지 번호와 총 페이지 개수 계산하여 전달
            int totalCount = noticeService.selectTotalNoticeCountByCategory(categoryNo);
            int totalPages = (int) Math.ceil((double) totalCount / pageSize);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("categoryNo", categoryNo);

            return "admin/admin_notice_list";
    }
    
	// 8. [관리자] 공지사항 작성 페이지로 이동
    @GetMapping(value="/notice/noticeForm")
    public String showNoticeForm() throws Exception {    
        return "admin/admin_noticeForm";
    }
    
    // 9. [관리자] 공지사항 등록
    @PostMapping("/notice/insertNotice")
    @ResponseBody
    public String insertNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO) throws Exception {
        try {
            int result = noticeService.insertNotice(noticeVO);
            if (result > 0) {
                return "success";
            } else {
                return "error";
            }
        } catch (Exception e) {
            return "error";
        }
    }
    
    // 10. [관리자] 공지사항 수정 페이지로 이동
    @GetMapping("/notice/noticeUpdateForm")
    public String showNoticeUpdateForm(HttpServletRequest request, @RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        // 공지사항 번호로 공지사항 정보를 가져옴
        NoticeVO notice = noticeService.getNoticeByNoticeNo(noticeNo);
        // Model에 데이터를 추가하여 JSP로 전달
        model.addAttribute("notice", notice);
		return "admin/admin_noticeUpdateForm";
    }
    
    // 11. [관리자] 공지사항 수정
    @PostMapping("/notice/updateNotice")
    @ResponseBody
    public String updateNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO) throws Exception {
        try {
            int result = noticeService.updateNotice(noticeVO);
            if (result > 0) {
                return "success";
            } else {
                return "error";
            }
        } catch (Exception e) {
            return "error";
        }
    }
    
    // 12. [관리자] 공지사항 삭제
    @PostMapping("/notice/remove")
    public String removeNotices(@RequestParam(value = "selectedNotices[]", required = false) List<Integer> selectedNoticeNos, RedirectAttributes redirectAttributes) throws Exception {
        if (selectedNoticeNos != null && !selectedNoticeNos.isEmpty()) {
            int result = noticeService.removeNotices(selectedNoticeNos);
            if (result > 0) {
                redirectAttributes.addFlashAttribute("success");
            } else {
                // 삭제가 실패하면 에러 메시지를 리다이렉트하여 표시
                redirectAttributes.addFlashAttribute("error");
            }
        } else {
            redirectAttributes.addFlashAttribute("error");
        }
        return "redirect:/admin/notice";
    }
}
//	//search test
//	@PostMapping("/search")
//	public String searchNotices(@RequestParam("searchKeyword") String searchKeyword, Model model) {
//	    List<NoticeVO> searchResults = noticeService.searchNoticesByTitle(searchKeyword);
//	    model.addAttribute("searchResults", searchResults);
//	    return "cs/searchResults";
//	}
//	
//}