package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.FaqVO;
import com.openrun.ticket.vo.GuideVO;
import com.openrun.ticket.vo.GuideVO;

public interface GuideService {
	 public List listGuides() throws DataAccessException;
	 public GuideVO getGuideByGuideNo(int guideNo) throws DataAccessException;
	 public List<GuideVO> selectAllGuideListWithPagination(int start, int pageSize) throws DataAccessException;
	 public List<GuideVO> selectGuidesByCategoryWithPagination(int categoryNo, int start, int pageSize) throws DataAccessException;
	 public int selectTotalGuideCount() throws DataAccessException;
	 public int selectTotalGuideCountByCategory(int categoryNo) throws DataAccessException;
	 public int insertGuide(GuideVO guideVO) throws DataAccessException;
	 public int updateGuide(GuideVO guideVO) throws DataAccessException;
	 public int removeGuides(List<Integer> guideNos) throws DataAccessException;

}