package com.openrun.ticket.dao;

import java.util.List;

import com.openrun.ticket.vo.SelectVO;

public interface SelectDAO {
	List<SelectVO> getAllTicketsOrderBySelectNo();
}
