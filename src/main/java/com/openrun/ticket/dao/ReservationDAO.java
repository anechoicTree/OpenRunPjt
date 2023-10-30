package com.openrun.ticket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;

public interface ReservationDAO {
	public int insertReservation(Map<String,Object> params);
	public int cancelPayment(@PathVariable(value= "merchant_uid") String merchant_uid);
	public List<String> exProduct();
	public List<String> exProductDetail(int p_no);
}
