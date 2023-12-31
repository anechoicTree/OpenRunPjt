package com.openrun.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Primary;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

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
	 public String pwChange(UserVO userVO) {
		
		 return sqlSession.selectOne(namespace + ".pwChange", userVO);
 
	 }
	 
	 @Override
	 public List<UserVO> selectAllUserListWithPagination(int start, int pageSize) throws DataAccessException {
	  	 Map<String, Integer> params = new HashMap<>();
         params.put("start", start);
         params.put("pageSize", pageSize);
         return sqlSession.selectList("com.openrun.ticket.mappers.UserMapper.selectAllUserListWithPagination", params);
 	 };

     @Override
     public int selectTotalUserCount() throws DataAccessException {
         return sqlSession.selectOne("com.openrun.ticket.mappers.UserMapper.selectTotalUserCount");
     }
}
