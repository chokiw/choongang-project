package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.KiwonDAO;
import com.example.demo.dao.MateReplyDAO;
import com.example.demo.model.Alarm;
import com.example.demo.model.MateReplyBoard;
import com.example.demo.model.RecruitBoard;

@Service
public class KiwonService {
	@Autowired
	private KiwonDAO dao;

	

	public int getTotal(Alarm alarm) {
		return dao.getTotal(alarm);
	}



	public List<Alarm> alarmList(Alarm alarm) {
		return dao.alarmList(alarm);
	}

	
	
}