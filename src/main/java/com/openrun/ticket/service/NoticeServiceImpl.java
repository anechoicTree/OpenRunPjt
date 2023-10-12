package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.NoticeDAO;
import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.NoticeVO;

/*@Transactional(propagation=Propagation.REQUIRED) */
@Service
public class NoticeServiceImpl implements NoticeService{
	   private NoticeDAO noticeDAO;
	   public void setNoticeDAO(NoticeDAO noticeDAO){
	      this.noticeDAO = noticeDAO;
	   }

	   @Override
	   public List listNotices() throws DataAccessException {
	      List noticesList = null;
	      noticesList = noticeDAO.selectAllNoticeList();
	      return noticesList;
	   }	   

	   @Override
	   public List<NoticeVO> selectAllNoticeListWithPagination(int start, int pageSize) throws DataAccessException {
		   return noticeDAO.selectAllNoticeListWithPagination(start, pageSize);
	   }
		
	   @Override
	   public int selectTotalNoticeCount() throws DataAccessException {
		   return noticeDAO.selectTotalNoticeCount();
	   }

	   @Override
	   public NoticeVO getNoticeByNoticeNo(int noticeNo) throws DataAccessException {
	       return noticeDAO.getNoticeByNoticeNo(noticeNo);
	   }
	   
	   @Override
	   public List<NoticeVO> selectNoticesByCategory(int categoryNo) {
		   return noticeDAO.selectNoticesByCategory(categoryNo);
	   }
	   
	   @Override
	   public int insertNotice(NoticeVO noticeVO) throws DataAccessException {
		   return noticeDAO.insertNotice(noticeVO);
	   }
	   
	   @Override
	   public int updateNotice(NoticeVO noticeVO) throws DataAccessException {
		   System.out.println("서비스 : " + noticeDAO.updateNotice(noticeVO));
		   return noticeDAO.updateNotice(noticeVO);
		   
	   }
	   
	   @Override
	   public int removeNotices(List<Integer> noticeNos) throws DataAccessException {
	       int result = 0;
	       for (Integer noticeNo : noticeNos) {
	           result += noticeDAO.removeNotice(noticeNo);
	       }
	       return result;
	   }
	   
	   @Override
	   public List<NoticeVO> searchNoticesByTitle(String searchKeyword) {
	       return noticeDAO.searchNoticesByTitle(searchKeyword);
	   }
}