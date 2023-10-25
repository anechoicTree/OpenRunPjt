package com.openrun.ticket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.openrun.ticket.service.AdminService;
import com.openrun.ticket.vo.AdminVO;

@Controller
public class AdminController {
	
	private final AdminService adminService;

	@Autowired
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
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

    

}
