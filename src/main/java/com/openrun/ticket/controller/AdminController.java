package com.openrun.ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.openrun.ticket.service.AdminService;
import com.openrun.ticket.service.UserService;
import com.openrun.ticket.vo.AdminVO;
import com.openrun.ticket.vo.UserVO;

@Controller
public class AdminController {
	
	private final AdminService adminService;
	private final UserService userService;

	@Autowired
	public AdminController(AdminService adminService, UserService userService) {
		this.adminService = adminService;
		this.userService = userService;
	}
	
    //메인 페이지에서 관리자 로그인 버튼을 클릭하면 맵핑되는 메소드
    //관리자 로그인 페이지로 이동시킨다.
    @GetMapping("/admin/login")
    public String admin_login_form() {
        return "admin/admin_login";
    }
    
    @GetMapping("/admin/main")
    public String adminMain() {
    	return "admin/admin_main";
    }
    
    //관리자 로그인 페이지에서 관리자 아이디와 패스워드를 입력후 로그인 버튼을 누를시에 맵핑되는 메소드
    //관리자 로그인을 할 수 있도록 한다.
    @PostMapping("/admin/admin_loginCheck")
    public String admin_login(String admin_id, String admin_pass, HttpSession session, Model model) throws Exception {
        AdminVO adminVO = new AdminVO();
        adminVO.setAdmin_id(admin_id);
        adminVO.setAdmin_pass(admin_pass);
        
        boolean result = adminService.loginCheck(adminVO, session);
        
        if (!result || session.getAttribute("admin_id") == null) {
            model.addAttribute("message", "관리자의 아이디 혹은 비밀번호가 일치하지 않습니다.");
            return "redirect:/admin/login";
        }
        
        return "redirect:/admin/main";
    }
    
    //관리자 페이지에서 로그아웃 버튼을 클릭해 세션을 종료하고 메인페이지로 돌아가게 하는 메소드
	@GetMapping("/admin/admin_logout")
	public String logout(HttpSession session) {
		session.invalidate();		
		return "/main";
	}

	// User 목록 불러오기
	@GetMapping("/admin/member")
	public String adminlistMembers(HttpServletRequest request, HttpServletResponse response, @RequestParam(name ="page", defaultValue = "1") int page) throws Exception {
		// 한 페이지에 보여질 개수
		int pageSize = 10;
		
		// 페이지 번호와 총 페이지 개수를 계산하여 전달
		int totalCount = userService.selectTotalUserCount();
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		
		// 페이지 시작 계산
		int start = (page - 1) * pageSize;
		
		List<UserVO> usersList = userService.selectAllUserListWithPagination(start, pageSize);
		request.setAttribute("usersList", usersList);
		
		return "admin/admin_member";
	}
	
	// User 목록 불러오기
	@GetMapping("/admin/member/listMembers")
	public String adminlistMembers2(HttpServletRequest request, HttpServletResponse response, @RequestParam(name ="page", defaultValue = "1") int page) throws Exception {
		// 한 페이지에 보여질 개수
		int pageSize = 10;
		
		// 페이지 번호와 총 페이지 개수를 계산하여 전달
		int totalCount = userService.selectTotalUserCount();
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		request.setAttribute("currentPage", page);
		request.setAttribute("totalPages", totalPages);
		
		// 페이지 시작 계산
		int start = (page - 1) * pageSize;
		
		List<UserVO> usersList = userService.selectAllUserListWithPagination(start, pageSize);
		request.setAttribute("usersList", usersList);
		
		return "admin/admin_user_list";
	}
    
}
