package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.NoticeVO;

public interface NoticeService {
	 public List listNotices() throws DataAccessException;
	 public NoticeVO getNoticeByNoticeNo(int noticeNo) throws DataAccessException;
	 public List<NoticeVO> selectAllNoticeListWithPagination(int start, int pageSize) throws DataAccessException;
	 public List<NoticeVO> selectNoticesByCategoryWithPagination(int categoryNo, int start, int pageSize) throws DataAccessException;
	 public int selectTotalNoticeCount() throws DataAccessException;
	 public int selectTotalNoticeCountByCategory(int categoryNo) throws DataAccessException;
	 public int insertNotice(NoticeVO noticeVO) throws DataAccessException;
	 public int updateNotice(NoticeVO noticeVO) throws DataAccessException;
	 public int removeNotices(List<Integer> noticeNos) throws DataAccessException;
	 //List<NoticeVO> searchNoticesByTitle(String searchKeyword);
}