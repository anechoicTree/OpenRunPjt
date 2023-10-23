package com.openrun.ticket.service;

import java.util.List;

import com.openrun.ticket.vo.SelectVO;

public interface SelectService {
	List<SelectVO> getAllTicketsOrderBySelectNo();
}
