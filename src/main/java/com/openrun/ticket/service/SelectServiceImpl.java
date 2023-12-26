package com.openrun.ticket.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.openrun.ticket.dao.SelectDAO;
import com.openrun.ticket.vo.SelectVO;

@Service
public class SelectServiceImpl implements SelectService {
	
	private SelectDAO selectDAO;
	public void setSelectDAO(SelectDAO selectDAO){
	   this.selectDAO = selectDAO;
	}

    @Override
    public List<SelectVO> getAllTicketsOrderBySelectNo() {
        return selectDAO.getAllTicketsOrderBySelectNo();
    }
}
