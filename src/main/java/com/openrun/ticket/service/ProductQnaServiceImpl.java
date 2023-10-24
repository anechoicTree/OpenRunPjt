package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.ProductQnaDAO;
import com.openrun.ticket.vo.ProductQnaVO;

@Service
public class ProductQnaServiceImpl implements ProductQnaService{
	
	final static public int INUM_ALREADY_EXIST = 0;
	final static public int REGISTER_SUCCESS = 1;
	final static public int REGISTER_FAIL = -1;
	
	private ProductQnaDAO productQnaDAO;
	
	public void setProductQnaDAO(ProductQnaDAO productQnaDAO){
	      this.productQnaDAO = productQnaDAO;
	   }
	
	   @Override
	   public int insertProductQna(ProductQnaVO productQnaVO) throws DataAccessException {
		   return productQnaDAO.insertProductQna(productQnaVO);
	   }
	   
	   @Override
	   public List<ProductQnaVO> selectAllProductQna(ProductQnaVO productQnaVO) throws DataAccessException {
	        return productQnaDAO.selectAllProductQna(productQnaVO);
	   }
	   
	   @Override
	    public int registerInquiryConfirm(ProductQnaVO productQnaVO) {
			System.out.println("[ProductQnaService] registerInqruiyConfirm");
			
			//isINum은 i_no이 존재하는지 확인하는용도
			boolean isINum = productQnaDAO.isINum(productQnaVO.getI_no()); 
		    
			// isINum의 존재 여부에 따라 updateAnswer를 실행할지 말지 정하는 코드
			// update문을 사용할 것이므로 isINum이 true일때(i_no이 존재할 떄) updateAnswer가 실행된다
			// i_no이 존재하지 않으면 실패하도록 설계
		    if (isINum) { 
		        int result = productQnaDAO.updateAnswer(productQnaVO);
		        
		        if (result > 0) {
		            return REGISTER_SUCCESS;
		        } else {
		            return REGISTER_FAIL;
		        }
		    } else {
		        return INUM_ALREADY_EXIST;
		    }
		}
	   
	    @Override
		public ProductQnaVO productQnaDetail(int i_no) {
			System.out.println("[ProductQnaService] productQnaDetail()");
			
			return productQnaDAO.selectInquiry(i_no);
		}

}
