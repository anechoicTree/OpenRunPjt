package com.openrun.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Primary;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.openrun.ticket.vo.ReservationVO;
import com.openrun.ticket.vo.UserVO;

@Repository
@Primary
public class UserDAOImpl implements UserDAO{
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private static final String namespace="com.openrun.ticket.UserMapper";
	 
	 private SqlSession sqlSession;
	 
	 @Override
		public List<UserVO> user() throws Exception{
			// TODO Auto-generated method stub
			return sqlSession.selectList(namespace +".user");
	 }
	 @Override
	    public void insertUser(UserVO userVO) throws Exception {
	        sqlSession.insert(namespace + ".insertUser", userVO);
	 }
	 @Override
	 public int idCheck(String u_id) {
	        return sqlSession.selectOne(namespace + ".idCheck", u_id);
	 }
	 @Override
	 public UserVO Login(UserVO userVO) {
	        return sqlSession.selectOne(namespace + ".login", userVO);
	 }
	 @Override
	 public UserVO findIdCheck(UserVO userVO) {
	
		 return sqlSession.selectOne(namespace + ".findIdCheck", userVO);
		   
	 }
	 @Override
	 public UserVO findPwCheck(UserVO userVO) {
	
		 return sqlSession.selectOne(namespace + ".findPwCheck", userVO);
	 }
	 
	 @Override
	 public int pwChange(UserVO userVO) {
		
		 return sqlSession.update(namespace + ".pwChange", userVO);
 
	 }
	 @Override
	 public int withdrawal(UserVO userVO) throws Exception{	
		 
		 return sqlSession.delete(namespace + ".withdrawal", userVO);
	 }
	 @Override 
	 public UserVO modificationPwCheck(UserVO userVO) {
		 return sqlSession.selectOne(namespace + ".modificationPwCheck", userVO);
	 }
	 @Override
	 public int modification(UserVO userVO) {
		
		 return sqlSession.update(namespace + ".modification", userVO);

	 }
	 @Override
	 public List<Map<String, Object>> listWithPagination(int start, int pageSize) throws DataAccessException {
	     Map<String, Integer> params = new HashMap<>();
	     params.put("start", start);
	     params.put("pageSize", pageSize);
	     return sqlSession.selectList("com.openrun.ticket.reservationMapper.listWithPagination", params);
	 }
	 @Override
	 public int reservationCount() throws DataAccessException {
	     return sqlSession.selectOne("com.openrun.ticket.reservationMapper"+".reservationCount");
	 }
	 @Override
	 public int reservationCategoryCount(String p_category) throws DataAccessException {
	     return sqlSession.selectOne("com.openrun.ticket.reservationMapper"+".reservationCategoryCount");
	 }
	 @Override
	 public List<Map<String, Object>> lisCategorytWithPagination(String p_category, int start, int pageSize) throws DataAccessException {
	     Map<String, Object> params = new HashMap<>();
	     params.put("start", start);
	     params.put("pageSize", pageSize);
	     params.put("p_category", p_category);
	     return sqlSession.selectList("com.openrun.ticket.reservationMapper.lisCategorytWithPagination", params);
	 }
	 
}
