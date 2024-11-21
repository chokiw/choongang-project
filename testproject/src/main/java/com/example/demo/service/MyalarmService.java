package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MyalarmDAO;
import com.example.demo.model.Alarm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyalarmService {
	private final MyalarmDAO dao;

	public int getTotal(Alarm alarm) {
		return dao.getTotal(alarm);
	}

	public List<Alarm> alarmList(Alarm alarm) {
		return dao.alarmList(alarm);
	}

	public Alarm getDetail(int alarm_no) {
		return dao.getDetail(alarm_no);
	}

	public String getWriterID(int recruit_no) {
		return dao.getWriterID(recruit_no);
	}

	public void read(int alarm_no) {
		dao.read(alarm_no);		
	}
}
