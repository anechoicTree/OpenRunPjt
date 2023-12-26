package com.openrun.ticket.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.openrun.ticket.vo.QnaVO;
import com.openrun.ticket.vo.QnaVO;

public interface QnaService {
	 public int insertQna(QnaVO qnaVO) throws DataAccessException;
	 public List listQnas() throws DataAccessException;
	 public QnaVO getQnaByQnaNo(int qnaNo) throws DataAccessException;
	 public List<QnaVO> selectAllQnaListWithPagination(int start, int pageSize) throws DataAccessException;
	 public List<QnaVO> selectQnasByCategoryWithPagination(int categoryNo, int start, int pageSize) throws DataAccessException;
	 public int selectTotalQnaCount() throws DataAccessException;
	 public int selectTotalQnaCountByCategory(int categoryNo) throws DataAccessException;
}