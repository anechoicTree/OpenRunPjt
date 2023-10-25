package com.openrun.ticket.service;

import java.util.List;

import com.openrun.ticket.vo.UserVO;

public interface UserService {
	public List<UserVO> user() throws Exception;
	public void insertUser(UserVO userVO) throws Exception;
	public boolean isIdAvailable(String u_id);
	public UserVO Login(UserVO userVO);
	public UserVO findIdCheck(UserVO userVO);
	public UserVO findPwCheck(UserVO userVO);
	public int pwChange(UserVO userVO);
	public int withdrawal(UserVO userVO) throws Exception;
	public UserVO modificationPwCheck(UserVO userVO);
	public int modification(UserVO userVO);
}
