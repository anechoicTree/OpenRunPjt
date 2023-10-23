package com.openrun.ticket.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.openrun.ticket.service.GuideService;
import com.openrun.ticket.vo.GuideVO;
import com.openrun.ticket.vo.GuideVO;

@Controller
public class GuideController /*implements GuideController*/ {

    private final GuideService guideService;
    
    // 이미지 업로드 폴더 경로
    private static final String UPLOAD_FOLDER = "/resources/admin/img";
    
	@Autowired
	private String uploadPath;
	@Autowired
	private SqlSession sqlSession;

    @Autowired
    public GuideController(GuideService guideService) {
        this.guideService = guideService;
    }
	 
	@Autowired
	private ServletContext servletContext;
	
	// 파일 이름 중복 방지를 위한 유일한 이름 생성
	private String generateUniqueFileName(String originalName) {
	    String uniqueFileName = UUID.randomUUID().toString();
	    String extension = FilenameUtils.getExtension(originalName);
	    return uniqueFileName + "." + extension;
	}

	// 이미지를 업로드 폴더에 저장하고 저장된 경로를 반환
	private String uploadImage(MultipartFile file, String fileName) throws IOException {
	    // 실제 파일이 저장되는 경로
	    String realPath = uploadPath + File.separator + fileName;
	    File destination = new File(realPath);
	    file.transferTo(destination);
	    
	    // 웹에서 이미지를 접근할 수 있는 상대 경로를 반환
	    return UPLOAD_FOLDER + "/" + fileName;
	}
 
	// 카테고리에 따른 번호 설정 (카테고리에 따라 로직을 수정해야 함)
	private int getCategoryNo(String category) {
	    int categoryNo = 0;
	    switch (category) {
	        case "예매":
	            categoryNo = 21;
	            break;
	        case "결제":
	            categoryNo = 22;
	            break;
	        case "취소":
	            categoryNo = 23;
	            break;
	        case "배송":
	            categoryNo = 24;
	            break;
	    }
	    return categoryNo;
	}
	
	// 1. [일반] 고객센터 - 이용가이드 메인
    @GetMapping("/cs/guide")
    public String listGuides(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
    ) throws Exception {
        // 한 페이지에 보여질 이용가이드 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = guideService.selectTotalGuideCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<GuideVO> guidesList = guideService.selectAllGuideListWithPagination(start, pageSize);
        request.setAttribute("guidesList", guidesList);

        return "cs/cs_guide";
    }
    
    // 2. [일반] 고객센터 - 이용가이드 목록
    @GetMapping("/cs/guide/listGuides")
    public String listGuidesAll(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
    ) throws Exception {
        // 한 페이지에 보여질 이용가이드 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = guideService.selectTotalGuideCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<GuideVO> guidesList = guideService.selectAllGuideListWithPagination(start, pageSize);
        request.setAttribute("guidesList", guidesList);

        return "cs/cs_guide";
    }
	
    // 3. [일반] 고객센터 - 이용가이드 목록 - 카테고리 필터링
	@GetMapping("/cs/guide/listGuidesByCategory")
    public String listGuidesByCategory(
            HttpServletRequest request, 
            @RequestParam("categoryNo") int categoryNo,
            @RequestParam(name = "page", defaultValue = "1") int page, // 기본값은 1로 설정
            Model model
        ) throws Exception {
        request.setCharacterEncoding("utf-8");
        
        int pageSize = 10;
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<GuideVO> guidesList = guideService.selectGuidesByCategoryWithPagination(categoryNo, start, pageSize);
        model.addAttribute("guidesList", guidesList);
        
        // 페이지 번호와 총 페이지 개수 계산하여 전달
        int totalCount = guideService.selectTotalGuideCountByCategory(categoryNo);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("categoryNo", categoryNo);

        return "cs/cs_guide_list";
    }
	
	// 4. [일반] 고객센터 - 이용가이드 상세
    @GetMapping("/cs/guide/detail")
    public String showGuideDetail(HttpServletRequest request, @RequestParam("guideNo") int guideNo, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        // 이용가이드 번호로 이용가이드 정보를 가져옴
        GuideVO guide = guideService.getGuideByGuideNo(guideNo);
        // Model에 데이터를 추가하여 JSP로 전달
        model.addAttribute("guide", guide);
        return "cs/cs_guide_detail";
    }
    
    /* 관리자 */
    
    // 5. [관리자] 이용가이드 메인
	@GetMapping("/admin/guide")
	public String adminGuide(HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
		) throws Exception {
	        // 한 페이지에 보여질 이용가이드 개수
	        int pageSize = 10;
	        
	        // 페이지 번호와 총 페이지 개수를 계산하여 전달
	        int totalCount = guideService.selectTotalGuideCount();
	        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
	        request.setAttribute("currentPage", page);
	        request.setAttribute("totalPages", totalPages);

	        // 페이지 시작점과 끝점을 계산
	        int start = (page - 1) * pageSize;
	        int end = start + pageSize;

	        List<GuideVO> guidesList = guideService.selectAllGuideListWithPagination(start, pageSize);
	        request.setAttribute("guidesList", guidesList);

		return "admin/admin_guide";
	}
    
    // 6. [관리자] 이용가이드 목록
    @GetMapping("/admin/guide/listGuides")
    public String adminlistGuides(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
    ) throws Exception {
        // 한 페이지에 보여질 이용가이드 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = guideService.selectTotalGuideCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<GuideVO> guidesList = guideService.selectAllGuideListWithPagination(start, pageSize);
        request.setAttribute("guidesList", guidesList);

        return "admin/admin_guide";
    }
    
    // 7. [관리자] 이용가이드 목록 - 카테고리 필터링
	@GetMapping("/admin/guide/listGuidesByCategory")
    public String adminlistGuidesByCategory(
            HttpServletRequest request, 
            @RequestParam("categoryNo") int categoryNo,
            @RequestParam(name = "page", defaultValue = "1") int page, // 기본값은 1로 설정
            Model model
        ) throws Exception {
        request.setCharacterEncoding("utf-8");
        
        int pageSize = 10;
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<GuideVO> guidesList = guideService.selectGuidesByCategoryWithPagination(categoryNo, start, pageSize);
        model.addAttribute("guidesList", guidesList);
        
        // 페이지 번호와 총 페이지 개수 계산하여 전달
        int totalCount = guideService.selectTotalGuideCountByCategory(categoryNo);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("categoryNo", categoryNo);

        return "cs/cs_guide_list";
    }
    
	// 8. [관리자] 이용가이드 작성 페이지로 이동
    @GetMapping(value="/guide/guideForm")
    public String showGuideForm() throws Exception {    
        return "admin/admin_guideForm";
    }

    // 9. [관리자] 이용가이드 등록
    @PostMapping("/guide/insertGuide")
    @ResponseBody
    public String insertGuide(
        @RequestParam("category") String category,
        @RequestParam("guideImage") MultipartFile guideImage
    ) {
        try {
            // 이미지 파일 업로드 처리
            String imgOriginName = guideImage.getOriginalFilename();
            String imgSaveName = generateUniqueFileName(imgOriginName); // 파일 이름 중복 방지를 위한 유일한 이름 생성
            String imgPath = uploadImage(guideImage, imgSaveName); // 이미지를 업로드 폴더에 저장하고 저장된 경로를 얻음

            // DB에 이미지 정보 저장
            GuideVO guideVO = new GuideVO();
            guideVO.setCategory(category);
            guideVO.setCategoryNo(getCategoryNo(category)); // getCategoryNo 메서드를 사용하여 카테고리에 따른 번호 설정
            guideVO.setImgOriginName(imgOriginName);
            guideVO.setImgSaveName(imgSaveName);
            guideVO.setImgPath(imgPath);

            int result = guideService.insertGuide(guideVO);
            System.out.println("이미지 저장");

            if (result > 0) {
                return "success";
            } else {
                return "error";
            }
        } catch (Exception e) {
            e.printStackTrace(); // 에러를 콘솔에 출력
            return "error";
        }
    }
    
    // 10. [관리자] 이용가이드 수정 페이지로 이동
    @GetMapping("/guide/guideUpdateForm")
    public String showGuideUpdateForm(HttpServletRequest request, @RequestParam("guideNo") int guideNo, Model model) throws Exception {
        request.setCharacterEncoding("utf-8");
        // 이용가이드 번호로 이용가이드 정보를 가져옴
        GuideVO guide = guideService.getGuideByGuideNo(guideNo);
        // Model에 데이터를 추가하여 JSP로 전달
        model.addAttribute("guide", guide);
		return "admin/admin_guideUpdateForm";
    }
    
    // 11. [관리자] 이용가이드 수정
    @PostMapping("/guide/updateGuide")
    public String updateGuide(@ModelAttribute("guideVO") GuideVO guideVO) throws Exception {
        try {
            int result = guideService.updateGuide(guideVO);
            if (result > 0) {
                return "admin/admin_main";
            } else {
                return "errorPage";
            }
        } catch (Exception e) {
            return "errorPage";
        }
    }
    
    // 12. [관리자] 이용가이드 삭제
    @PostMapping("/guide/remove")
    public String removeGuides(@RequestParam(value = "selectedGuides[]", required = false) List<Integer> selectedGuideNos, RedirectAttributes redirectAttributes) throws Exception {
        if (selectedGuideNos != null && !selectedGuideNos.isEmpty()) {
            int result = guideService.removeGuides(selectedGuideNos);
            if (result > 0) {
                redirectAttributes.addFlashAttribute("success");
            } else {
                // 삭제가 실패하면 에러 메시지를 리다이렉트하여 표시
                redirectAttributes.addFlashAttribute("error");
            }
        } else {
            redirectAttributes.addFlashAttribute("error");
        }
        return "redirect:/admin/guide";
    }
    
    // 메인 배너 테스트
    @GetMapping("/cs/guide/listGuidesTest")
    public String listGuidesAllTest(
        HttpServletRequest request,
        HttpServletResponse response,
        @RequestParam(name = "page", defaultValue = "1") int page // 기본값은 1로 설정
    ) throws Exception {
        // 한 페이지에 보여질 이용가이드 개수
        int pageSize = 10;
        
        // 페이지 번호와 총 페이지 개수를 계산하여 전달
        int totalCount = guideService.selectTotalGuideCount();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // 페이지 시작점과 끝점을 계산
        int start = (page - 1) * pageSize;
        int end = start + pageSize;

        List<GuideVO> guidesList = guideService.selectAllGuideListWithPagination(start, pageSize);
        request.setAttribute("guidesList", guidesList);

        // common/main_banner.jsp 페이지로 포워딩
        return "common/main_banner";
    }
    
    
}