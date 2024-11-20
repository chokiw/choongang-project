package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.TrackUpdateDAO;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TrackUpdateService {
	private final TrackUpdateDAO dao;

	public SnsBoard getboard(int int1) {
		return dao.getboard(int1);
	}

	public Runner_data getrdata(int runner_data_no) {
		return dao.getrdata(runner_data_no);
	}

	public Coordinate[] getcdata(int runner_data_no) {
		return dao.getcdata(runner_data_no);
	}

	public int updateboard(SnsBoard sns) {
		return dao.updateboard(sns);
	}
}
