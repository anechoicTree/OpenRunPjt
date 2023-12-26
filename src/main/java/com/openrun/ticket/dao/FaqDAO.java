package com.openrun.ticket.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.FaqVO;

public interface FaqDAO {
	public List selectAllFaqList() throws DataAccessException;
	public List<FaqVO> selectAllFaqListWithPagination(int start, int pageSize);
	public List<FaqVO> selectFaqsByCategoryWithPagination(int categoryNo, int start, int pageSize);
	public int selectTotalFaqCount();
	public int selectTotalFaqCountByCategory(int categoryNo) throws DataAccessException;
	public FaqVO getFaqByFaqNo(int faqNo) throws DataAccessException;
	public int insertFaq(FaqVO faqVO) throws DataAccessException;
	public int updateFaq(FaqVO faqVO) throws DataAccessException;
	public int removeFaq(int faqNo) throws DataAccessException;

}
