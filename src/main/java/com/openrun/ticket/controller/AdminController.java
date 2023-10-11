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
    @GetMapping("/admin/admin_login")
    public String admin_login_form() {
        return "admin/admin_login";
    }
    
    @GetMapping("/admin/admin_main")
    public String adminMain() {
    	return "admin/admin_main";
    }
    
    //관리자 로그인 페이지에서 관리자 아이디와 패스워드를 입력후 로그인 버튼을 누를시에 맵핑되는 메소드
    //관리자 로그인을 할 수 있도록 한다.
    @PostMapping("/admin/admin_loginCheck")
    public String admin_login(String admin_id, String admin_pass, HttpSession session, Model model) throws Exception {
        
        // 로그인 체크도 같이 함
        // DTO에 값들을 넣기 위해 객체를 생성한다.
        AdminVO adminVO = new AdminVO();
        
        adminVO.setAdmin_id(admin_id);
        adminVO.setAdmin_pass(admin_pass);
        
        // 로그인 체크를 하기 위한 메소드, 로그인 체크 후 결과를 result 변수에 넣는다.
        boolean result = adminService.loginCheck(adminVO, session);
        
        if (result) { // 로그인이 성공했을 시 출력되는 구문
            model.addAttribute("admin_id", session.getAttribute("admin_id"));
            return "admin/admin_main"; // 로그인이 성공했을 시 이동하게 되는 뷰의 이름
        } else if (session.getAttribute("admin_id") == null) { // 로그인 실패 했을 시 출력
            
            // 로그인이 실패했을 시에 다시 관리자 로그인 페이지로 이동함
            model.addAttribute("message", "관리자의 아이디 혹은 비밀번호가 일치하지 않습니다.");
            return "admin/admin_login";
        }
        
        return "admin/admin_login";
    }
    
    //관리자 페이지에서 로그아웃 버튼을 클릭해 세션을 종료하고 메인페이지로 돌아가게 하는 메소드
	@GetMapping("/admin/admin_logout")
	public String logout(HttpSession session) {
		session.invalidate();		
		return "/main";
	}

    

}
