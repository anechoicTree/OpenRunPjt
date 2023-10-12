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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.openrun.ticket.service.NoticeService;
import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.NoticeVO;

@Controller
public class NoticeController /*implements NoticeController*/ {

    private final NoticeService noticeService;

    @Autowired
    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }
    
    @GetMapping(value = {"/cs/notice", "/cs/notice/listNotices"})
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

//    @GetMapping("/cs/notice")
//	public String csNotice(HttpServletRequest request,
//        HttpServletResponse response,
//        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
//		) throws Exception {
//	        // 한 페이지에 보여질 공지사항 개수
//	        int pageSize = 10;
//	        
//	        // 페이지 번호와 총 페이지 개수를 계산하여 전달
//	        int totalCount = noticeService.selectTotalNoticeCount();
//	        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
//	        request.setAttribute("currentPage", page);
//	        request.setAttribute("totalPages", totalPages);
//
//	        // 페이지 시작점과 끝점을 계산
//	        int start = (page - 1) * pageSize;
//	        int end = start + pageSize;
//
//	        List<NoticeVO> noticesList = noticeService.selectAllNoticeListWithPagination(start, pageSize);
//	        request.setAttribute("noticesList", noticesList);
//
//		return "cs/cs_notice";
//	}
	
	@GetMapping("/cs/notice/listNoticesByCategory")
	public String listNoticesByCategory(HttpServletRequest request, @RequestParam("categoryNo") int categoryNo, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		List<NoticeVO> noticesList = noticeService.selectNoticesByCategory(categoryNo);
	    model.addAttribute("noticesList", noticesList);
	    return "cs/cs_notice_list";
	}
    
    @GetMapping("/cs/notice/detail")
    public String showNoticeDetail(HttpServletRequest request, @RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        // 공지사항 번호로 공지사항 정보를 가져옴
        NoticeVO notice = noticeService.getNoticeByNoticeNo(noticeNo);
        // Model에 데이터를 추가하여 JSP로 전달
        model.addAttribute("notice", notice);
        return "cs/cs_notice_detail";
    }
    
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

        return "admin/admin_notice";
    }
    
	@GetMapping("/admin/notice/listNoticesByCategory")
	public String adminlistNoticesByCategory(HttpServletRequest request, @RequestParam("categoryNo") int categoryNo, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		List<NoticeVO> noticesList = noticeService.selectNoticesByCategory(categoryNo);
	    model.addAttribute("noticesList", noticesList);
	    return "admin/admin_notice_list";
	}
    
    @GetMapping(value="/notice/noticeForm")
    public String showNoticeForm() throws Exception {    
        return "admin/admin_noticeForm";
    }
    
    @PostMapping("/notice/insertNotice")
    public String insertNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO) throws Exception {
        try {
            int result = noticeService.insertNotice(noticeVO);
            System.out.println(result);
            if (result > 0) {
                return "admin/admin_main";
            } else {
                return "errorPage";
            }
        } catch (Exception e) {
            return "errorPage";
        }
    }
    
    @GetMapping("/notice/noticeUpdateForm")
    public String showNoticeUpdateForm(HttpServletRequest request, @RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        // 공지사항 번호로 공지사항 정보를 가져옴
        NoticeVO notice = noticeService.getNoticeByNoticeNo(noticeNo);
        // Model에 데이터를 추가하여 JSP로 전달
        model.addAttribute("notice", notice);
		return "admin/admin_noticeUpdateForm";
    }
    
    @PostMapping("/notice/updateNotice")
    public String updateNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO) throws Exception {
        try {
            int result = noticeService.updateNotice(noticeVO);
            System.out.println(noticeVO.getCategory());
            System.out.println(noticeVO.getTitle());
            System.out.println(noticeVO.getBody());
            if (result > 0) {
                return "admin/admin_main";
            } else {
                return "admin/admin_main";
            }
        } catch (Exception e) {
            return "admin/admin_main";
        }
    }
    
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
	
}