package com.openrun.ticket.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.AdminDAO;
import com.openrun.ticket.vo.AdminVO;

@Service    //서비스 빈으로 설정함
public class AdminServiceImpl implements AdminService {
 
	private AdminDAO adminDAO;
	public void setAdminDAO(AdminDAO adminDAO){
		this.adminDAO = adminDAO;
	}	
    
    @Override    //로그인 체크 관련 메소드 (세션에 아이디와 비밀번호를 저장함)
    public boolean loginCheck(AdminVO adminVO, HttpSession session) throws Exception {
        
        boolean result = adminDAO.loginCheck(adminVO);
        
        if(result) {    //로그인 성공
            
            session.setAttribute("admin_id", adminVO.getAdmin_id());
            session.setAttribute("admin_pass", adminVO.getAdmin_pass());
            
        }
        
        return result;
    }
}
