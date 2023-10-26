package com.openrun.ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.UserVO;

public interface UserDAO {
	public List<UserVO> user() throws Exception;
	public void insertUser(UserVO userVO) throws Exception;
	public int idCheck(String u_id);
	public UserVO Login(UserVO userVO);
	public UserVO findIdCheck(UserVO userVO);
	public UserVO findPwCheck(UserVO userVO);
	public int pwChange(UserVO userVO);
	public int withdrawal(UserVO userVO) throws Exception;
	public UserVO modificationPwCheck(UserVO userVO);
	public int modification(UserVO userVO);
	public List<Map<String, Object>> listWithPagination(int start, int pageSize) throws DataAccessException;
	public int reservationCount() throws DataAccessException;
}
