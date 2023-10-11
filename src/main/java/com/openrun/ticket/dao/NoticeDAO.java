package com.openrun.ticket.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.NoticeVO;

public interface NoticeDAO {
	public List selectAllNoticeList() throws DataAccessException;
	public List<NoticeVO> selectAllNoticeListWithPagination(int start, int pageSize);
	public List<NoticeVO> selectNoticesByCategory(int categoryNo);
	int selectTotalNoticeCount();
	public NoticeVO getNoticeByNoticeNo(int noticeNo) throws DataAccessException;
	public int insertNotice(NoticeVO noticeVO) throws DataAccessException;
	public int updateNotice(NoticeVO noticeVO) throws DataAccessException;
	public int removeNotice(int noticeNo) throws DataAccessException;
}
