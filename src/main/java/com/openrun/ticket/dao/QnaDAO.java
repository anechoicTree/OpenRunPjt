package com.openrun.ticket.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.QnaVO;
import com.openrun.ticket.vo.QnaVO;

public interface QnaDAO {
	public int insertQna(QnaVO qnaVO) throws DataAccessException;
	public List selectAllQnaList() throws DataAccessException;
	public List<QnaVO> selectAllQnaListWithPagination(int start, int pageSize);
	public List<QnaVO> selectQnasByCategoryWithPagination(int categoryNo, int start, int pageSize);
	public int selectTotalQnaCount();
	public int selectTotalQnaCountByCategory(int categoryNo) throws DataAccessException;
	public QnaVO getQnaByQnaNo(int qnaNo) throws DataAccessException;
}