package com.openrun.ticket.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.GuideVO;

public interface GuideDAO {
	public List selectAllGuideList() throws DataAccessException;
	public List<GuideVO> selectAllGuideListWithPagination(int start, int pageSize);
	public List<GuideVO> selectGuidesByCategory(int categoryNo);
	int selectTotalGuideCount();
	public GuideVO getGuideByGuideNo(int guideNo) throws DataAccessException;
	public int insertGuide(GuideVO guideVO) throws DataAccessException;
	public int updateGuide(GuideVO guideVO) throws DataAccessException;
	public int removeGuide(int guideNo) throws DataAccessException;
}
