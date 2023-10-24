package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.SellerDAO;
import com.openrun.ticket.vo.SellerVO;

/*@Transactional(propagation=Propagation.REQUIRED) */
@Service
public class SellerServiceImpl implements SellerService{
	   
	private SellerDAO sellerDAO;
	
	public void setSellerDAO(SellerDAO sellerDAO){
		this.sellerDAO = sellerDAO;
	}

	@Override
	public List listSellers() throws DataAccessException {
		List sellersList = null;
		sellersList = sellerDAO.selectAllSellerList();
		return sellersList;
	}	   

	@Override
	public List<SellerVO> selectAllSellerListWithPagination(int start, int pageSize) throws DataAccessException {
		return sellerDAO.selectAllSellerListWithPagination(start, pageSize);
	}

	@Override
	public int selectTotalSellerCount() throws DataAccessException {
		return sellerDAO.selectTotalSellerCount();
	}

	@Override
	public SellerVO getSellerBySellerNo(int seller_no) throws DataAccessException {
		return sellerDAO.getSellerBySellerNo(seller_no);
	}

	@Override
	public int approvalSeller(List<Integer> seller_nos) throws DataAccessException {
		int result = 0;
		for (Integer seller_no : seller_nos) {
			result += sellerDAO.approvalSeller(seller_no);
		}
		return result;
	}
		
	// 혜빈
	
	@Override
	public void insertSeller(SellerVO sellerVO) throws Exception{
		sellerDAO.insertSeller(sellerVO);
	}
	@Override
	public boolean isIdAvailable(String s_id) {
	    int count = sellerDAO.idCheck(s_id);
	    return count == 0;
	}
	@Override
	public SellerVO Login(SellerVO sellerVO) {
		return sellerDAO.Login(sellerVO);
	}
	@Override
	public SellerVO findIdCheck(SellerVO sellerVO) {
		return sellerDAO.findIdCheck(sellerVO);
	}
	@Override
	public SellerVO findPwCheck(SellerVO sellerVO) {
		return sellerDAO.findPwCheck(sellerVO);
	}
	@Override
	public String pwChange(SellerVO sellerVO){
		return sellerDAO.pwChange(sellerVO);
	}
	@Override
	public int withdrawal(SellerVO sellerVO) throws Exception{
		return sellerDAO.withdrawal(sellerVO);
	}
	
	   
}