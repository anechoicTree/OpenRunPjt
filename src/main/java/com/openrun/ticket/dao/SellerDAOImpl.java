package com.openrun.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.SellerVO;
import com.openrun.ticket.vo.UserVO;

public class SellerDAOImpl implements SellerDAO {

		private SqlSession sqlSession;

		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}

		@Override
		public List selectAllSellerList() throws DataAccessException {
			List<SellerVO> sellersList = null;
			sellersList = sqlSession.selectList("com.openrun.ticket.mappers.SellerMapper.selectAllSellerList");
			return sellersList;
		}
		
		@Override
		public List<SellerVO> selectAllSellerListWithPagination(int start, int pageSize) throws DataAccessException {
			Map<String, Integer> params = new HashMap<>();
	        params.put("start", start);
	        params.put("pageSize", pageSize);
	        return sqlSession.selectList("com.openrun.ticket.mappers.SellerMapper.selectAllSellerListWithPagination", params);
		};

	    @Override
	    public int selectTotalSellerCount() throws DataAccessException {
	        return sqlSession.selectOne("com.openrun.ticket.mappers.SellerMapper.selectTotalSellerCount");
	    }
		
		@Override
		public SellerVO getSellerBySellerNo(int seller_no) throws DataAccessException {
		    return sqlSession.selectOne("com.openrun.ticket.mappers.SellerMapper.getSellerBySellerNo", seller_no);
		}
		
		@Override
		public int approvalSeller(int seller_no) throws DataAccessException {
			int result = sqlSession.update("com.openrun.ticket.mappers.SellerMapper.approvalSeller", seller_no);
			return result;
		}
		
		// 혜빈
		
		private static final String namespace="com.openrun.ticket.mappers.SellerMapper";
		 
		 @Override
		 public void insertSeller(SellerVO sellerVO) throws Exception{
		        sqlSession.insert(namespace + ".insertSeller", sellerVO);
		 }
		 @Override
		 public int idCheck(String s_id) {
			    return sqlSession.selectOne(namespace + ".idCheck", s_id);
		 }
		 @Override
		 public SellerVO Login(SellerVO sellerVO) {
		        return sqlSession.selectOne(namespace + ".login", sellerVO);
		 }
		 @Override
		 public SellerVO findIdCheck(SellerVO sellerVO) {
		
			 	SellerVO result = sqlSession.selectOne(namespace + ".findIdCheck", sellerVO);
			    
			    if (result != null) {
			        // 사용자 정보를 찾았을 때 로그로 확인
			        System.out.println("사용자 정보를 찾았습니다");
			    } else {
			        // 사용자 정보를 찾지 못했을 때 로그로 확인
			        System.out.println("사용자 정보를 찾지 못했습니다.");
			    }

			    return result;
		 }
		@Override
		 public SellerVO findPwCheck(SellerVO sellerVO) {
		
			SellerVO result = sqlSession.selectOne(namespace + ".findPwCheck", sellerVO);
			    
			    if (result != null) {
			        // 사용자 정보를 찾았을 때 로그로 확인
			        System.out.println("사용자 정보를 찾았습니다 : " + result.getS_id());
			        System.out.println("사용자 정보를 찾았습니다 : " + result.getS_business_name());
			    } else {
			        // 사용자 정보를 찾지 못했을 때 로그로 확인
			        System.out.println("사용자 정보를 찾지 못했습니다.");
			    }

			    return result;
		 }
		 @Override
		 public int pwChange(SellerVO sellerVO) {
			
			 return sqlSession.selectOne(namespace + ".pwChange", sellerVO);		 
		 }
		 @Override
		 public int withdrawal(SellerVO sellerVO) throws Exception{	
			 
			 return sqlSession.delete(namespace + ".withdrawal", sellerVO);
		 }
		 @Override 
		 public SellerVO modificationPwCheck(SellerVO sellerVO) {
			 return sqlSession.selectOne(namespace + ".modificationPwCheck", sellerVO);
		 }
		 @Override
		 public int modification(SellerVO sellerVO) {
			
			 return sqlSession.update(namespace + ".modification", sellerVO);

		 }
}