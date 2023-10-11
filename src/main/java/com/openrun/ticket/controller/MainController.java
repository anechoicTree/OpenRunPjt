package com.openrun.ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.openrun.ticket.vo.NoticeVO;

@Controller
public class MainController {
	
    @RequestMapping(value={"/"}, method = RequestMethod.GET)
    public String listNotices(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "main";
    }
}