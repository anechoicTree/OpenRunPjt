package com.openrun.ticket.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.UserDAO;
import com.openrun.ticket.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	private UserDAO userDAO;
	
	public void setUserDAO(UserDAO userDAO){
	      this.userDAO = userDAO;
	   }
	
	@Override
	public List<UserVO> user() throws Exception {
		// TODO Auto-generated method stub
		return userDAO.user();
	}
	@Override
	 public void insertUser(UserVO userVO) throws Exception{
		userDAO.insertUser(userVO);
	}
	@Override
	public boolean isIdAvailable(String u_id) {
        int count = userDAO.idCheck(u_id);
        return count == 0;
    }
	@Override
	public UserVO Login(UserVO userVO) {
		return userDAO.Login(userVO);
	}
	@Override
	public UserVO findIdCheck(UserVO userVO) {
		return userDAO.findIdCheck(userVO);
	}
	@Override
	public UserVO findPwCheck(UserVO userVO) {
		return userDAO.findPwCheck(userVO);
	}
	@Override
	public String pwChange(UserVO userVO){
		return userDAO.pwChange(userVO);
	}

	
}
