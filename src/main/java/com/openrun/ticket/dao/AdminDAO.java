package com.openrun.ticket.dao;

import com.openrun.ticket.vo.AdminVO;

public interface AdminDAO {

    boolean loginCheck(AdminVO adminVO) throws Exception;    //로그인을 체크하는 메소드
}
