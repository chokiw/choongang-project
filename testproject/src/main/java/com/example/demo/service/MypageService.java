package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MypageDAO;
import com.example.demo.model.Alarm;
import com.example.demo.model.Runner;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageService {
	private final MypageDAO dao;

	public Runner getMember(String user_id) {
		return dao.getMember(user_id);
	}

	public Alarm[] getAlarm(String user_id) {
		return dao.getAlarm(user_id);
	}
}
