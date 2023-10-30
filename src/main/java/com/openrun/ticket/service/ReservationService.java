package com.openrun.ticket.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

public interface ReservationService {
	public int insertReservation(Map<String,Object> params);
	public int cancelPayment(@PathVariable(value= "merchant_uid") String merchant_uid);
}
