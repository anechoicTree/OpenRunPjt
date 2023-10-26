package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.NoticeVO;
import com.openrun.ticket.vo.UserVO;

public interface UserService {
	public List<UserVO> user() throws Exception;
	public void insertUser(UserVO userVO) throws Exception;
	public boolean isIdAvailable(String u_id);
	public UserVO Login(UserVO userVO);
	public UserVO findIdCheck(UserVO userVO);
	public UserVO findPwCheck(UserVO userVO);
	public String pwChange(UserVO userVO);
	
	public List<UserVO> selectAllUserListWithPagination(int start, int pageSize) throws DataAccessException;
	public int selectTotalUserCount() throws DataAccessException;
}
