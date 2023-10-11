package com.openrun.ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        // 한 페이지에 보여질 공지사항 개수
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

//    @GetMapping("/cs/seller")
//	public String csSeller(HttpServletRequest request,
//        HttpServletResponse response,
//        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
//		) throws Exception {
//	        // 한 페이지에 보여질 공지사항 개수
//	        int pageSize = 10;
//	        
//	        // 페이지 번호와 총 페이지 개수를 계산하여 전달
//	        int totalCount = sellerService.selectTotalSellerCount();
//	        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
//	        request.setAttribute("currentPage", page);
//	        request.setAttribute("totalPages", totalPages);
//
//	        // 페이지 시작점과 끝점을 계산
//	        int start = (page - 1) * pageSize;
//	        int end = start + pageSize;
//
//	        List<SellerVO> sellersList = sellerService.selectAllSellerListWithPagination(start, pageSize);
//	        request.setAttribute("sellersList", sellersList);
//
//		return "cs/cs_seller";
//	}

    @GetMapping("/cs/seller/detail")
    public String showSellerDetail(HttpServletRequest request, @RequestParam("seller_no") int seller_no, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        // 공지사항 번호로 공지사항 정보를 가져옴
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
        // 한 페이지에 보여질 공지사항 개수
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
	        // 한 페이지에 보여질 공지사항 개수
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
	
}