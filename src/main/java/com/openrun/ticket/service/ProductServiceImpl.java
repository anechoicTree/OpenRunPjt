package com.openrun.ticket.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.ProductDAO;
import com.openrun.ticket.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	final static public int PRODUCT_PNUM_ALREADY_EXIST = 0;
	final static public int PRODUCT_REGISTER_SUCCESS = 1;
	final static public int PRODUCT_REGISTER_FAIL = -1;
	
    private ProductDAO productDAO;
    public void setProductDAO(ProductDAO productDAO){
       this.productDAO = productDAO;
    }

    @Override
	public int registerProductConfirm(ProductVO productVO) {
		System.out.println("[ProductService] registerProductConfirm");
		
		boolean isPNum = productDAO.isPNum(productVO.getP_no());
		
		
		if(!isPNum) {
			int result = productDAO.insertProduct(productVO);
			
			if(result > 0) {
				return PRODUCT_REGISTER_SUCCESS;
			} else {
				return PRODUCT_REGISTER_FAIL;
			}
		} else {
			return PRODUCT_PNUM_ALREADY_EXIST;
		}
	}
	
    @Override
	public List<ProductVO> searchProductConfirm(ProductVO productVO) {
		System.out.println("[ProductService] searchProductConfirm()");
		
		return productDAO.selectProductBySearch(productVO);
	}
    
    @Override
	public ProductVO productDetail(int p_no) {
		System.out.println("[ProductService] productDetail()");
		
		return productDAO.selectProduct(p_no);
	}
	
    @Override
	public ProductVO modifyProductForm(int p_no) {
		
		return productDAO.selectProduct(p_no);
	}
	
    @Override
	public int modifyProductConfirm(ProductVO productVO) {
		System.out.println("[ProductService] modifyProductConfirm()");
		
		return productDAO.updateProduct(productVO);
	}
	
    @Override
	public int deleteProductConfirm(int p_no) {
		System.out.println("[ProductService] deleteProductConfirm()");
		
		return productDAO.deleteProduct(p_no);
	}

	
    //product_sell_info.jsp 서비스 -DAO아직 없음 페이지창만 열리게 해둠
    @Override
    public ProductVO productSellInfo(int p_no) {
		System.out.println("[ProductService] productDetail()");
		
		return productDAO.selectProduct(p_no);
	}
	
	//product_review.jsp 서비스 -DAO아직 없음 페이지창만 열리게 해둠
    @Override
    public ProductVO productReview(int p_no) {
		System.out.println("[ProductService] productReview()");
		
		return productDAO.selectProduct(p_no);
	}
	
	//product_place_info.jsp 서비스 -DAO아직 없음 페이지창만 열리게 해둠
    @Override
    public ProductVO productPlaceInfo(int p_no) {
		System.out.println("[ProductService] productPlaceInfo()");
		
		return productDAO.selectProduct(p_no);
	}
	
	//product_place_info.jsp 서비스 -DAO아직 없음 페이지창만 열리게 해둠
	public boolean sellerProductList(int p_no) {
		System.out.println("[ProductService] sellerProductList()");
		
		return productDAO.sellerList(p_no);
	}
	
}
