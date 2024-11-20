package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.RecordDAO;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RecordService {
	private final RecordDAO dao;

	public int setRunnerdata(Runner_data rd) {
		return dao.setRunnerdata(rd);
	}

	public void setCoordinate(Coordinate coord) {
		dao.setCoordinate(coord);
	}

	public Runner getMember_SJL(String user_id) {
		return dao.getMember_SJL(user_id);
	}

	public void updateRunnerdata(Runner runner) {
		dao.updateRunnerdata(runner);
	}
}
