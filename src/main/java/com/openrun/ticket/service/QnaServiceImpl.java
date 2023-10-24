package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.QnaDAO;
import com.openrun.ticket.vo.QnaVO;
import com.openrun.ticket.vo.QnaVO;

/*@Transactional(propagation=Propagation.REQUIRED) */
@Service
public class QnaServiceImpl implements QnaService{
	   
	private QnaDAO qnaDAO;
	
	public void setQnaDAO(QnaDAO qnaDAO){
      this.qnaDAO = qnaDAO;
   }
	   
   @Override
   public int insertQna(QnaVO qnaVO) throws DataAccessException {
	   return qnaDAO.insertQna(qnaVO);
   }
   
   @Override
   public List listQnas() throws DataAccessException {
      List qnasList = null;
      qnasList = qnaDAO.selectAllQnaList();
      return qnasList;
   }	   

   @Override
   public List<QnaVO> selectAllQnaListWithPagination(int start, int pageSize) throws DataAccessException {
	   return qnaDAO.selectAllQnaListWithPagination(start, pageSize);
   }
	
   @Override
   public int selectTotalQnaCount() throws DataAccessException {
	   return qnaDAO.selectTotalQnaCount();
   }

   @Override
   public QnaVO getQnaByQnaNo(int qnaNo) throws DataAccessException {
       return qnaDAO.getQnaByQnaNo(qnaNo);
   }
   
   @Override
   public List<QnaVO> selectQnasByCategoryWithPagination(int categoryNo, int start, int pageSize) throws DataAccessException {
	   return qnaDAO.selectQnasByCategoryWithPagination(categoryNo, start, pageSize);
   }
   
   @Override
   public int selectTotalQnaCountByCategory(int categoryNo) throws DataAccessException {
	   return qnaDAO.selectTotalQnaCountByCategory(categoryNo);
   }

}