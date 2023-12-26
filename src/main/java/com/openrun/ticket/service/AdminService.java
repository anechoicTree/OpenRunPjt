package com.openrun.ticket.service;

import javax.servlet.http.HttpSession;
import com.openrun.ticket.vo.AdminVO;

public interface AdminService {

	public boolean loginCheck(AdminVO adminVO, HttpSession session) throws Exception;    //관리자 로그인을 체크하는 메소드
}
