package com.openrun.ticket.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.UserDAO;
import com.openrun.ticket.vo.NoticeVO;
import com.openrun.ticket.vo.ProductVO;
import com.openrun.ticket.vo.ReservationVO;
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
	public int pwChange(UserVO userVO){
		return userDAO.pwChange(userVO);
	}
	@Override
	public int withdrawal(UserVO userVO) throws Exception{
		return userDAO.withdrawal(userVO);
	}
	@Override
	public UserVO modificationPwCheck(UserVO userVO) {
		return userDAO.modificationPwCheck(userVO);
	}
	@Override
	public int modification(UserVO userVO) {
		return userDAO.modification(userVO);
	}
	@Override
	public List<Map<String, Object>> listWithPagination(int start, int pageSize) throws DataAccessException {
		return userDAO.listWithPagination(start, pageSize);
	}
	@Override
	public int reservationCount() throws DataAccessException {
		return userDAO.reservationCount();
	}
	@Override
	public List<Map<String, Object>> lisCategorytWithPagination(String p_category, int start, int pageSize) throws DataAccessException {
		return userDAO.lisCategorytWithPagination(p_category, start, pageSize);
	}
	@Override
	public int reservationCategoryCount(String p_category) throws DataAccessException {
		return userDAO.reservationCategoryCount(p_category);
	}
	@Override
	public List<Map<String, Object>> reservationListDetail(int r_no) throws DataAccessException {
		return userDAO.reservationListDetail(r_no);
	}
	
	@Override
	public List<Map<String, Object>> cancelListWithPagination(int start, int pageSize) throws DataAccessException {
		return userDAO.cancelListWithPagination(start, pageSize);
	}
	@Override
	public int cancelReservationCount() throws DataAccessException {
		return userDAO.cancelReservationCount();
	}
	@Override
	public List<Map<String, Object>> cancelLisCategorytWithPagination(String p_category, int start, int pageSize) throws DataAccessException {
		return userDAO.cancelLisCategorytWithPagination(p_category, start, pageSize);
	}
	@Override
	public int cancelReservationCategoryCount(String p_category) throws DataAccessException {
		return userDAO.cancelReservationCategoryCount(p_category);
	}
	@Override
	public List<Map<String, Object>> cancelReservationListDetail(int r_no) throws DataAccessException {
		return userDAO.cancelReservationListDetail(r_no);
	}


}
