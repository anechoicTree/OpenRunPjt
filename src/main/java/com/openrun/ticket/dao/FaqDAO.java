package com.openrun.ticket.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.openrun.ticket.vo.FaqVO;

public interface FaqDAO {
	public List selectAllFaqList() throws DataAccessException;
	public List<FaqVO> selectAllFaqListWithPagination(int start, int pageSize);
	public List<FaqVO> selectFaqsByCategory(int categoryNo);
	int selectTotalFaqCount();
	public FaqVO getFaqByFaqNo(int faqNo) throws DataAccessException;
	public int insertFaq(FaqVO faqVO) throws DataAccessException;
	public int updateFaq(FaqVO faqVO) throws DataAccessException;
	public int removeFaq(int faqNo) throws DataAccessException;

}
